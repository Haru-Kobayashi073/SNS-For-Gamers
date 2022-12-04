//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/constants/voids.dart' as voids;
import 'package:sns_vol2/domain/comment/comment.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/constants/routes.dart' as routes;

final commentsProvider = ChangeNotifierProvider((ref) => CommentsModel());

class CommentsModel extends ChangeNotifier {
  final TextEditingController textEditingController = TextEditingController();
  bool isLoading = false;
  String commentString = "";
  //投稿ごとにリフレッシュできる必要があるから、毎回情報を捨てる必要がある
  RefreshController refreshController = RefreshController();
  List<DocumentSnapshot<Map<String, dynamic>>> commentDocs = [];
  Query<Map<String, dynamic>> returnQuery(
      {required DocumentSnapshot<Map<String, dynamic>> postDoc}) {
    return postDoc.reference
        .collection('postComments')
        .orderBy('likeCount', descending: true);
  }

  //コメントボタンが押された時の処理
  Future<void> init(
      {required DocumentSnapshot<Map<String, dynamic>> postDoc,
      required BuildContext context,
      required Post post,
      required MainModel mainModel}) async {
    refreshController = RefreshController();
    routes.toCommentsPage(
        context: context, post: post, mainModel: mainModel, postDoc: postDoc);
    startLoading();
    final query = returnQuery(postDoc: postDoc);
    final qshot = await query.get();
    commentDocs = qshot.docs;
    endLoading();
  }

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future<void> onRefresh(
      {required DocumentSnapshot<Map<String, dynamic>> postDoc}) async {
    refreshController.refreshCompleted();
    if (commentDocs.isNotEmpty) {
      final qshot = await returnQuery(postDoc: postDoc)
          .endBeforeDocument(commentDocs.first)
          .get();
      final reversed = qshot.docs.reversed.toList();
      for (final commentDoc in reversed) {
        commentDocs.insert(0, postDoc);
      }
    }
    notifyListeners();
  }

  Future<void> onReload(
      {required DocumentSnapshot<Map<String, dynamic>> postDoc}) async {
    startLoading();
    final qshot = await returnQuery(postDoc: postDoc).get();
    commentDocs = qshot.docs;
    endLoading();
  }

  Future<void> onLoading(
      {required DocumentSnapshot<Map<String, dynamic>> postDoc}) async {
    refreshController.loadComplete();
    if (commentDocs.isNotEmpty) {
      final qshot = await returnQuery(postDoc: postDoc)
          .startAfterDocument(commentDocs.last)
          .get();
      for (final commentDoc in qshot.docs) {
        commentDocs.add(commentDoc);
      }
    }
    notifyListeners();
  }

  void showCommentFlashBar(
      {required BuildContext context,
      required MainModel mainModel,
      required DocumentSnapshot<Map<String, dynamic>> postDoc}) {
    voids.showFlashBar(
        context: context,
        mainModel: mainModel,
        textEditingController: textEditingController,
        onchanged: (value) => commentString = value,
        titleString: createCommentText,
        positiveActionColor: Colors.black,
        primaryActionBuilder: (_, controller, __) {
          return InkWell(
            child: Icon(Icons.send),
            onTap: () async {
              if (textEditingController.text.isNotEmpty) {
                //メインの動作
                await createComment(
                    currentUserDoc: mainModel.currentUserDoc,
                    firestoreUser: mainModel.firestoreUser,
                    postDoc: postDoc);
                await controller.dismiss();
                commentString = "";
                textEditingController.text = "";
              } else {
                //何もしない
                await controller.dismiss();
              }
            },
          );
        });
  }

  Future<void> createComment(
      {required DocumentSnapshot<Map<String, dynamic>> currentUserDoc,
      required FirestoreUser firestoreUser,
      required DocumentSnapshot<Map<String, dynamic>> postDoc}) async {
    final Timestamp now = Timestamp.now();
    final String activeUid = currentUserDoc.id;
    final String postCommentId = returnUuidV4();
    final Comment comment = Comment(
        createdAt: now,
        updatedAt: now,
        comment: commentString,
        likeCount: 0,
        postCommentId: postCommentId,
        postCommentReplyCount: 0,
        userName: firestoreUser.userName,
        uid: activeUid,
        userImageURL: firestoreUser.userImageURL);
    await postDoc.reference
        .collection('postComments')
        .doc(postCommentId)
        .set(comment.toJson());
  }
}
