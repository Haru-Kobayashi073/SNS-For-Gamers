//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';

final searchProvider = ChangeNotifierProvider((ref) => SearchModel());

class SearchModel extends ChangeNotifier {
  List<DocumentSnapshot<Map<String,dynamic>>> userDocs = [];

  SearchModel() {
    init();
  }

  //SearchModelが起動したら、initでusersを全員getする。その後に、Listに格納
  Future<void> init() async {
    final QuerySnapshot<Map<String, dynamic>> qshot =
        await FirebaseFirestore.instance.collection('users').limit(30).get();
    userDocs = qshot.docs;
    notifyListeners();
  }
}
