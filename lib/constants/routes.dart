//flutter
import 'package:flutter/material.dart';
//packages
import 'package:sns_vol2/main.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/views/signup_page.dart';
import 'package:sns_vol2/views/login_page.dart';

void toMyApppPage({required BuildContext context}) => Navigator.push(
    context, MaterialPageRoute(builder: (context) => MyApp()));

void toSignUpPage({required BuildContext context}) => Navigator.push(
    context, MaterialPageRoute(builder: (context) => SignUpPage()));

void toLoginpPage({required BuildContext context, required MainModel mainModel}) => Navigator.push(
    context, MaterialPageRoute(builder: (context) => LoginPage(mainModel: mainModel,)));

