//flutter
import 'package:algolia/algolia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:sns_vol2/constants/algolia_application.dart';
import 'package:sns_vol2/constants/bools.dart';
import 'package:sns_vol2/constants/routes.dart' as routes;
import 'package:sns_vol2/models/main_model.dart';

final postSearchProvider = ChangeNotifierProvider((ref) => PostSearchModel());

class PostSearchModel extends ChangeNotifier {
  String searchTerm = "";
  // DocumentSnapshotではない
  // なぜならcloud Firestoreではないから
  // .startAfterDocument, .endBeforeDocumentを使用しない
  List<Map<String, dynamic>> postMaps = [];
  DocumentSnapshot<Map<String, dynamic>>? passiveUserDoc;

  Future<void> operation(
      {required List<String> muteUids,
      required List<String> mutePostIds}) async {
    if (searchTerm.isNotEmpty) {
      final Algolia algolia = Application.algolia;
      final AlgoliaQuery query =
          algolia.instance.index('posts').query(searchTerm);
      final AlgoliaQuerySnapshot snap = await query.getObjects(); //ここでデータ取得
      final List<AlgoliaObjectSnapshot> results = snap.hits;
      postMaps.removeWhere((element) => true);
      for (final result in results) {
        final map = result.data;
        if (isValidUser(muteUids: muteUids, map: map) &&
            isValidPost(mutePostIds: mutePostIds, map: map) &&
            !postMaps.contains(map)) {
          postMaps.add(map);
        }
      }
      // postMaps = results.map((e) => Post.fromJson(e.data)).toList();
      notifyListeners();
    }
  }

  Future<void> routesToUsersProf(
      {required String passiveUid,
      required BuildContext context,
      required MainModel mainModel,
      required}) async {
    final passiveUserDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(passiveUid)
        .get();
    routes.toPassiveUserProfilePage(
        context: context, mainModel: mainModel, passiveUserDoc: passiveUserDoc);
    notifyListeners();
  }
}
