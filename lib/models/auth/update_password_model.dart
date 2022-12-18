//flutter
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    //！でboolを反転
    notifyListeners();
  }

  Future<void> updatePassword({required BuildContext context}) async {
    final User user = returnAuthUser()!;
    try {
      await user.updatePassword(newPassword);
      await voids.showfluttertoast(msg: updatedPasswordMsg);
      //reauthenticationPageへ
      Navigator.pop(context);
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
