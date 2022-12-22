//flutter
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.onPressed,
    required this.widthRate,
    required this.color,
    required this.text,
    required this.textColor
  }) : super(key: key);

  final void Function()? onPressed;
  final double widthRate;
  final Color color;
  final String text;
  final Color textColor;

  // 0 < widthRate < 1.0

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;

    return Container(
        width: maxWidth * widthRate,
        child: ClipRRect(
            // borderRadius: BorderRadius.circular(32.0),
            child: ElevatedButton(
          onPressed: onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: Text(
              text,
              style: TextStyle(color: textColor),
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: color,
          ),
        )));
  }
}
