//flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
//constants
import 'package:sns_vol2/constants/enums.dart';
import 'package:sns_vol2/constants/ints.dart';
import 'package:sns_vol2/constants/others.dart';
import 'package:sns_vol2/constants/strings.dart';
//domain
import 'package:sns_vol2/domain/mute_user_token/mute_user_token.dart';
import 'package:sns_vol2/domain/user_mute/user_mute.dart';
//models
import 'package:sns_vol2/models/main_model.dart';

final muteUsersProvider = ChangeNotifierProvider((ref) => MuteUsersModel());

class MuteUsersModel extends ChangeNotifier {
  bool showMuteUsers = false;
  List<DocumentSnapshot<Map<String, dynamic>>> muteUserDocs = [];
  final RefreshController refreshController = RefreshController();
  //新しくミュートするユーザー
  List<MuteUserToken> newMuteUserTokens = [];
  List<String> muteUids = [];
  //.whereと.createdAtの２つ以上のフィールドで絞っている
  //indexをfirestoreで作成する必要がある
  Query<Map<String, dynamic>> returnQuery(
          {required List<String> max10MuteUids}) =>
      FirebaseFirestore.instance
          .collection('users')
          .where('uid', whereIn: max10MuteUids)
          .orderBy('createdAt', descending: true);

  Future<void> getMuteUsers({required MainModel mainModel}) async {
    showMuteUsers = true;
    muteUids = mainModel.muteUids;
    //uidがmuteUidsに含まれているユーザーを全取得
    //processBasicDocsはmuteしているユーザーを弾くので使用できない
    await process();
    notifyListeners();
  }

  Future<void> onRefresh() async {
    refreshController.refreshCompleted();
    //必ずしも実装する必要はない =>　新しく取得するのは能動的
    await processNewMuteUsers();
    notifyListeners();
  }

  Future<void> onReload() async {
    await process();
    notifyListeners();
  }

  Future<void> onLoading() async {
    refreshController.loadComplete();
    await process();
    notifyListeners();
  }

  Future<void> processNewMuteUsers() async {
    //newMuteUserTokensをfor文で回し、passiveUidだけをまとめている
    final List<String> newMuteUids =
        newMuteUserTokens.map((e) => e.passiveUid).toList();
    //新しくミュートしたユーザーが10以上の場合
    final List<String> max10MuteUids = newMuteUids.length > 10
        ? newMuteUids.sublist(0, thirtyCount) //10より大きかったら取り出す
        : newMuteUids; //10より大きかったらそのまま適用
    if (max10MuteUids.isNotEmpty) {
      final qshot = await returnQuery(max10MuteUids: max10MuteUids).get();
      //いつもの新しいdocsに対して行う処理
      final reversed = qshot.docs.reversed.toList();
      for (final muteUserDoc in reversed) {
        muteUserDocs.insert(0, muteUserDoc);
        //muteUserDocsに加えたということは、もう新しくない
        //新しいやつからはぶく
        //tokensに含まれるpassiveUidがミュートされるべきユーザーと同じuidのやつを取得
        final deleteNewMuteUserToken = newMuteUserTokens
            .where((element) => element.passiveUid == muteUserDoc.id)
            .toList()
            .first;
        newMuteUserTokens.remove(deleteNewMuteUserToken);
      }
    }
    notifyListeners();
  }

  Future<void> process() async {
    if (muteUids.length > muteUserDocs.length) {
      //序盤のmuteUserDocsの長さを保持
      final userDocsLength = muteUserDocs.length;
      //max10MuteUidsには10個までしかUidを入れない。＝>なぜならWhereInで検索にかけるから
      List<String> max10MuteUids = (muteUids.length - muteUserDocs.length) > 10
          ? muteUids.sublist(userDocsLength, userDocsLength + thirtyCount)
          : muteUids.sublist(userDocsLength, muteUids.length);
      if (max10MuteUids.isNotEmpty) {
        final qshot = await returnQuery(max10MuteUids: max10MuteUids).get();
        for (final userDoc in qshot.docs) {
          muteUserDocs.add(userDoc);
        }
      }
    }
    notifyListeners();
  }

