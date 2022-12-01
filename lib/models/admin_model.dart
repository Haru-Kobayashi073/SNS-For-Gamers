//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/others.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/domain/post/post.dart';

final adminProvider = ChangeNotifierProvider((ref) => AdminModel());

class AdminModel extends ChangeNotifier {
  Future<void> admin() async {
    //管理者だけにできる処理
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
