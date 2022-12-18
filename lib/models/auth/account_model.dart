//flutter
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/enums.dart';
import 'package:sns_vol2/constants/others.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/constants/voids.dart' as voids;
import 'package:sns_vol2/constants/routes.dart' as routes;

final accountProvider = ChangeNotifierProvider((ref) => AccountModel());

class AccountModel extends ChangeNotifier {
  User? currentUser = returnAuthUser();
  String password = "";
  bool isObscure = true;

  ReauthenticationState reauthenticationState =
      ReauthenticationState.initialValue;

  Future<void> reauthenticateWithCredential(
      {required BuildContext context}) async {
    currentUser = returnAuthUser();
    final String email = currentUser!.email!;
    //FirebaseAuthの大事な作業に必要
    final AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: password);
    try {
      await currentUser!.reauthenticateWithCredential(credential);
      await voids.showfluttertoast(msg: reauthenticatedMsg);
      switch (reauthenticationState) {
        case ReauthenticationState.initialValue:
          break;
        case ReauthenticationState.updatePassword:
          // updatePasswordPageに飛ばす
          routes.toUpdatePasswordPage(context: context);
          break;
        case ReauthenticationState.updateEmail:
          // updateEmailPageに飛ばす
          routes.toUpdateEmailPage(context: context);
          break;
      }
    } on FirebaseAuthException catch (e) {
      String msg = "";
      switch (e.code) {
        case "user-not-found":
          msg = userNotFoundMsg;
          break;
        case "invalid-email":
          msg = invalidEmailMsg;
          break;
        case "invalid-credential":
          msg = invalidCredentialMsg;
          break;
        case "wrong-password":
          msg = wrongPasswordMsg;
          break;
        case "user-mismatch":
          msg = userMismatchMsg;
          break;
      }
      await voids.showfluttertoast(msg: msg);
    }
  }

  void toggleIsObscure() {
    isObscure = !isObscure;
    //！でboolを反転
    notifyListeners();
  }
}
