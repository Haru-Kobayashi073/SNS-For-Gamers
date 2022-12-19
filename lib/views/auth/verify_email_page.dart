//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/models/auth/verify_email_model.dart';

class VerifyEmailPage extends ConsumerWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(verifyEmailProvider);

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const Text("メールアドレスを認証するメールを送信しました。"),
      ),
    );
  }
}
