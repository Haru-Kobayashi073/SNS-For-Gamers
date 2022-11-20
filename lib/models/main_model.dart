//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sns_vol2/constants/routes.dart' as routes;
import 'package:sns_vol2/constants/strings.dart';
//domain

final mainProvider = ChangeNotifierProvider(
  (ref) => MainModel(),
);

//ChangeNotifier = 値の変更を知らせる
class MainModel extends ChangeNotifier {
  bool isLoading = false;

  int counter = 0;
  User? currentUser = null;
  late DocumentSnapshot<Map<String, dynamic>> currentUserDoc;
  //Snapshotは簡単に言うとusersが持つドキュメント5行ぐらいのこと
  //jsonみたいなものでもある

  //以下関数がMainModelが起動した時の処理
  //ユーザーの動作を必要としないモデルの関数
  MainModel() {
    init();
  }

  //initの中でcurrentUserを更新すればいい
  Future<void> init() async {
    startLoading();
    //modelを跨がないでcurrentUserの更新
    currentUser = FirebaseAuth.instance.currentUser;
    currentUserDoc = await FirebaseFirestore.instance
        .collection(usersFieldKey)
        .doc(currentUser!.uid)
        .get();
    endLoading();
    //currentUserのuidの取得が可能になりました
  }

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  void setCurrentUser() {
    currentUser = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }

  Future<void> logout(
      {required BuildContext context, required MainModel mainModel}) async {
    await FirebaseAuth.instance.signOut();
    routes.toLoginpPage(context: context);
  }
}
