//flutter
import 'package:flutter/material.dart';
//packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
//constants
import 'package:sns_vol2/constants/strings.dart';
//domain
import 'package:sns_vol2/domain/follower/follower.dart';
import 'package:sns_vol2/domain/following_token/following_token.dart';
//model
import 'package:sns_vol2/models/main_model.dart';

final passiveUserProfileProvider =
    ChangeNotifierProvider((ref) => PassiveUserProfileModel());

class PassiveUserProfileModel extends ChangeNotifier {
  Future<void> follow(
      {required MainModel mainModel,
      required FirestoreUser passiveUser}) async {
    mainModel.followingUids.add(passiveUser.uid);
    notifyListeners();
    final String tokenId = returnUuidV4();
    final Timestamp now = Timestamp.now();
    final FollowingToken followingToken = FollowingToken(
        passiveUid: passiveUser.uid, createdAt: now, tokenId: tokenId);
    final FirestoreUser activeUser = mainModel.firestoreUser;
    //自分がフォローした印
    await FirebaseFirestore.instance
        .collection('users')
        .doc(activeUser.uid)
        .collection('tokens')
        .doc(tokenId)
        .set(followingToken.toJson());
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
  }

  Future<void> unfollow(
      {required MainModel mainModel,
      required FirestoreUser passiveUser}) async {
    mainModel.followingUids.remove(passiveUser.uid);
    notifyListeners();
    //followしているTokenを取得する
    final FirestoreUser activeUser = mainModel.firestoreUser;
    //mainmodelのListにフォローする対象のUidを追加していく
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

    //受動的なユーザーがフォローされたdataを削除する
    await FirebaseFirestore.instance
        .collection('users')
        .doc(passiveUser.uid)
        .collection("followers")
        .doc(activeUser.uid)
        .delete();
  }
}
