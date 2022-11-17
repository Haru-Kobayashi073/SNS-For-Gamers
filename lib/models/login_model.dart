//flutter
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

final loginProvider = ChangeNotifierProvider((ref) => LoginModel());

class LoginModel extends ChangeNotifier {
  //auth
  String email = '';
  String password = '';
  bool isObscure = true;
  User? currentUser = null;

  Future<void> login() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      currentUser = FirebaseAuth.instance.currentUser;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  void toggleIsObscure() {
    isObscure = !isObscure;
    //！でboolを反転
    notifyListeners();
  }
}
