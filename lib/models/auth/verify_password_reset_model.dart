//flutter
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/constants/voids.dart' as voids;

final verifyPasswordResetProvider =
    ChangeNotifierProvider((ref) => VerifyPasswordResetModel());

class VerifyPasswordResetModel extends ChangeNotifier {
  String email = "";

  Future<void> sendPasswordResetEmail({required BuildContext context}) async {
    try {
      //パスワードをリセットするためのメールを送る
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      await voids.showfluttertoast(msg: sendMailMsg);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      String msg = "";
      switch (e.code) {
        case "auth/missing-ios-bundle-id":
          msg = missingIosBundleIdMsg;
          break;
        case "auth/invalid-email":
          msg = invalidEmailMsg;
          break;
        case "auth/missing-android-pkg-name":
          msg = missingAndroidPkgNameMsg;
          break;
        case "auth/user-not-found":
          msg = userNotFoundMsg;
          break;
      }
      await voids.showfluttertoast(msg: msg);
    }
  }
}
