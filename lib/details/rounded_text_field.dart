import 'package:flutter/material.dart';
import 'package:sns_vol2/details/text_field_container.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField(
      {Key? key,
      required this.keybordType,
      required this.onChanged,
      required this.controller,
      required this.color,
      required this.borderColor,
      required this.hintText
      })
      : super(key: key);
  final TextInputType keybordType;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final Color color;
  final Color borderColor;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        color: color,
        borderColor: borderColor,
        child: TextFormField(
          keyboardType: keybordType,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,)
            ),
          controller: controller,
        ));
  }
}
