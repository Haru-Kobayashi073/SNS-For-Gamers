//flutter
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
//constants
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/constants/voids.dart' as voids;
import 'package:sns_vol2/constants/routes.dart' as routes;
//domain
import 'package:sns_vol2/domain/follower/follower.dart';
import 'package:sns_vol2/domain/following_token/following_token.dart';
//model
import 'package:sns_vol2/models/main_model.dart';

final passiveUserProfileProvider =
    ChangeNotifierProvider((ref) => PassiveUserProfileModel());

class PassiveUserProfileModel extends ChangeNotifier {
  bool isLoading = false;
  late User? currentUser;
  RefreshController refreshController = RefreshController();
  List<DocumentSnapshot<Map<String, dynamic>>> postDocs = [];
  String indexUid = "";
  Query<Map<String, dynamic>> returnQuery(
      {required DocumentSnapshot<Map<String, dynamic>> passiveUserDoc}) {
    return passiveUserDoc.reference
        .collection('posts')
        .orderBy('createdAt', descending: true);
  }

  Future<void> onUserIconPressed(
      {required MainModel mainModel, required BuildContext context,
      required DocumentSnapshot<Map<String, dynamic>> passiveUserDoc}) async {
    refreshController = RefreshController();
    routes.toPassiveUserProfilePage(
      passiveUserDoc: passiveUserDoc,
        context: context, mainModel: mainModel);
    final String passiveUid = passiveUserDoc.id;
    if (indexUid != passiveUid) {
      await onReload(muteUids: mainModel.muteUids, passiveUserDoc: passiveUserDoc);
    }
    indexUid = passiveUid;
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
      {required List<String> muteUids,
      required DocumentSnapshot<Map<String, dynamic>> passiveUserDoc}) async {
    refreshController.refreshCompleted();
    await voids.processNewDocs(
        docs: postDocs,
        query: returnQuery(passiveUserDoc: passiveUserDoc),
        muteUids: muteUids);
    notifyListeners();
  }

  Future<void> onReload(
      {required List<String> muteUids,
      required DocumentSnapshot<Map<String, dynamic>> passiveUserDoc}) async {
    await voids.processBasicDocs(
        docs: postDocs,
        query: returnQuery(passiveUserDoc: passiveUserDoc),
        muteUids: muteUids);
    notifyListeners();
  }

  Future<void> onLoading(
      {required List<String> muteUids,
      required DocumentSnapshot<Map<String, dynamic>> passiveUserDoc}) async {
    refreshController.loadComplete();
    await voids.processOldDocs(
        docs: postDocs,
        query: returnQuery(passiveUserDoc: passiveUserDoc),
        muteUids: muteUids);
    notifyListeners();
  }


  Future<void> follow(
      {required MainModel mainModel,
      required FirestoreUser passiveUser}) async {
    mainModel.followingUids.add(passiveUser.uid);
    notifyListeners();
    final String tokenId = returnUuidV4();
    final Timestamp now = Timestamp.now();
    final FollowingToken followingToken = FollowingToken(
        passiveUid: passiveUser.uid,
        createdAt: now,
        tokenId: tokenId,
        tokenType: 'following');
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
    print('ユーザーをフォローしました。');
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
    print('ユーザーのフォローを外しました');
  }
}
