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
import 'package:sns_vol2/domain/reply_mute/reply_mute.dart';
import '../domain/mute_reply_token/mute_reply_token.dart';
//models
import 'package:sns_vol2/models/main_model.dart';

final muteRepliesProvider = ChangeNotifierProvider((ref) => MuteRepliesModel());

class MuteRepliesModel extends ChangeNotifier {
  bool showMuteReplies = false;
  List<DocumentSnapshot<Map<String, dynamic>>> muteReplyDocs = [];
  final RefreshController refreshController = RefreshController();
  //新しくミュートするリプライ
  List<MuteReplyToken> newMuteReplyTokens = [];
  List<String> mutePostCommentReplyIds = [];
  //ミュートしているリプライのDocumentを取得する
  Query<Map<String, dynamic>> returnQuery(
          {required List<String> max10MutePostCommentReplyIds}) =>
      FirebaseFirestore.instance
          .collectionGroup('postCommentReplies')
          .where('postCommentReplyId', whereIn: max10MutePostCommentReplyIds);

  Future<void> getMuteReplies({required MainModel mainModel}) async {
    showMuteReplies = true;
    mutePostCommentReplyIds = mainModel.muteReplyIds;
    //PostCommentReplyIdがmutePostCommentReplyIdsに含まれているユーザーを全取得
    //processBasicDocsはmuteしているユーザーを弾くので使用できない
    await process();
    notifyListeners();
  }

