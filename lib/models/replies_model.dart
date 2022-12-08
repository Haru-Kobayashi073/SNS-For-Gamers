//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sns_vol2/constants/enums.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/constants/voids.dart' as voids;
import 'package:sns_vol2/constants/routes.dart' as routes;
import 'package:sns_vol2/domain/comment/comment.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/domain/like_reply_token/like_reply_token.dart';
import 'package:sns_vol2/domain/reply/reply.dart';
import 'package:sns_vol2/domain/reply_like/reply_like.dart';
import 'package:sns_vol2/models/main_model.dart';

final repliesProvider = ChangeNotifierProvider((ref) => RepliesModel());

class RepliesModel extends ChangeNotifier {
  final TextEditingController textEditingController = TextEditingController();
  RefreshController refreshController = RefreshController();
  String replyString = '';
  List<DocumentSnapshot<Map<String, dynamic>>> replyDocs = [];
  Query<Map<String, dynamic>> returnQuery(
      {required DocumentSnapshot<Map<String, dynamic>> commentDoc}) {
    //commentに紐づくreplyが欲しい
    return commentDoc.reference
        .collection('postCommentReplies')
        .orderBy('likeCount', descending: true);
  }

  //同じデータを無駄に取得しないようにする
  String indexPostCommentId = '';
  //リプライボタンが押された時の処理
  Future<void> init(
      {required BuildContext context,
      required Comment comment,
      required DocumentSnapshot<Map<String, dynamic>> commentDoc,
      required MainModel mainModel}) async {
    refreshController = RefreshController();
    routes.toRepliesPage(
        context: context,
        comment: comment,
        commentDoc: commentDoc,
        mainModel: mainModel);
    final String postCommentId = comment.postCommentId;
    if (indexPostCommentId != postCommentId) {
      await onReload(commentDoc: commentDoc);
    }
    indexPostCommentId = postCommentId;
  }

  Future<void> onRefresh(
      {required DocumentSnapshot<Map<String, dynamic>> commentDoc}) async {
    refreshController.refreshCompleted();
    if (replyDocs.isNotEmpty) {
      final qshot = await returnQuery(commentDoc: commentDoc)
          .endBeforeDocument(replyDocs.first)
          .get();
      final reversed = qshot.docs.reversed.toList();
      for (final commentDoc in reversed) {
        replyDocs.insert(0, commentDoc);
      }
    }
    notifyListeners();
  }

  Future<void> onReload(
      {required DocumentSnapshot<Map<String, dynamic>> commentDoc}) async {
    final qshot = await returnQuery(commentDoc: commentDoc).get();
    replyDocs = qshot.docs;
    notifyListeners();
  }

  Future<void> onLoading(
      {required DocumentSnapshot<Map<String, dynamic>> commentDoc}) async {
    refreshController.loadComplete();
    if (replyDocs.isNotEmpty) {
      final qshot = await returnQuery(commentDoc: commentDoc)
          .startAfterDocument(replyDocs.last)
          .get();
      for (final commentDoc in qshot.docs) {
        replyDocs.add(commentDoc);
      }
    }
    notifyListeners();
  }

  void showReplyFlashBar(
      {required BuildContext context,
      required MainModel mainModel,
      required DocumentSnapshot<Map<String, dynamic>> commentDoc,
      required Comment comment}) {
    voids.showFlashBar(
        context: context,
        mainModel: mainModel,
        textEditingController: textEditingController,
        onchanged: (value) => replyString = value,
        titleString: createReplyText,
        positiveActionColor: Colors.black,
        primaryActionBuilder: (_, controller, __) {
          return InkWell(
            child: Icon(Icons.send),
            onTap: () async {
              if (textEditingController.text.isNotEmpty) {
                //メインの動作
                await createReply(
                    currentUserDoc: mainModel.currentUserDoc,
                    firestoreUser: mainModel.firestoreUser,
                    comment: comment,
                    commentDoc: commentDoc);
                await controller.dismiss();
                replyString = "";
                textEditingController.text = "";
              } else {
                //何もしない
                await controller.dismiss();
              }
            },
          );
        });
  }

