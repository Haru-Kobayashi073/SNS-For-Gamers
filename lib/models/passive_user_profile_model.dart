//flutter
import 'package:flutter/material.dart';
//packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/domain/follower/follower.dart';
import 'package:sns_vol2/domain/following_token/following_token.dart';
import 'package:sns_vol2/models/main_model.dart';

final passiveUserProfileProvider =
    ChangeNotifierProvider((ref) => PassiveUserProfileModel());

class PassiveUserProfileModel extends ChangeNotifier {
  Future<void> follow(
      {required MainModel mainModel,
      required FirestoreUser passiveUser}) async {
    mainModel.followingUids.add(passiveUser.uid);
    //mainmodelのListにフォローする対象のUidを追加していく
    final String tokenId = returnUuidV4();
    final Timestamp now = Timestamp.now();
    final FollowingToken followingToken = FollowingToken(
        passiveUid: passiveUser.uid, createdAt: now, tokenId: tokenId);
    final FirestoreUser activeUser = mainModel.firestoreUser;
    final newActiveUser =
        activeUser.copyWith(followingCount: activeUser.followerCount + 1);
    mainModel.firestoreUser = newActiveUser;
    final newPassiveUser =
        passiveUser.copyWith(followerCount: passiveUser.followerCount + 1);
    notifyListeners();
    //自分がフォローした印
    await FirebaseFirestore.instance
        .collection('users')
        .doc(activeUser.uid)
        .collection('tokens')
        .doc(tokenId)
        .set(followingToken.toJson());
    //危険な例、　フォローしているユーザーの数を+1している
    await FirebaseFirestore.instance
        .collection('users')
        .doc(activeUser.uid)
        .update({
          //Firestore上の値に+1
          "followingCount" : FieldValue.increment(1)
        });
    //受動的なユーザーがフォローされたdataを生成する
    final Follower follower = Follower(
        followedUid: passiveUser.uid,
        createdAt: now,
        followerUid: activeUser.uid);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(passiveUser.uid)
        .collection("followers")
        .doc(activeUser.uid)
        .set(follower.toJson());
    //危険な例、　フォロワーの数を+1している
    await FirebaseFirestore.instance
        .collection('users')
        .doc(passiveUser.uid)
        .update({
          //Firestore上の値に+1
          "followerCount" : FieldValue.increment(1)
        });
  }

  Future<void> unfollow(
      {required MainModel mainModel,
      required FirestoreUser passiveUser}) async {
    mainModel.followingUids.remove(passiveUser.uid);
    //followしているTokenを取得する
    final FirestoreUser activeUser = mainModel.firestoreUser;
    final newActiveUser =
        activeUser.copyWith(followingCount: activeUser.followerCount - 1);
    mainModel.firestoreUser = newActiveUser;
    final newPassiveUser =
        passiveUser.copyWith(followerCount: passiveUser.followerCount - 1);
    //mainmodelのListにフォローする対象のUidを追加していく
    notifyListeners();
    //qshotというdataの塊の存在を取得
    final QuerySnapshot<Map<String, dynamic>> qshot = await FirebaseFirestore
        .instance
        .collection('users')
        .doc(activeUser.uid)
        .collection('tokens')
        .where('passiveUid', isEqualTo: passiveUser.uid)
        .get();
    //passiveUidが受動的なユーザーと同じだった場合にコレクションする
    //一個しか取得してないけど複数している扱い
    final List<DocumentSnapshot<Map<String, dynamic>>> docs = qshot.docs;
    final DocumentSnapshot<Map<String, dynamic>> token = docs.first;
    await token.reference.delete();

    //危険な例、　フォローしているユーザーの数を-1している
    await FirebaseFirestore.instance
        .collection('users')
        .doc(activeUser.uid)
        .update({
          //Firestore上の値に-1
          "followingCount" : FieldValue.increment(-1)
        });

    //受動的なユーザーがフォローされたdataを削除する
    await FirebaseFirestore.instance
        .collection('users')
        .doc(passiveUser.uid)
        .collection("followers")
        .doc(activeUser.uid)
        .delete();

    //危険な例、　フォロワーの数を+1している
    await FirebaseFirestore.instance
        .collection('users')
        .doc(passiveUser.uid)
        .update({
          //Firestore上の値に-1
          "followerCount" : FieldValue.increment(-1)
        });
  }
}
