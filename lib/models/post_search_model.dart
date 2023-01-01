//flutter
import 'package:algolia/algolia.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:sns_vol2/constants/algolia_application.dart';
import 'package:sns_vol2/constants/bools.dart';

import '../domain/post/post.dart';

final postSearchProvider = ChangeNotifierProvider((ref) => PostSearchModel());

class PostSearchModel extends ChangeNotifier {
  String searchTerm = "";
  // DocumentSnapshotではない
  // なぜならcloud Firestoreではないから
  // .startAfterDocument, .endBeforeDocumentを使用しない
  List<Map<String,dynamic>> postMaps = [];

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
}
