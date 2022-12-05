//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/others.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/domain/post/post.dart';

final adminProvider = ChangeNotifierProvider((ref) => AdminModel());

class AdminModel extends ChangeNotifier {
  Future<void> admin(
      {required DocumentSnapshot<Map<String, dynamic>> currentUserDoc,
      required FirestoreUser firestoreUser}) async {
    // 管理者だけにできる処理

    // final WriteBatch writeBatch = FirebaseFirestore.instance.batch();
    // final postsQshot = await currentUserDoc.reference.collection('posts').get();
    // for (final post in postsQshot.docs) {
    //   writeBatch.update(post.reference, {
    //     'postCommentCount': 0,
    //   });
    // }
    // await writeBatch.commit();

    // //ユーザーのemail削除
    // final WriteBatch batch = FirebaseFirestore.instance.batch();
    // final userQshot =
    //     await FirebaseFirestore.instance.collection('users').get();
    // for (final user in userQshot.docs) {
    //   batch.update(user.reference, {
    //     "email": FieldValue.delete(),
    //   });
    // }
    // //postにuserImageURLの追加、userNameの追加
    // final postQshot = await currentUserDoc.reference.collection('posts').get();
    // for (final post in postQshot.docs) {
    //   batch.update(post.reference, {
    //     "userName": firestoreUser.userName,
    //     "userImageURL": firestoreUser.userImageURL
    //     });
    // }
    // await batch.commit();

    //投稿を99個作成
    // WriteBatch batch = FirebaseFirestore.instance.batch();
    // final String activveUid = returnAuthUser()!.uid;
    // for (int i = 0; i < 100; i++) {
    //   final Timestamp now = Timestamp.now();
    // final String postId = returnUuidV4();
    //   final Post post = Post(
    //       updatedAt: now,
    //       createdAt: now,
    //       hashTags: [],
    //       imageURL: '',
    //       likeCount: 0,
    //       text: i.toString(),
    //       postId: postId,
    //       uid: activveUid);
    //   final DocumentReference<Map<String,dynamic>> ref = FirebaseFirestore.instance
    //       .collection('users')
    //       .doc(activveUid)
    //       .collection('posts')
    //       .doc(postId);
    //   batch.set(ref, post.toJson());
    // }
    // await batch.commit();
  }
}
