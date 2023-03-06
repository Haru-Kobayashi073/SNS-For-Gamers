//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//constants
import 'package:sns_vol2/constants/routes.dart' as routes;
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;
//details
import 'package:sns_vol2/details/forget_password_text.dart';
import 'package:sns_vol2/details/rounded_button.dart';
import 'package:sns_vol2/details/rounded_password_field.dart';
import 'package:sns_vol2/details/rounded_text_field.dart';
//models
import 'package:sns_vol2/models/login_model.dart';
class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LoginModel loginModel = ref.watch(loginProvider);
    final TextEditingController emailEditingCntoroller =
        TextEditingController(text: loginModel.email);
    final TextEditingController passwordEditingCntoroller =
        TextEditingController(text: loginModel.password);

    return Scaffold(
      backgroundColor: colors.green,
      appBar: AppBar(
        title: const Text('Login'),
        automaticallyImplyLeading: false,
        backgroundColor: colors.green,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
        child: Column(
          children: [
            RoundedTextField(
              keybordType: TextInputType.emailAddress,
              onChanged: (text) => loginModel.email = text,
              controller: emailEditingCntoroller,
              color: colors.shadeGrey,
              borderColor: colors.black,
              hintText: mailAddressText,
            ),
            const SizedBox(height: 20,),
            RoundedPasswordField(
                onChanged: (text) => loginModel.password = text,
                obscureText: loginModel.isObscure,
                passwordEditingController: passwordEditingCntoroller,
                toggleObscureText: () => loginModel.toggleIsObscure(),
                color: colors.shadeGrey,
                borderColor: colors.black),
            const SizedBox(height: 40,),
            RoundedButton(
              onPressed: () async => await loginModel.login(context: context),
              widthRate: 0.35,
              color: colors.black,
              text: loginTitle,
              textColor: colors.black,
            ),
            TextButton(
                onPressed: () => routes.toSignUpPage(context: context),
                child: const Text(
                  noAccountMsg,
                  style: TextStyle(color: colors.greenishWhite),
                  ),
              ),
            const ForgetPasswordText()
          ],
        ),
      ),
    );
  }
}
