//flutter
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sns_vol2/constants/routes.dart' as routes;
//model
import 'package:sns_vol2/models/main_model.dart';

final loginProvider = ChangeNotifierProvider((ref) => LoginModel());

class LoginModel extends ChangeNotifier {
  //auth
  String email = '';
  String password = '';
  bool isObscure = true;

  Future<void> login({required BuildContext context}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      //ログインする ->　mainModelのcurrentUserが更新される
      routes.toMyAppPage(context: context);
      //モデルを跨いで処理をするのはあまり綺麗ではない
      //ログインされた瞬間にmainModelのcurrentUserが更新されるのは難しい
      //なのでMyHomePageが描画された時に、MainModelを起動し、ユーザー情報を更新すればいい
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  void toggleIsObscure() {
    isObscure = !isObscure;
    //！でboolを反転
    notifyListeners();
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
