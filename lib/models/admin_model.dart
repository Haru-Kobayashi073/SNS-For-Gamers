//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//packages
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/enums.dart';
import 'package:sns_vol2/constants/others.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/domain/mute_user_token/mute_user_token.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/domain/user_mute/user_mute.dart';

final adminProvider = ChangeNotifierProvider((ref) => AdminModel());

class AdminModel extends ChangeNotifier {
  Future<void> admin(
      {required DocumentSnapshot<Map<String, dynamic>> currentUserDoc,
      required FirestoreUser firestoreUser}) async {
    // 管理者だけにできる処理

    final usersQshot =
        await FirebaseFirestore.instance.collection('users').get();
    final WriteBatch writeBatch = FirebaseFirestore.instance.batch();
    for (final user in usersQshot.docs) {
      writeBatch.update(user.reference, {
        'video': '',
      });
    }
    await writeBatch.commit();
    await Fluttertoast.showToast(
        msg: "管理者の動作が完了しました",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red[900],
        textColor: Colors.white,
        fontSize: 16.0);
    // final WriteBatch writeBatch = FirebaseFirestore.instance.batch();
    // for (int i = 0; i < 35; i++) {
    //   final String passiveUid = i.toString();
    //   final Timestamp now = Timestamp.now();
    //   //ユーザーを作成する
    //   final FirestoreUser firestoreUser = FirestoreUser(
    //       createdAt: now,
    //       updatedAt: now,
    //       followerCount: 0,
    //       followingCount: 0,
    //       muteCount: 0,
    //       isAdmin: false,
    //       userName: passiveUid,
    //       userImageURL: '',
    //       uid: passiveUid);
    //   writeBatch.set(
    //       FirebaseFirestore.instance.collection('users').doc(passiveUid),
    //       firestoreUser.toJson());
    //   //ミュートした印を作成する
    //   final String tokenId = returnUuidV4();
    //   final String activeUid = currentUserDoc.id;
    //   final passiveUserDoc = await FirebaseFirestore.instance
    //       .collection('users')
    //       .doc(passiveUid)
    //       .get();
    //   final MuteUserToken muteUserToken = MuteUserToken(
    //       activeUid: activeUid,
    //       passiveUid: passiveUid,
    //       createdAt: now,
    //       tokenId: tokenId,
    //       tokenType: muteUserTokenTypeString);
    //   notifyListeners();
    //   //currentUserDoc.ref ...
    //   //自分がミュートしたことの印
    //   writeBatch.set(
    //       currentUserDocToTokenDocRef(
    //           currentUserDoc: currentUserDoc, tokenId: tokenId),
    //       muteUserToken.toJson());
    //   // await currentUserDocToTokenDocRef(
    //   //         currentUserDoc: currentUserDoc, tokenId: tokenId)
    //   //     .set(muteUserToken.toJson());
    //   //ミュートされたことの印
    //   final UserMute userMute = UserMute(
    //       activeUid: activeUid,
    //       createdAt: now,
    //       passiveUid: passiveUid,
    //       passiveUserRef: passiveUserDoc.reference);
    //   writeBatch.set(
    //       passiveUserDoc.reference.collection('userMutes').doc(activeUid),
    //       userMute.toJson());
    // }

    // await writeBatch.commit();

    // final WriteBatch writeBatch = FirebaseFirestore.instance.batch();
    // final postsQshot = await currentUserDoc.reference
    //     .collection('posts')
    //     .orderBy('createdAt', descending: true).limit(100).get();
    // for (final postDoc in postsQshot.docs) {
    //   writeBatch.delete(postDoc.reference);
    // }
    // await writeBatch.commit();

    // final WriteBatch writeBatch = FirebaseFirestore.instance.batch();
    // final commentsQshot =
    //     await FirebaseFirestore.instance.collectionGroup('postComments').get();
    // for (final commentDoc in commentsQshot.docs) {
    //   writeBatch.delete(commentDoc.reference);
    // }
    // await writeBatch.commit();

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
