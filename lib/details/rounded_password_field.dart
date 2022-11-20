//flutter
import 'package:flutter/material.dart';
import 'package:sns_vol2/constants/strings.dart';
//detail
import 'package:sns_vol2/details/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  const RoundedPasswordField({
    Key? key, 
    required this.onChanged, 
    required this.obscureText, 
    required this.passwordEditingController, 
    required this.toggleObscureText, 
    required this.color, 
    required this.borderColor
    }) : super(key: key);

  final void Function(String)? onChanged;
  final TextEditingController passwordEditingController;
  final bool obscureText;
  final void Function()? toggleObscureText;
  final Color color,borderColor;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      color: color,
      borderColor:borderColor ,
      child:  TextFormField(
            keyboardType: TextInputType.visiblePassword,
            onChanged: onChanged,
            controller: passwordEditingController,
            obscureText: obscureText,
            decoration: InputDecoration(
                suffixIcon: InkWell(
              child: obscureText
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
              onTap: toggleObscureText,
            ),
            hintText: passwordText,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,)
            ),
          ),
    );
  }
}