  Future<void> onRefresh() async {
    refreshController.refreshCompleted();
    //必ずしも実装する必要はない =>　新しく取得するのは能動的
    await processNewPostCommentReplies();
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

  Future<void> processNewPostCommentReplies() async {
    //newMuteUserTokensをfor文で回し、postCommentReplyIdだけをまとめている
    final List<String> newMutePostCommentReplyIds =
        newMuteReplyTokens.map((e) => e.postCommentReplyId).toList();
    //新しくミュートしたコメントが10以上の場合
    final List<String> max10MutePostCommentReplyIds = newMutePostCommentReplyIds
                .length >
            10
        ? newMutePostCommentReplyIds.sublist(0, thirtyCount) //10より大きかったら取り出す
        : newMutePostCommentReplyIds; //10より大きかったらそのまま適用
    if (max10MutePostCommentReplyIds.isNotEmpty) {
      final qshot = await returnQuery(
              max10MutePostCommentReplyIds: max10MutePostCommentReplyIds)
          .get();
      //いつもの新しいdocsに対して行う処理
      final reversed = qshot.docs.reversed.toList();
      for (final mutePostCommentReplyDoc in reversed) {
        muteReplyDocs.insert(0, mutePostCommentReplyDoc);
        //muteUserDocsに加えたということは、もう新しくない
        //新しいやつからはぶく
        //tokensに含まれるpostCommentReplyIdがミュートされるべきユーザーと同じpostCommentReplyIdのやつを取得
        final deleteNewMutePostCommentReplyToken = newMuteReplyTokens
            .where((element) =>
                element.postCommentReplyId == mutePostCommentReplyDoc.id)
            .toList()
            .first;
        newMuteReplyTokens.remove(deleteNewMutePostCommentReplyToken);
      }
    }
    notifyListeners();
  }

  Future<void> process() async {
    if (mutePostCommentReplyIds.length > muteReplyDocs.length) {
      //序盤のmutePostCommentReplyDocsの長さを保持
      final mutePostCommentReplyDocsLength = muteReplyDocs.length;
      //max10MutePostCommentReplyIdsには10個までしかpostCommentReplyIdを入れない。＝>なぜならWhereInで検索にかけるから
      List<String> max10MutePostCommentReplyIds =
          (mutePostCommentReplyIds.length - muteReplyDocs.length) >= 10
              ? mutePostCommentReplyIds.sublist(mutePostCommentReplyDocsLength,
                  mutePostCommentReplyDocsLength + thirtyCount)
              : mutePostCommentReplyIds.sublist(mutePostCommentReplyDocsLength,
                  mutePostCommentReplyIds.length);
      if (max10MutePostCommentReplyIds.isNotEmpty) {
        final qshot = await returnQuery(
                max10MutePostCommentReplyIds: max10MutePostCommentReplyIds)
            .get();
        for (final mutePostCommentReplyDoc in qshot.docs) {
          muteReplyDocs.add(mutePostCommentReplyDoc);
        }
      }
    }
    notifyListeners();
  }

  Future<void> muteReply(
      {required MainModel mainModel,
      //docsにはpostDocs、ReplyDocsが含まれる
      required DocumentSnapshot replyDoc}) async {
    final String tokenId = returnUuidV4();
    final Timestamp now = Timestamp.now();
    final currentUserDoc = mainModel.currentUserDoc;
    final String activeUid = currentUserDoc.id;
    final String postCommentReplyId = replyDoc.id;
    final postCommentReplyRef = replyDoc.reference;
    final MuteReplyToken muteReplyToken = MuteReplyToken(
        activeUid: activeUid,
        postCommentReplyId: postCommentReplyId,
        postCommentReplyRef: postCommentReplyRef,
        createdAt: now,
        tokenId: tokenId,
        tokenType: muteReplyTokenTypeString);
    //新しくミュートしたコメント
    newMuteReplyTokens.add(muteReplyToken);
    mainModel.muteReplyTokens.add(muteReplyToken);
    mainModel.muteReplyIds.add(postCommentReplyId);
    //フロントエンドで非表示にしているので除外する必要がない
    notifyListeners();
    //currentUserDoc.ref ...
    //自分がミュートしたことの印
    await userDocToTokenDocRef(userDoc: currentUserDoc, tokenId: tokenId)
        .set(muteReplyToken.toJson());
    //ミュートされたことの印
    final ReplyMute replyMute = ReplyMute(
        activeUid: activeUid,
        createdAt: now,
        postCommentReplyId: postCommentReplyId,
        postCommentReplyRef: postCommentReplyRef);
    await replyDoc.reference
        .collection('postCommentReplyMutes')
        .doc(activeUid)
        .set(replyMute.toJson());
  }

  void showMuteReplyDialog(
      {required BuildContext context,
      required MainModel mainModel,
      required DocumentSnapshot replyDoc}) {
    showCupertinoModalPopup(
        context: context,
        //中で別のinnercontextを生成する
        //!showPopupとbuilderの引数のcontextは名前を変える   >Navigator.popでどちらも反応してしまうから
        builder: (BuildContext innerContext) {
          return CupertinoAlertDialog(
            content: const Text(muteReplyAlertMsg),
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
                  await muteReply(mainModel: mainModel, replyDoc: replyDoc);
                },
                child: const Text(yesText),
              ),
            ],
          );
        });
  }

  Future<void> unMuteReply(
      {required MainModel mainModel,
      //docsにはpostDocs、ReplyDocsが含まれる
      required DocumentSnapshot replyDoc}) async {
    //muteRepliesModel側の処理
    final String replyId = replyDoc.id;
    muteReplyDocs.remove(replyDoc);
    mainModel.muteReplyIds.remove(replyId);
    final currentUserDoc = mainModel.currentUserDoc;
    final String activeUid = currentUserDoc.id;

    final MuteReplyToken deleteMuteReplyToken = mainModel.muteReplyTokens
        .where((element) => element.postCommentReplyId == replyId)
        .toList()
        .first;
    if (newMuteReplyTokens.contains(deleteMuteReplyToken)) {
      //もし削除するミュートユーザーが新しい人なら
      newMuteReplyTokens.remove(deleteMuteReplyToken);
    }
    mainModel.muteReplyTokens.remove(deleteMuteReplyToken);
    notifyListeners();
    //自分がミュートしたことの印を削除
    await userDocToTokenDocRef(
            userDoc: currentUserDoc, tokenId: deleteMuteReplyToken.tokenId)
        .delete();
    //ユーザーのミュートれた印を削除
    final DocumentReference<Map<String, dynamic>> muteReplyRef =
        deleteMuteReplyToken.postCommentReplyRef;
    await muteReplyRef
        .collection('postCommentReplyMutes')
        .doc(activeUid)
        .delete();
  }

  void showUnMuteReplyDialog(
      {required BuildContext context,
      required MainModel mainModel,
      //docsにはpostDocs、ReplyDocsが含まれる
      required DocumentSnapshot replyDoc}) {
    showCupertinoModalPopup(
        context: context,
        //中で別のinnercontextを生成する
        //!showPopupとbuilderの引数のcontextは名前を変える   >Navigator.popでどちらも反応してしまうから
        builder: (BuildContext innerContext) {
          return CupertinoAlertDialog(
            content: const Text(unMuteReplyAlertMsg),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () async {
                  Navigator.pop(innerContext);
                  await unMuteReply(mainModel: mainModel, replyDoc: replyDoc);
                },
                child: const Text(yesText),
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () => Navigator.pop(innerContext),
                child: const Text(noText),
              ),
            ],
          );
        });
  }

  void showUnMuteReplyPopup(
      {required BuildContext context,
      required MainModel mainModel,
      //docsにはpostDocs、ReplyDocsが含まれる
      required DocumentSnapshot replyDoc}) {
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
                showUnMuteReplyDialog(
                    context: context, mainModel: mainModel, replyDoc: replyDoc);
              },
              child: const Text(unMuteReplyText),
            ),
            CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(innerContext),
              child: const Text(backText),
            ),
          ]);
        });
  }
}
