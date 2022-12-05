//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/enums.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/domain/like_post_token/like_post_token.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/domain/post_like/post_like.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/views/login_page.dart';

final postsProvider = ChangeNotifierProvider((ref) => PostsModel());

class PostsModel extends ChangeNotifier {
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
    notifyListeners();
    final LikePostToken likePostToken = LikePostToken(
        activeUid: activeUid,
        passiveUid: passiveUid,
        createdAt: now,
        postId: postId,
        tokenId: tokenId,
        tokenType: likePostTokenTypeString,
        postRef: postRef);
    //自分がいいねしたことの印
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
    notifyListeners();
    //自分がいいねした印を削除
    //qshotというdataの塊の存在を取得
    final QuerySnapshot<Map<String, dynamic>> qshot = await currentUserDoc
        .reference
        .collection('tokens')
        .where('postId', isEqualTo: postId)
        .get();
    //passiveUidが受動的なユーザーと同じだった場合にコレクションする
    //一個しか取得してないけど複数している扱い
    final List<DocumentSnapshot<Map<String, dynamic>>> docs = qshot.docs;
    final DocumentSnapshot<Map<String, dynamic>> token = docs.first;
    await token.reference.delete();
    //投稿がいいねされた印を削除
    await postDoc.reference.collection("postLikes").doc(activeUid).delete();
  }
}