  Future<void> createReply(
      {required DocumentSnapshot<Map<String, dynamic>> currentUserDoc,
      required FirestoreUser firestoreUser,
      required Comment comment,
      required DocumentSnapshot<Map<String, dynamic>> commentDoc}) async {
    final Timestamp now = Timestamp.now();
    final String activeUid = currentUserDoc.id;
    final String postCommentReplyId = returnUuidV4();
    final Reply reply = Reply(
        createdAt: now,
        updatedAt: now,
        reply: replyString,
        postRef: comment.postRef,
        postCommentRef: commentDoc.reference,
        postCommentReplyId: postCommentReplyId,
        likeCount: 0,
        userName: firestoreUser.userName,
        uid: activeUid,
        userImageURL: firestoreUser.userImageURL);
    await commentDoc.reference
        .collection('postCommentReplies')
        .doc(postCommentReplyId)
        .set(reply.toJson());
  }

  Future<void> like(
      {required Reply reply,
      required MainModel mainModel,
      required Comment comment,
      required DocumentSnapshot replyDoc}) async {
    //setting
    final String postCommentReplyId = reply.postCommentReplyId;
    mainModel.likeReplyIds.add(postCommentReplyId);
    final currentUserDoc = mainModel.currentUserDoc;
    final String tokenId = returnUuidV4();
    final Timestamp now = Timestamp.now();
    final String activeUid = currentUserDoc.id;
    final String passiveUid = comment.uid;
    final DocumentReference postCommentReplyRef =
        replyDoc.reference;
    //自分がコメントにいいねしたことの印
    final LikeReplyToken likeReplyToken = LikeReplyToken(
        activeUid: activeUid,
        passiveUid: passiveUid,
        createdAt: now,
        postCommentReplyId: postCommentReplyId,
        tokenId: tokenId,
        postCommentReplyRef: postCommentReplyRef,
        tokenType: likeReplyTokenTypeString);
    mainModel.likeReplyTokens.add(likeReplyToken);
    notifyListeners();
    //自分がリプライにいいねしたことの印
    await currentUserDoc.reference
        .collection('tokens')
        .doc(tokenId)
        .set(likeReplyToken.toJson());
    //コメントにいいねがついたことの印
    final ReplyLike replyLike = ReplyLike(
        activeUid: activeUid,
        createdAt: now,
        postCommentReplyCreatorUid: reply.uid,
        postCommentReplyRef: postCommentReplyRef,
        postCommentReplyId: postCommentReplyId);
    await postCommentReplyRef
        .collection('postCommentReplyLikes')
        .doc(activeUid)
        .set(replyLike.toJson());
  }

  Future<void> unlike(
      {required Reply reply,
      required MainModel mainModel,
      required Comment comment,
      required DocumentSnapshot replyDoc}) async {
    final String postCommentReplyId = reply.postCommentReplyId;
    mainModel.likeReplyIds.remove(postCommentReplyId);
    final currentUserDoc = mainModel.currentUserDoc;
    final String activeUid = currentUserDoc.id;
    //自分がいいねしたことの印を削除
    final deleteLikeReplyToken = mainModel.likeReplyTokens
        .where((element) => element.postCommentReplyId == postCommentReplyId)
        .toList()
        .first;
    mainModel.likeReplyTokens.remove(deleteLikeReplyToken);
    notifyListeners();
    await currentUserDoc.reference
        .collection('tokens')
        .doc(deleteLikeReplyToken.tokenId)
        .delete();
    final DocumentReference<Map<String, dynamic>> postCommentReplyRef =
        deleteLikeReplyToken.postCommentReplyRef;
    await postCommentReplyRef
        .collection('postCommentReplyLikes')
        .doc(activeUid)
        .delete();
  }
}
