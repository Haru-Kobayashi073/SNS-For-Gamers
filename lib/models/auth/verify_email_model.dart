//flutter
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/others.dart';

final verifyEmailProvider = ChangeNotifierProvider((ref) => VerifyEmailModel());

class VerifyEmailModel extends ChangeNotifier {
  VerifyEmailModel() {
    init();
  }

  Future<void> init() async {
    final User user = returnAuthUser()!;
    //ユーザーのメールアドレス宛にメールが送信されます
    await user.sendEmailVerification();
  }
}
