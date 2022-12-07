//flutter
import 'package:flutter/material.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/rounded_button.dart';
import 'package:sns_vol2/models/main/home_model.dart';

class ReloadScreen extends StatelessWidget {
  const ReloadScreen({Key? key, required this.onReload}) : super(key: key);
  final void Function()? onReload;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: RoundedButton(
              onPressed: onReload,
              widthRate: 0.6,
              color: Colors.blue,
              text: reloadText),
        )
      ],
    );
  }
}
