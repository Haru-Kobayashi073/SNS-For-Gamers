//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/ints.dart';
import 'package:sns_vol2/constants/lists.dart';
import 'package:sns_vol2/constants/others.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/constants/voids.dart' as voids;

final userSearchProvider = ChangeNotifierProvider((ref) => UserSearchModel());

class UserSearchModel extends ChangeNotifier {
  String searchTerm = "";
  List<DocumentSnapshot<Map<String, dynamic>>> userDocs = [];

  //SearchModelが起動したら、initでusersを全員getする。その後に、Listに格納
  Future<void> operation({required List<String> muteUids, required List<String> mutePostIds}) async {
    if (searchTerm.length > maxSearchLength) {
      await voids.showfluttertoast(msg: maxSearchLengthMsg);
    } else if (searchTerm.isNotEmpty) {
      final List<String> searchWords =
          returnSearchWords(searchTerm: searchTerm);
      //queryは文字数-1個のwhereが必要
      final Query<Map<String, dynamic>> query =
          returnSearchQuery(searchWords: searchWords);
      await voids.processBasicDocs(
          docs: userDocs, query: query, muteUids: muteUids, mutePostIds: mutePostIds);
      notifyListeners();
    }
  }
}
