import 'package:flutter/material.dart';
import 'package:sns_vol2/details/rounded_button.dart';
import 'package:sns_vol2/details/rounded_text_field.dart';

class TextFieldAndButtonScreen extends StatelessWidget {
  const TextFieldAndButtonScreen({
    super.key,
    required this.appbarTitle,
    required this.buttonText,
    required this.hintText,
    required this.explainText,
    required this.keybordType,
    required this.controller,
    required this.onPressed,
    required this.onChanged,
  });
  final String appbarTitle;
  final String buttonText;
  final String hintText;
  final String explainText;
  final TextInputType keybordType;
  final TextEditingController controller;
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
            Text(explainText),
            RoundedTextField(
                keybordType: keybordType,
                onChanged: onChanged,
                controller: controller,
                color: Colors.white,
                borderColor: Colors.grey,
                hintText: ''),
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
