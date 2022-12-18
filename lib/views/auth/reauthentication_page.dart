//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/rounded_button.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;
import 'package:sns_vol2/details/rounded_password_field.dart';
import 'package:sns_vol2/models/auth/account_model.dart';
//package

class ReauthenticationPage extends ConsumerWidget {
  const ReauthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AccountModel accountModel = ref.watch(accountProvider);
    final TextEditingController textEditingController = TextEditingController(text: accountModel.password);

    return Scaffold(
      appBar: AppBar(title: const Text(reauthenticationPageTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedPasswordField(
                onChanged: (value) => accountModel.password = value,
                obscureText: accountModel.isObscure,
                passwordEditingController: textEditingController,
                toggleObscureText: () => accountModel.toggleIsObscure(),
                color: Colors.white,
                borderColor: Colors.grey),
            RoundedButton(
                onPressed: () async => await accountModel.reauthenticateWithCredential(),
                widthRate: 0.5,
                color: Colors.black,
                text: reauthenticateText,
                textColor: Colors.white),
          ],
        ),
      ),
    );
  }
}
