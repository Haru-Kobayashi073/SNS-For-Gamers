//flutter
import 'package:flutter/material.dart';
//packages
import 'package:sns_vol2/views/signup_page.dart';
import 'package:sns_vol2/views/login_page.dart';

void toSignUpPage({required BuildContext context}) => Navigator.push(
    context, MaterialPageRoute(builder: (context) => SignUpPage()));

void toLoginpPage({required BuildContext context}) => Navigator.push(
    context, MaterialPageRoute(builder: (context) => LoginPage()));
