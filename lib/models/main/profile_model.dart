//flutter
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
//constants
import 'package:sns_vol2/constants/enums.dart';
import 'package:sns_vol2/constants/lists.dart';
import 'package:sns_vol2/constants/others.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/constants/voids.dart' as voids;

final profileProvider = ChangeNotifierProvider((ref) => ProfileModel());

class ProfileModel extends ChangeNotifier {
  bool isLoading = false;
  late User? currentUser;
  final RefreshController refreshController = RefreshController();
  List<DocumentSnapshot<Map<String, dynamic>>> postDocs = [];
  SortState sortState = SortState.byNewestFirst;
  List<String> muteUids = [];
  List<String> mutePostIds = [];
  Query<Map<String, dynamic>> returnQuery() {
    final User? currentUser = returnAuthUser();
    final Query<Map<String, dynamic>> query = FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .collection('posts');
    switch (sortState) {
      case SortState.byLikeUidCount:
        return query.orderBy("LikeCount", descending: true);
      case SortState.byNewestFirst:
        return query.orderBy("createdAt", descending: true);
      case SortState.byOldestFirst:
        return query.orderBy("createdAt", descending: false);
    }
  }

  ProfileModel() {
    init();
  }

  Future<void> init() async {
    final muteUidsAndMutePostIds = await returnMuteUidsAndMutePostIds();
    muteUids = muteUidsAndMutePostIds.first;
    mutePostIds = muteUidsAndMutePostIds.last;
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
        docs: postDocs,
        query: returnQuery(),
        muteUids: muteUids,
        mutePostIds: mutePostIds);
    notifyListeners();
  }

  Future<void> onReload() async {
    await voids.processBasicDocs(
        docs: postDocs,
        query: returnQuery(),
        muteUids: muteUids,
        mutePostIds: mutePostIds);
    notifyListeners();
  }

  Future<void> onLoading() async {
    refreshController.loadComplete();
    await voids.processOldDocs(
        docs: postDocs,
        query: returnQuery(),
        muteUids: muteUids,
        mutePostIds: mutePostIds);
    notifyListeners();
  }

  void onMenuPressed({required BuildContext context}) {
    voids.showPopup(
        context: context,
        builder: (innerContext) {
          return CupertinoActionSheet(
            message: const Text('操作を選択'),
            actions: [
              CupertinoActionSheetAction(
                  onPressed: () async {
                    if (sortState != SortState.byLikeUidCount) {
                      sortState = SortState.byLikeUidCount;
                      await onReload();
                    }
                    Navigator.pop(context);
                  },
                  child: const Text("いいね順に並び替え")),
              CupertinoActionSheetAction(
                  onPressed: () async {
                    if (sortState != SortState.byNewestFirst) {
                      sortState = SortState.byNewestFirst;
                      await onReload();
                    }
                    Navigator.pop(context);
                  },
                  child: const Text("新しい順に並び替え")),
              CupertinoActionSheetAction(
                  onPressed: () async {
                    if (sortState != SortState.byOldestFirst) {
                      sortState = SortState.byOldestFirst;
                      await onReload();
                    }
                    Navigator.pop(context);
                  },
                  child: const Text("古い順に並び替え")),
              CupertinoActionSheetAction(
                  onPressed: () => Navigator.pop(innerContext),
                  child: const Text(backText)),
            ],
          );
        });
  }
}
