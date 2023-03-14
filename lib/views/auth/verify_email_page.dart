//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//models
import 'package:sns_vol2/models/auth/verify_email_model.dart';
//constants
import 'package:sns_vol2/constants/colors.dart' as colors;
import 'package:sns_vol2/constants/routes.dart' as routes;

class VerifyEmailPage extends ConsumerWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(verifyEmailProvider);

    return Scaffold(
      backgroundColor: colors.green,
      appBar: AppBar(
        backgroundColor: colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text("メールアドレスを認証するメールを送信しました。"),
            ),
            ElevatedButton(
                onPressed: () {
                  routes.toLoginPage(context: context);
                },
                child: const Text('認証が完了済みの方'))
          ],
        ),
      ),
    );
  }
}
