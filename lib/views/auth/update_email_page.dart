import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sns_vol2/constants/others.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/views/auth/components/text_field_and_button_screen.dart';
import 'package:sns_vol2/constants/voids.dart' as voids;

class UpdateEmailPage extends StatelessWidget {
  const UpdateEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    String newEmail = "";
    final TextEditingController controller =
        TextEditingController(text: newEmail);

    return TextFieldAndButtonScreen(
      appbarTitle: updateEmailPageTitle,
      buttonText: updateButtonText,
      hintText: mailAddressText,
      explainText: explainUpdateEmailText,
      keybordType: TextInputType.emailAddress,
      controller: controller,
      onChanged: (value) => newEmail = value,
      onPressed: () async {
        final User user = returnAuthUser()!;
        await user.verifyBeforeUpdateEmail(newEmail);
        await voids.showfluttertoast(msg: sendMailMsg);
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );
  }
}
