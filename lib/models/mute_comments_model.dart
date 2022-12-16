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
import 'package:sns_vol2/domain/comment_mute/comment_mute.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/domain/mute_user_token/mute_user_token.dart';
import 'package:sns_vol2/domain/user_mute/user_mute.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/constants/voids.dart' as voids;

import '../domain/mute_comment_token/mute_comment_token.dart';

final muteCommentsProvider =
    ChangeNotifierProvider((ref) => MuteCommentsModel());

class MuteCommentsModel extends ChangeNotifier {
  bool showMuteComments = false;
  List<DocumentSnapshot<Map<String, dynamic>>> muteCommentDocs = [];
  final RefreshController refreshController = RefreshController();
  //新しくミュートするユーザー
  List<MuteCommentToken> newMuteCommentTokens = [];
  List<String> mutePostCommentIds = [];
  //ミュートしているコメントのDocumentを取得する
  Query<Map<String, dynamic>> returnQuery(
          {required List<String> max10MutePostCommentIds}) =>
      FirebaseFirestore.instance
          .collectionGroup('postComments')
          .where('postCommentId', whereIn: max10MutePostCommentIds);

  Future<void> getMuteComments({required MainModel mainModel}) async {
    showMuteComments = true;
    mutePostCommentIds = mainModel.muteCommentIds;
    //PostCommentIdがmutePostCommentIdsに含まれているユーザーを全取得
    //processBasicDocsはmuteしているユーザーを弾くので使用できない
    await process();
    notifyListeners();
  }

