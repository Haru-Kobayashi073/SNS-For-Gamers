//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//constants
import 'package:sns_vol2/constants/strings.dart';
//models
import 'package:sns_vol2/models/auth/account_model.dart';
import 'package:sns_vol2/models/auth/update_password_model.dart';
//views
import 'package:sns_vol2/views/auth/components/password_field_and_button_screen.dart';
class UpdatePasswordPage extends ConsumerWidget {
  const UpdatePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AccountModel accountModel = ref.watch(accountProvider);
    final UpdatePasswordModel updatePasswordModel =
        ref.watch(updatePasswordProvider);
    final TextEditingController textEditingController =
        TextEditingController(text: updatePasswordModel.newPassword);

    return PasswordFieldAndButtonScreen(
        appbarTitle: updatePasswordPageTitle,
        buttonText: updateButtonText,
        onPressed: () async =>
            await updatePasswordModel.updatePassword(context: context),
        onChanged: (value) => updatePasswordModel.newPassword = value,
        obscureText: updatePasswordModel.isObscure,
        toggleObscureText: () => updatePasswordModel.toggleIsObscure(),
        textEditingController: textEditingController);
  }
}
