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
import 'package:sns_vol2/domain/follower/follower.dart';
import 'package:sns_vol2/domain/following_token/following_token.dart';
import 'package:sns_vol2/domain/mute_user_token/mute_user_token.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/domain/user_mute/user_mute.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/mute_users_model.dart';
import 'package:sns_vol2/constants/voids.dart' as voids;

final adminProvider = ChangeNotifierProvider((ref) => AdminModel());

class AdminModel extends ChangeNotifier {
  Future<void> admin(
      {required DocumentSnapshot<Map<String, dynamic>> currentUserDoc,
      required FirestoreUser firestoreUser,
      required MuteUsersModel muteUsersModel,
      required MainModel mainModel}) async {
    // 管理者だけにできる処理

    //followerを作成
    //adminでs作成した70人を取得
    final usersDocs =
        await FirebaseFirestore.instance.collection("users").limit(75).get();
    final WriteBatch batch = FirebaseFirestore.instance.batch();
    final User currentUser = returnAuthUser()!;
    final String currentUid = currentUser.uid;
    for (final userDoc in usersDocs.docs) {
      final Timestamp now = Timestamp.now();
      final String tokenId = returnUuidV4();
      //フォローした証
      final FollowingToken followingToken = FollowingToken(
          passiveUid: currentUser.uid,
          createdAt: now,
          tokenId: tokenId,
          tokenType: followingTokenTypeString);
      batch.set(userDocToTokenDocRef(userDoc: userDoc, tokenId: tokenId),
          followingToken.toJson());
      //フォローされた証
      final Follower follower = Follower(
          followedUid: currentUid, createdAt: now, followerUid: userDoc.id);
      batch.set(
          FirebaseFirestore.instance
              .collection("users")
              .doc(currentUid)
              .collection("followers")
              .doc(follower.followerUid),
          follower.toJson());
      await Future.delayed(Duration(milliseconds: 100));
    }
    await batch.commit();
    await voids.showfluttertoast(msg: "処理が終わりました");

    // final WriteBatch writeBatch = FirebaseFirestore.instance.batch();
    // final String activeUid = returnAuthUser()!.uid;
    // for (int i = 0; i < 35; i++) {
    //   final Timestamp now = Timestamp.now();
    //   final String passiveUid = "newMuteUser${i.toString()}";
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
    //   //今回はフロントエンドだけの処理を疑似的に実装したいのでDBに保存する必要はない
    //   final MuteUserToken muteUserToken = MuteUserToken(
    //       activeUid: activeUid,
    //       passiveUid: passiveUid,
    //       createdAt: now,
    //       tokenId: returnUuidV4(),
    //       tokenType: muteUserTokenTypeString);
    //   //フロントだけ
    //   muteUsersModel.newMuteUserTokens.add(muteUserToken);
    //   //timestampをずらす
    //   await Future.delayed(const Duration(milliseconds: 500));
    // }
    // await writeBatch.commit();

    // final usersQshot =
    //     await FirebaseFirestore.instance.collection('users').get();
    // final WriteBatch writeBatch = FirebaseFirestore.instance.batch();
    // for (final user in usersQshot.docs) {
    //   writeBatch.update(user.reference, {
    //     'muteCount': 0,
    //   });
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