  Future<void> muteUser(
      {required MainModel mainModel,
      required String passiveUid,
      //docsにはpostDocs、commentDocsが含まれる
      required List<DocumentSnapshot<Map<String, dynamic>>> docs}) async {
    final String tokenId = returnUuidV4();
    final Timestamp now = Timestamp.now();
    final currentUserDoc = mainModel.currentUserDoc;
    final passiveUserDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(passiveUid)
        .get();
    final String activeUid = currentUserDoc.id;
    final MuteUserToken muteUserToken = MuteUserToken(
        activeUid: activeUid,
        passiveUid: passiveUid,
        createdAt: now,
        tokenId: tokenId,
        tokenType: muteUserTokenTypeString);
    //新しくミュートしたユーザー
    newMuteUserTokens.add(muteUserToken);
    mainModel.muteUserTokens.add(muteUserToken);
    mainModel.muteUids.add(passiveUid);
    //muteしたいユーザーが作成したコンテンツを除外
    docs.removeWhere((element) => element.data()!['uid'] == passiveUid);
    notifyListeners();
    //currentUserDoc.ref ...
    //自分がミュートしたことの印
    await userDocToTokenDocRef(userDoc: currentUserDoc, tokenId: tokenId)
        .set(muteUserToken.toJson());
    //ミュートされたことの印
    final UserMute userMute = UserMute(
        activeUid: activeUid,
        createdAt: now,
        passiveUid: passiveUid,
        passiveUserRef: passiveUserDoc.reference);
    await passiveUserDoc.reference
        .collection('userMutes')
        .doc(activeUid)
        .set(userMute.toJson());
  }

  Future<void> unMuteUser(
      {required MainModel mainModel,
      required String passiveUid,
      //docsにはpostDocs、commentDocsが含まれる
      required DocumentSnapshot<Map<String, dynamic>> muteUserDoc}) async {
    //muteUsersModel側の処理
    muteUserDocs.remove(muteUserDoc);
    mainModel.muteUids.remove(passiveUid);
    final currentUserDoc = mainModel.currentUserDoc;
    final String activeUid = currentUserDoc.id;

    final deleteMuteUserToken = mainModel.muteUserTokens
        .where((element) => element.passiveUid == passiveUid)
        .toList()
        .first;
    if (newMuteUserTokens.contains(deleteMuteUserToken)) {
      //もし削除するミュートユーザーが新しい人なら
      newMuteUserTokens.remove(deleteMuteUserToken);
    }
    mainModel.muteUserTokens.remove(deleteMuteUserToken);
    notifyListeners();
    //自分がミュートしたことの印を削除
    await userDocToTokenDocRef(
            userDoc: currentUserDoc, tokenId: deleteMuteUserToken.tokenId)
        .delete();
    //ユーザーのミュートれた印を削除
    final DocumentReference<Map<String, dynamic>> muteUserRef =
        FirebaseFirestore.instance.collection('users').doc(passiveUid);
    await muteUserRef.collection('userMutes').doc(activeUid).delete();
  }

  void showMuteUserDialog(
      {required BuildContext context,
      required String passiveUid,
      required MainModel mainModel,
      required List<DocumentSnapshot<Map<String, dynamic>>> docs}) {
    showCupertinoModalPopup(
        context: context,
        //中で別のinnercontextを生成する
        //!showPopupとbuilderの引数のcontextは名前を変える   >Navigator.popでどちらも反応してしまうから
        builder: (BuildContext innerContext) {
          return CupertinoAlertDialog(
            content: const Text(muteUserAlertMsg),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () => Navigator.pop(innerContext),
                child: const Text(noText),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () async {
                  Navigator.pop(innerContext);
                  await muteUser(
                      mainModel: mainModel, passiveUid: passiveUid, docs: docs);
                },
                child: const Text(yesText),
              ),
            ],
          );
        });
  }

  void showUnMuteUserDialog(
      {required BuildContext context,
      required String passiveUid,
      required MainModel mainModel,
      required DocumentSnapshot<Map<String, dynamic>> muteUserDoc}) {
    showCupertinoModalPopup(
        context: context,
        //中で別のinnercontextを生成する
        //!showPopupとbuilderの引数のcontextは名前を変える   >Navigator.popでどちらも反応してしまうから
        builder: (BuildContext innerContext) {
          return CupertinoAlertDialog(
            content: const Text(unMuteUserAlertMsg),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () => Navigator.pop(innerContext),
                child: const Text(noText),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () async {
                  Navigator.pop(innerContext);
                  await unMuteUser(
                      mainModel: mainModel,
                      passiveUid: passiveUid,
                      muteUserDoc: muteUserDoc);
                },
                child: const Text(yesText),
              ),
            ],
          );
        });
  }
}
