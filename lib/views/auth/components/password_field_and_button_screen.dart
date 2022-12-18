import 'package:flutter/material.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/rounded_button.dart';
import 'package:sns_vol2/details/rounded_password_field.dart';

class PasswordFieldAndButtonScreen extends StatelessWidget {
  const PasswordFieldAndButtonScreen(
      {super.key,
      required this.appbarTitle,
      required this.buttonText,
      required this.obscureText,
      required this.toggleObscureText,
      required this.textEditingController,
      required this.onPressed,
      required this.onChanged,
      });
  final String appbarTitle;
  final String buttonText;
  final bool obscureText;
  final TextEditingController textEditingController;
  final void Function()? toggleObscureText;
  final void Function()? onPressed;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appbarTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedPasswordField(
                onChanged: onChanged,
                obscureText: obscureText,
                passwordEditingController: textEditingController,
                toggleObscureText: toggleObscureText,
                color: Colors.white,
                borderColor: Colors.grey),
            RoundedButton(
                onPressed: onPressed,
                widthRate: 0.5,
                color: Colors.black,
                text: buttonText,
                textColor: Colors.white),
          ],
        ),
      ),
    );
  }
}
