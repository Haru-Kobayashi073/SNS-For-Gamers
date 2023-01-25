//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/enums.dart';
import 'package:sns_vol2/constants/others.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/constants/voids.dart' as voids;
import 'package:sns_vol2/constants/routes.dart' as routes;
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/models/main_model.dart';

final accountProvider = ChangeNotifierProvider((ref) => AccountModel());

class AccountModel extends ChangeNotifier {
  User? currentUser = returnAuthUser();
  String password = "";
  bool isObscure = true;

  ReauthenticationState reauthenticationState =
      ReauthenticationState.initialValue;

  Future<void> reauthenticateWithCredential(
      {required BuildContext context,
      required FirestoreUser firestoreUser}) async {
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
          showDeleteUserDialog(context: context, firestoreUser: firestoreUser);
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
    await FirebaseAuth.instance.signOut();
    final String msg = returnL10n(context: context).logoutedMsg;
    routes.toFinishedPage(context: context, msg: msg);
    Future.delayed(const Duration(seconds: 5), () {
      routes.toLoginPage(context: context);
    });
  }

  void showDeleteUserDialog(
      {required BuildContext context, required FirestoreUser firestoreUser}) {
    showCupertinoModalPopup(
        context: context,
        builder: (innerContext) => CupertinoAlertDialog(
              content: const Text(deleteUserAlertMsg),
              actions: <CupertinoDialogAction>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () => Navigator.pop(innerContext),
                  child: const Text(noText),
                ),
                CupertinoDialogAction(
                  isDestructiveAction: true,
                  onPressed: () async {
                    Navigator.pop(innerContext);
                    await deleteUser(
                        context: context, firestoreUser: firestoreUser);
                  },
                  child: const Text(yesText),
                ),
              ],
            ));
  }

  Future<void> deleteUser(
      {required BuildContext context,
      required FirestoreUser firestoreUser}) async {
    //ユーザーの削除にはReAuthenticationが必要
    //ユーザーの削除にはfirebase Authのトークンがないといけない
    //Documentの方を削除 ->　FirebaseAuthのユーザーを削除(厳密にいうと違う)
    final String msg = returnL10n(context: context).userDeletedMsg;
    final User currentUser = returnAuthUser()!;
    //deleteUserを作成する
    try {
      await FirebaseFirestore.instance
          .collection("deleteUsers")
          .doc(currentUser.uid)
          .set(firestoreUser.toJson())
          .then((_) => currentUser.delete());
    } on FirebaseException catch (e) {
      if (e.code == "requires-recent-login") {
        voids.showfluttertoast(msg: requiresRecentLoginMsg);
      }
    }
    // routes.toFinishedPage(context: context, msg: msg);
  }
}
