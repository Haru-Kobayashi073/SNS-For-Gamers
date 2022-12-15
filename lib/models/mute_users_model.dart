//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sns_vol2/constants/enums.dart';
import 'package:sns_vol2/constants/ints.dart';
import 'package:sns_vol2/constants/others.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/domain/mute_user_token/mute_user_token.dart';
import 'package:sns_vol2/domain/user_mute/user_mute.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/constants/voids.dart' as voids;

final muteUsersProvider = ChangeNotifierProvider((ref) => MuteUsersModel());

class MuteUsersModel extends ChangeNotifier {
  bool showMuteUsers = false;
  List<DocumentSnapshot<Map<String, dynamic>>> muteUserDocs = [];
  final RefreshController refreshController = RefreshController();
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

  void onRefresh() {
    refreshController.refreshCompleted();
    //必ずしも実装する必要はない =>　新しく取得するのは能動的
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

  Future<void> process() async {
    if (muteUids.length > muteUserDocs.length) {
      //序盤のmuteUserDocsの長さを保持
      final userDocsLength = muteUserDocs.length;
      //max10MuteUidsには10個までしかUidを入れない。＝>なぜならWhereInで検索にかけるから
      List<String> max10MuteUids = (muteUids.length - muteUserDocs.length) > 10
          ? muteUids.sublist(userDocsLength, userDocsLength + tenCount)
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
    mainModel.muteUserTokens.add(muteUserToken);
    mainModel.muteUids.add(passiveUid);
    //muteしたいユーザーが作成したコンテンツを除外
    docs.removeWhere((element) => element.data()!['uid'] == passiveUid);
    notifyListeners();
    //currentUserDoc.ref ...
    //自分がミュートしたことの印
    await currentUserDocToTokenDocRef(
            currentUserDoc: currentUserDoc, tokenId: tokenId)
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

  void showMuteUserPopup(
      {required BuildContext context,
      required String passiveUid,
      required MainModel mainModel,
      required List<DocumentSnapshot<Map<String, dynamic>>> docs}) {
    showCupertinoModalPopup(
        context: context,
        //中で別のinnercontextを生成する
        //!showPopupとbuilderの引数のcontextは名前を変える   >Navigator.popでどちらも反応してしまうから
        builder: (BuildContext innerContext) {
          return CupertinoActionSheet(actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(innerContext);
                showMuteUserDialog(
                    context: context,
                    passiveUid: passiveUid,
                    mainModel: mainModel,
                    docs: docs);
              },
              child: const Text(muteUserText),
            ),
            CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(innerContext),
              child: const Text(backText),
            ),
          ]);
        });
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
    mainModel.muteUserTokens.remove(deleteMuteUserToken);
    notifyListeners();
    //自分がミュートしたことの印を削除
    await currentUserDocToTokenDocRef(
            currentUserDoc: currentUserDoc,
            tokenId: deleteMuteUserToken.tokenId)
        .delete();
    //ユーザーのミュートれた印を削除
    final DocumentReference<Map<String, dynamic>> muteUserRef =
        FirebaseFirestore.instance.collection('users').doc(passiveUid);
    await muteUserRef.collection('userMutes').doc(activeUid).delete();
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

  void showUnMuteUserPopup(
      {required BuildContext context,
      required String passiveUid,
      required MainModel mainModel,
      required DocumentSnapshot<Map<String, dynamic>> muteUserDoc}) {
    showCupertinoModalPopup(
        context: context,
        //中で別のinnercontextを生成する
        //!showPopupとbuilderの引数のcontextは名前を変える   >Navigator.popでどちらも反応してしまうから
        builder: (BuildContext innerContext) {
          return CupertinoActionSheet(actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(innerContext);
                showUnMuteUserDialog(
                    context: context,
                    passiveUid: passiveUid,
                    mainModel: mainModel,
                    muteUserDoc: muteUserDoc);
              },
              child: const Text(unMuteUserText),
            ),
            CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(innerContext),
              child: const Text(backText),
            ),
          ]);
        });
  }
}