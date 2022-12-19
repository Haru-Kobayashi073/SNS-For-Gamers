//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sns_vol2/constants/lists.dart';
import 'package:sns_vol2/constants/others.dart';
import 'package:sns_vol2/constants/voids.dart' as voids;

final homeProvider = ChangeNotifierProvider((ref) => HomeModel());

class HomeModel extends ChangeNotifier {
  //フォローしているユーザーの投稿の取得に使用する
  List<DocumentSnapshot<Map<String,dynamic>>> postDocs = [];
  bool isLoading = false;
  late User? currentUser;
  final RefreshController refreshController = RefreshController();
  List<String> muteUids = [];
  Query<Map<String, dynamic>> returnQuery() {
    final User? currentUser = returnAuthUser();
    return FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .collection('posts')
        .orderBy('createdAt', descending: true)
        .limit(30);
  }

  HomeModel() {
    init();
  }

  Future<void> init() async {
    muteUids = await returnMuteUids();
    await onReload();
  }

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future<void> onRefresh() async {
    refreshController.refreshCompleted();
    await voids.processNewDocs(
        docs: postDocs, query: returnQuery(), muteUids: muteUids);
    notifyListeners();
  }

  Future<void> onReload() async {
    await voids.processBasicDocs(
        docs: postDocs, query: returnQuery(), muteUids: muteUids);
    notifyListeners();
  }

  Future<void> onLoading() async {
    refreshController.loadComplete();
    await voids.processOldDocs(
        docs: postDocs, query: returnQuery(), muteUids: muteUids);
    notifyListeners();
  }
}
