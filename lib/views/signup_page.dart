//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//package
import 'package:riverpod/riverpod.dart';
import 'package:sns_vol2/details/rounded_button.dart';
import 'package:sns_vol2/details/rounded_password_field.dart';
//model
import 'package:sns_vol2/models/signup_model.dart';
//components
import 'package:sns_vol2/details/rounded_text_field.dart';
//constants
import 'package:sns_vol2/constants/strings.dart';

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
      appBar: AppBar(
        title: Text(signupTitle),
      ),
      body: Column(
        children: [
          RoundedTextField(
            keybordType: TextInputType.emailAddress,
            onChanged: (text) => signUpModel.email = text,
            controller: emailEditingCntoroller,
            color: Colors.white,
            borderColor: Colors.white,
            hintText: mailAddressText,
          ),
          RoundedPasswordField(
              onChanged: (text) => signUpModel.password = text,
              obscureText: signUpModel.isObscure,
              passwordEditingController: passwordEditingCntoroller,
              toggleObscureText: () => signUpModel.toggleIsObscure(),
              color: Colors.white,
              borderColor: Colors.white),
          RoundedButton(
            onPressed: () async =>
                await signUpModel.createUser(context: context),
            widthRate: 0.35,
            color: Colors.blue,
            text: signupTitle,
          ),
        ],
      ),
    );
  }
}
