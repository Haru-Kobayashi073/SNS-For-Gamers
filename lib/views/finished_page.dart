import 'package:flutter/material.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;

class FinishedPage extends StatelessWidget {
  // Logout後のメッセージと削除のメッセージを受け取りたい
  const FinishedPage({super.key, required this.msg});
  final String msg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.backScreenColor,
      appBar: AppBar(
        backgroundColor: colors.appBarBackColor,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Center(
        child: Text(
          msg, 
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: colors.mainTextPrimaryColor,
            ),
          ),
      ),
    );
  }
}
