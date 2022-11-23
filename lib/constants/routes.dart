//flutter
import 'package:flutter/material.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
//packages
import 'package:sns_vol2/main.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/views/account_page.dart';
import 'package:sns_vol2/views/main/passive_user_profle_page.dart';
import 'package:sns_vol2/views/signup_page.dart';
import 'package:sns_vol2/views/login_page.dart';

void toMyApppPage({required BuildContext context}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));

void toSignUpPage({required BuildContext context}) => Navigator.push(
    context, MaterialPageRoute(builder: (context) => SignUpPage()));

void toLoginpPage({required BuildContext context}) => Navigator.push(
    context, MaterialPageRoute(builder: (context) => LoginPage()));

void toAccountPage(
        {required BuildContext context, required MainModel mainModel}) =>
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AccountPage(
                  mainModel: mainModel,
                )));

void toPassiveUserProfilePagepPage(
        {required BuildContext context, required FirestoreUser passiveUser}) =>
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PassiveUserProfilePage(
                  passiveUser: passiveUser,
                )));
