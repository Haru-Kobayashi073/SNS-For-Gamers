//flutter
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
//domain

final mainProvider = ChangeNotifierProvider(
  (ref) => MainModel(),
);

//ChangeNotifier = 値の変更を知らせる
class MainModel extends ChangeNotifier {
  int counter = 0;
  User? currentUser;

  void setCurrentUser() {
    currentUser = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }
}
