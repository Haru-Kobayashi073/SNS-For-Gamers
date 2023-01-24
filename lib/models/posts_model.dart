//flutter
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/enums.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/report_contents_listview.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/domain/like_post_token/like_post_token.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/domain/post_like/post_like.dart';
import 'package:sns_vol2/domain/post_report/post_report.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/constants/voids.dart' as voids;

final postsProvider = ChangeNotifierProvider((ref) => PostsModel());

class PostsModel extends ChangeNotifier {
  File? video;

  Future<void> like(
      {required Post post,
      required DocumentSnapshot<Map<String, dynamic>> postDoc,
      required DocumentReference<Map<String, dynamic>> postRef,
      required MainModel mainModel}) async {
    //setting
    final String postId = post.postId;
    mainModel.likePostIds.add(postId);
    final currentUserDoc = mainModel.currentUserDoc;
    final String tokenId = returnUuidV4();
    final Timestamp now = Timestamp.now();
    final String activeUid = currentUserDoc.id;
    final String passiveUid = post.uid;
    final LikePostToken likePostToken = LikePostToken(
        activeUid: activeUid,
        passiveUid: passiveUid,
        createdAt: now,
        postId: postId,
        tokenId: tokenId,
        tokenType: likePostTokenTypeString,
        postRef: postRef);
    //自分がいいねしたことの印
    mainModel.likePostTokens.add(likePostToken);
    notifyListeners();
    await currentUserDoc.reference
        .collection('tokens')
        .doc(tokenId)
        .set(likePostToken.toJson());
    //投稿がいいねされたことの印
    final PostLike postLike = PostLike(
        activeUid: activeUid,
        createdAt: now,
        passiveUid: passiveUid,
        postRef: postRef,
        postId: postId);
    //いいねする人が重複しないようにUidをdocumentIdとする
    await postDoc.reference
        .collection('postLikes')
        .doc(activeUid)
        .set(postLike.toJson());
  }

  Future<void> unlike(
      {required Post post,
      required DocumentSnapshot<Map<String, dynamic>> postDoc,
      required DocumentReference<Map<String, dynamic>> postRef,
      required MainModel mainModel}) async {
    final String postId = post.postId;
    mainModel.likePostIds.remove(postId);
    final currentUserDoc = mainModel.currentUserDoc;
    final String activeUid = currentUserDoc.id;
    final deleteLikePostToken = mainModel.likePostTokens
        .where((element) => element.postId == postId)
        .toList()
        .first;
    mainModel.likePostTokens.remove(deleteLikePostToken);
    notifyListeners();
    //自分がいいねした印を削除
    //qshotというdataの塊の存在を取得
    // final QuerySnapshot<Map<String, dynamic>> qshot = await currentUserDoc
    //     .reference
    //     .collection('tokens')
    //     .where('postId', isEqualTo: postId)
    //     .get();
    //passiveUidが受動的なユーザーと同じだった場合にコレクションする
    //一個しか取得してないけど複数している扱い
    // final List<DocumentSnapshot<Map<String, dynamic>>> docs = qshot.docs;
    // final DocumentSnapshot<Map<String, dynamic>> token = docs.first;

    await currentUserDoc.reference
        .collection('tokens')
        .doc(deleteLikePostToken.tokenId)
        .delete();
    //投稿がいいねされた印を削除
    await postDoc.reference.collection("postLikes").doc(activeUid).delete();
  }

  void reportPost({
    required BuildContext context,
    required FirestoreUser firestoreUser,
    required Post post,
    required DocumentSnapshot<Map<String, dynamic>> postDoc,
  }) {
    final selectedReportContentsNotifier =
        ValueNotifier<List<String>>([]); //変更をすぐに検知する
    final String postReportId = returnUuidV4();
    voids.showFlashDialog(
        context: context,
        content: ReportContentsListView(
          selectedReportContentsNotifier: selectedReportContentsNotifier,
        ),
        positiveActionBuilder: (_, controller, __) {
          final postDocRef = postDoc.reference;
          return TextButton(
              onPressed: () async {
                final PostReport postReport = PostReport(
                    activeUid: firestoreUser.uid,
                    createdAt: Timestamp.now(),
                    others: "",
                    reportContent: returnReportContentsString(
                        selectedReportContents:
                            selectedReportContentsNotifier.value),
                    postCreatorUid: post.uid,
                    passiveUserName: post.userName,
                    postDocRef: postDocRef,
                    postId: post.postId,
                    postReportId: postReportId,
                    text: post.text,
                    postTextLanguageCode: post.textLanguageCode,
                    postTextNegativeScore: post.textNegativeScore,
                    postTextPositiveScore: post.textPositiveScore,
                    postTextSentiment: post.textSentiment);
                await controller.dismiss();
                await voids.showfluttertoast(msg: "投稿を報告しました");
                await postDocRef
                    .collection("postReports")
                    .doc(postReportId)
                    .set(postReport.toJson());
              },
              child: const Text(
                "送信",
                style: TextStyle(color: Colors.red),
              ));
        });
  }
}