  Future<void> onRefresh() async {
    refreshController.refreshCompleted();
    //必ずしも実装する必要はない =>　新しく取得するのは能動的
    await processNewPostComments();
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

  Future<void> processNewPostComments() async {
    //newMuteUserTokensをfor文で回し、postCommentIdだけをまとめている
    final List<String> newMutePostCommentIds =
        newMuteCommentTokens.map((e) => e.postCommentId).toList();
    //新しくミュートしたコメントが10以上の場合
    final List<String> max10MutePostCommentIds =
        newMutePostCommentIds.length > 10
            ? newMutePostCommentIds.sublist(0, tenCount) //10より大きかったら取り出す
            : newMutePostCommentIds; //10より大きかったらそのまま適用
    if (max10MutePostCommentIds.isNotEmpty) {
      final qshot =
          await returnQuery(max10MutePostCommentIds: max10MutePostCommentIds)
              .get();
      //いつもの新しいdocsに対して行う処理
      final reversed = qshot.docs.reversed.toList();
      for (final mutePostCommentDoc in reversed) {
        muteCommentDocs.insert(0, mutePostCommentDoc);
        //muteUserDocsに加えたということは、もう新しくない
        //新しいやつからはぶく
        //tokensに含まれるpostCommentIdがミュートされるべきユーザーと同じpostCommentIdのやつを取得
        final deleteNewMutePostCommentToken = newMuteCommentTokens
            .where((element) => element.postCommentId == mutePostCommentDoc.id)
            .toList()
            .first;
        newMuteCommentTokens.remove(deleteNewMutePostCommentToken);
      }
    }
    notifyListeners();
  }

  Future<void> process() async {
    if (mutePostCommentIds.length > muteCommentDocs.length) {
      //序盤のmutePostCommentDocsの長さを保持
      final mutePostCommentDocsLength = muteCommentDocs.length;
      //max10MutePostCOmmentIdsには10個までしかpostCommentIdを入れない。＝>なぜならWhereInで検索にかけるから
      List<String> max10MutePostCommentIds =
          (mutePostCommentIds.length - muteCommentDocs.length) >= 10
              ? mutePostCommentIds.sublist(mutePostCommentDocsLength,
                  mutePostCommentDocsLength + tenCount)
              : mutePostCommentIds.sublist(
                  mutePostCommentDocsLength, mutePostCommentIds.length);
      if (max10MutePostCommentIds.isNotEmpty) {
        final qshot =
            await returnQuery(max10MutePostCommentIds: max10MutePostCommentIds)
                .get();
        for (final mutePostCommentDoc in qshot.docs) {
          muteCommentDocs.add(mutePostCommentDoc);
        }
      }
    }
    notifyListeners();
  }

  Future<void> muteComment(
      {required MainModel mainModel,
      //docsにはpostDocs、commentDocsが含まれる
      required DocumentSnapshot<Map<String, dynamic>> commentDoc,
      required List<DocumentSnapshot<Map<String, dynamic>>>
          commentDocs}) async {
    final String tokenId = returnUuidV4();
    final Timestamp now = Timestamp.now();
    final currentUserDoc = mainModel.currentUserDoc;
    final String activeUid = currentUserDoc.id;
    final String postCommentId = commentDoc.id;
    final postCommentRef = commentDoc.reference;
    final MuteCommentToken muteCommentToken = MuteCommentToken(
        activeUid: activeUid,
        postCommentId: postCommentId,
        postCommentRef: postCommentRef,
        createdAt: now,
        tokenId: tokenId,
        tokenType: muteCommentTokenTypeString);
    //新しくミュートしたコメント
    newMuteCommentTokens.add(muteCommentToken);
    mainModel.muteCommentTokens.add(muteCommentToken);
    mainModel.muteCommentIds.add(postCommentId);
    //muteしたいユーザーが作成したコメントを除外
    commentDocs.remove(commentDoc);
    notifyListeners();
    //currentUserDoc.ref ...
    //自分がミュートしたことの印
    await currentUserDocToTokenDocRef(
            currentUserDoc: currentUserDoc, tokenId: tokenId)
        .set(muteCommentToken.toJson());
    //ミュートされたことの印
    final CommentMute commentMute = CommentMute(
        activeUid: activeUid,
        createdAt: now,
        postCommentId: postCommentId,
        postCommentRef: postCommentRef);
    await commentDoc.reference
        .collection('postCommentMutes')
        .doc(activeUid)
        .set(commentMute.toJson());
  }

  void showMuteCommentDialog(
      {required BuildContext context,
      required MainModel mainModel,
      //docsにはpostDocs、commentDocsが含まれる
      required DocumentSnapshot<Map<String, dynamic>> commentDoc,
      required List<DocumentSnapshot<Map<String, dynamic>>> commentDocs}) {
    showCupertinoModalPopup(
        context: context,
        //中で別のinnercontextを生成する
        //!showPopupとbuilderの引数のcontextは名前を変える   >Navigator.popでどちらも反応してしまうから
        builder: (BuildContext innerContext) {
          return CupertinoAlertDialog(
            content: const Text(muteCommentAlertMsg),
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
                  await muteComment(
                      mainModel: mainModel,
                      commentDoc: commentDoc,
                      commentDocs: commentDocs);
                },
                child: const Text(yesText),
              ),
            ],
          );
        });
  }

  Future<void> unMuteComment(
      {required MainModel mainModel,
      //docsにはpostDocs、commentDocsが含まれる
      required DocumentSnapshot<Map<String, dynamic>> commentDoc,
      required List<DocumentSnapshot<Map<String, dynamic>>>
          commentDocs}) async {
    //muteCommentsModel側の処理
    final String commentId = commentDoc.id;
    muteCommentDocs.remove(commentDoc);
    mainModel.muteCommentIds.remove(commentId);
    final currentUserDoc = mainModel.currentUserDoc;
    final String activeUid = currentUserDoc.id;

    final MuteCommentToken deleteMuteCommentToken = mainModel.muteCommentTokens
        .where((element) => element.postCommentId == commentId)
        .toList()
        .first;
    if (newMuteCommentTokens.contains(deleteMuteCommentToken)) {
      //もし削除するミュートユーザーが新しい人なら
      newMuteCommentTokens.remove(deleteMuteCommentToken);
    }
    mainModel.muteCommentTokens.remove(deleteMuteCommentToken);
    notifyListeners();
    //自分がミュートしたことの印を削除
    await currentUserDocToTokenDocRef(
            currentUserDoc: currentUserDoc,
            tokenId: deleteMuteCommentToken.tokenId)
        .delete();
    //ユーザーのミュートれた印を削除
    final DocumentReference<Map<String, dynamic>> muteCommentRef =
        deleteMuteCommentToken.postCommentRef;
    await muteCommentRef.collection('postCommentMutes').doc(activeUid).delete();
  }

  void showUnMuteCommentDialog(
      {required BuildContext context,
      required MainModel mainModel,
      //docsにはpostDocs、commentDocsが含まれる
      required DocumentSnapshot<Map<String, dynamic>> commentDoc,
      required List<DocumentSnapshot<Map<String, dynamic>>> commentDocs}) {
    showCupertinoModalPopup(
        context: context,
        //中で別のinnercontextを生成する
        //!showPopupとbuilderの引数のcontextは名前を変える   >Navigator.popでどちらも反応してしまうから
        builder: (BuildContext innerContext) {
          return CupertinoAlertDialog(
            content: const Text(unMuteCommentAlertMsg),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () async {
                  Navigator.pop(innerContext);
                  await unMuteComment(
                      mainModel: mainModel,
                      commentDoc: commentDoc,
                      commentDocs: commentDocs);
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

  void showUnMuteCommentPopup(
      {required BuildContext context,
      required MainModel mainModel,
      //docsにはpostDocs、commentDocsが含まれる
      required DocumentSnapshot<Map<String, dynamic>> commentDoc,
      required List<DocumentSnapshot<Map<String, dynamic>>> commentDocs}) {
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
                showUnMuteCommentDialog(
                    context: context,
                    mainModel: mainModel,
                    commentDoc: commentDoc,
                    commentDocs: commentDocs);
              },
              child: const Text(unMuteCommentText),
            ),
            CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(innerContext),
              child: const Text(backText),
            ),
          ]);
        });
  }
}
