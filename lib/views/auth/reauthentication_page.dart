//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/models/auth/account_model.dart';
import 'package:sns_vol2/views/auth/components/password_field_and_button_screen.dart';
//package

class ReauthenticationPage extends ConsumerWidget {
  const ReauthenticationPage({Key? key, required this.firestoreUser}) : super(key: key);
  final FirestoreUser firestoreUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AccountModel accountModel = ref.watch(accountProvider);
    final TextEditingController textEditingController =
        TextEditingController(text: accountModel.password);

    return PasswordFieldAndButtonScreen(
        appbarTitle: reauthenticationPageTitle,
        buttonText: reauthenticateText,
        onPressed: () async =>
            await accountModel.reauthenticateWithCredential(context: context, firestoreUser: firestoreUser),
        onChanged: (value) => accountModel.password = value,
        obscureText: accountModel.isObscure,
        toggleObscureText: () => accountModel.toggleIsObscure(),
        textEditingController: textEditingController);
  }
}
