//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//packages
import 'package:firebase_auth/firebase_auth.dart';
//constants
import 'package:sns_vol2/constants/others.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/constants/voids.dart' as voids;

final updatePasswordProvider =
    ChangeNotifierProvider((ref) => UpdatePasswordModel());

class UpdatePasswordModel extends ChangeNotifier {
  String newPassword = "";
  bool isObscure = true;

  void toggleIsObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }

  Future<void> updatePassword({required BuildContext context}) async {
    final User user = returnAuthUser()!;
    try {
      await user.updatePassword(newPassword);
      await voids.showfluttertoast(msg: updatedPasswordMsg);
      //reauthenticationPageへ
      //AccountPageへ
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      String msg = "";
      switch (e.code) {
        case "weak-password":
          msg = weakPasswordMsg;
          break;
        case "requires-recent-login":
          msg = requiresRecentLoginMsg;
          break;
      }
      await voids.showfluttertoast(msg: msg);
    }
  }
}
