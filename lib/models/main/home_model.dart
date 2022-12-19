//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sns_vol2/constants/ints.dart';
import 'package:sns_vol2/constants/lists.dart';
import 'package:sns_vol2/constants/others.dart';
import 'package:sns_vol2/constants/voids.dart' as voids;
import 'package:sns_vol2/domain/timeline/timeline.dart';

final homeProvider = ChangeNotifierProvider((ref) => HomeModel());

class HomeModel extends ChangeNotifier {
  //フォローしているユーザーの投稿の取得に使用する
  List<DocumentSnapshot<Map<String, dynamic>>> postDocs = [];
  List<DocumentSnapshot<Map<String, dynamic>>> timelineDocs = [];
  bool isLoading = false;
  User currentUser = returnAuthUser()!;
  final RefreshController refreshController = RefreshController();
  List<String> muteUids = [];
  // Query<Map<String, dynamic>> returnQuery() {
  //   final User? currentUser = returnAuthUser();
  //   return FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(currentUser!.uid)
  //       .collection('posts')
  //       .orderBy('createdAt', descending: true)
  //       .limit(30);
  // }

  Query<Map<String, dynamic>> returnQuery(
      {required QuerySnapshot<Map<String, dynamic>> timelineQshot}) {
    final List<String> max10TimelinePostIds = timelineQshot.docs
        .map((e) => Timeline.fromJson(e.data()).postId)
        .toList();
    if (max10TimelinePostIds.isEmpty) {
      max10TimelinePostIds.add(""); //whereInの中身が空だとErrorを返す
    }
    return FirebaseFirestore.instance
        .collectionGroup("posts")
        .where("postId", whereIn: max10TimelinePostIds)
        .limit(tenCount);
  }

  HomeModel() {
    init();
  }

  Future<void> init() async {
    muteUids = await returnMuteUids();
    await onReload();
  }

  Future<void> onRefresh() async {
    refreshController.refreshCompleted();
    final timelineQshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser.uid)
        .collection("timelines")
        .orderBy("createdAt", descending: true)
        .endAtDocument(timelineDocs.first)
        .limit(tenCount)
        .get();
    for (final doc in timelineQshot.docs.reversed.toList()) {
      timelineDocs.insert(0, doc);
    }
    await voids.processNewDocs(
        docs: postDocs,
        query: returnQuery(timelineQshot: timelineQshot),
        muteUids: muteUids);
    notifyListeners();
  }

  Future<void> onReload() async {
    final timelineQshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser.uid)
        .collection("timelines")
        .orderBy("createdAt", descending: true)
        .limit(tenCount)
        .get();
    timelineDocs = timelineQshot.docs;
    if (timelineDocs.isNotEmpty) {
      await voids.processBasicDocs(
          docs: postDocs,
          query: returnQuery(timelineQshot: timelineQshot),
          muteUids: muteUids);
    }
    notifyListeners();
  }

  Future<void> onLoading() async {
    refreshController.loadComplete();
    final timelineQshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser.uid)
        .collection("timelines")
        .orderBy("createdAt", descending: true)
        .startAfterDocument(timelineDocs.last)
        .limit(tenCount)
        .get();
    for (final doc in timelineQshot.docs) {
      timelineDocs.add(doc);
    }
    await voids.processOldDocs(
        docs: postDocs,
        query: returnQuery(timelineQshot: timelineQshot),
        muteUids: muteUids);
    notifyListeners();
  }
}
