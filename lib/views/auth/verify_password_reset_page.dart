//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/models/auth/verify_password_reset_model.dart';
import 'package:sns_vol2/views/auth/components/text_field_and_button_screen.dart';

class VerifyPasswordResetPage extends ConsumerWidget {
  const VerifyPasswordResetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final VerifyPasswordResetModel verifyPasswordResetModel = ref.watch(verifyPasswordResetProvider);
    final TextEditingController controller = TextEditingController(text: verifyPasswordResetModel.email);

    return TextFieldAndButtonScreen(
        appbarTitle: "パスワードを忘れた場合",
        buttonText: "送信",
        hintText: "ログインに利用したいメールアドレス",
        explainText: "",
        keybordType: TextInputType.emailAddress,
        controller: controller,
        onPressed: () async => await verifyPasswordResetModel.sendPasswordResetEmail(context: context),
        onChanged: (value) => verifyPasswordResetModel.email = value);
  }
}
