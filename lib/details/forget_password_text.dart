import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:sns_vol2/constants/routes.dart' as routes;

class ForgetPasswordText extends StatelessWidget {
  const ForgetPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: RichText(
              text: TextSpan(
                  // style: TextStyle(fontWeight: FontWeight.bold),
                  children: [
            TextSpan(
              text: "パスワードを忘れた場合",
              style: const TextStyle(
                color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap =
                    () => routes.toVerifyPasswordResetPage(context: context),
            ),
          ]))),
    );
  }
}
