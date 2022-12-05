//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sns_vol2/constants/others.dart';

final homeProvider = ChangeNotifierProvider((ref) => HomeModel());

class HomeModel extends ChangeNotifier {
  bool isLoading = false;
  late User? currentUser;
  final RefreshController refreshController = RefreshController();
  List<DocumentSnapshot<Map<String, dynamic>>> postDocs = [];
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
    startLoading();
    final query = returnQuery();
    final qshot = await query.get();
    postDocs = qshot.docs;
    endLoading();
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
    if (postDocs.isNotEmpty) {
      final qshot = await returnQuery().endBeforeDocument(postDocs.first).get();
      final reversed = qshot.docs.reversed.toList();
      for (final postDoc in reversed) {
        postDocs.insert(0, postDoc);
      }
    }
    notifyListeners();
  }

  Future<void> onReload() async {
    startLoading();
    final qshot = await returnQuery().get();
    postDocs = qshot.docs;
    endLoading();
    notifyListeners();
  }

  Future<void> onLoading() async {
    refreshController.loadComplete();
    if (postDocs.isNotEmpty) {
      final qshot = await returnQuery().startAfterDocument(postDocs.last).get();
      for (final postDoc in qshot.docs) {
        postDocs.add(postDoc);
      }
    }
    notifyListeners();
  }
}
