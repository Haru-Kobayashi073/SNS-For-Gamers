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
import 'package:sns_vol2/models/main_model.dart';

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
        case ReauthenticationState.deleteUser:
          //ユーザーを削除するDialogを表示する
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

  Future<void> logout(
      {required BuildContext context, required MainModel mainModel}) async {
    // await FirebaseAuth.instance.signOut();
    final String msg = returnL10n(context: context).logoutedMsg;
    routes.toFinishedPage(context: context, msg: msg);
  }

  Future<void> deleteUser() async {
    //ユーザーの削除にはReAuthenticationが必要
    //ユーザーの削除にはfirebase Authのトークンがないといけない
    //Documentの方を削除 ->　FirebaseAuthのユーザーを削除(厳密にいうと違う)
  }
}
