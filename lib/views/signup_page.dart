//flutter
import 'package:flutter/material.dart';
//package
import 'package:flutter_riverpod/flutter_riverpod.dart';
//details
import 'package:sns_vol2/details/rounded_text_field.dart';
import 'package:sns_vol2/details/rounded_button.dart';
import 'package:sns_vol2/details/rounded_password_field.dart';
//models
import 'package:sns_vol2/models/signup_model.dart';
//constants
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SignUpModel signUpModel = ref.watch(signupProvider);
    final TextEditingController emailEditingCntoroller =
        TextEditingController(text: signUpModel.email);
    final TextEditingController passwordEditingCntoroller =
        TextEditingController(text: signUpModel.password);

    return Scaffold(
      backgroundColor: colors.green,
      appBar: AppBar(
        title: const Text(signupTitle),
        backgroundColor: colors.green,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 160, 0, 0),
        child: Column(
          children: [
            RoundedTextField(
              keybordType: TextInputType.emailAddress,
              onChanged: (text) => signUpModel.email = text,
              controller: emailEditingCntoroller,
              color: colors.shadeGrey,
              borderColor: Colors.black,
              hintText: mailAddressText,
            ),
            const SizedBox(
              height: 20,
            ),
            RoundedPasswordField(
                onChanged: (text) => signUpModel.password = text,
                obscureText: signUpModel.isObscure,
                passwordEditingController: passwordEditingCntoroller,
                toggleObscureText: () => signUpModel.toggleIsObscure(),
                color: colors.shadeGrey,
                borderColor: colors.black),
            const SizedBox(
              height: 20,
            ),
            RoundedButton(
              onPressed: () async =>
                  await signUpModel.createUser(context: context),
              widthRate: 0.35,
              color: colors.black,
              text: signupTitle,
              textColor: colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
