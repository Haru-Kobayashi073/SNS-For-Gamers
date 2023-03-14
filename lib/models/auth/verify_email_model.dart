//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//packages
import 'package:firebase_auth/firebase_auth.dart';
//constants
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
    notifyListeners();
  }
}
