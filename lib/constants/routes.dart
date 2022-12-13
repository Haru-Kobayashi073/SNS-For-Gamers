//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sns_vol2/domain/comment/comment.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/domain/post/post.dart';
//packages
import 'package:sns_vol2/main.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/mute_users_model.dart';
import 'package:sns_vol2/views/account_page.dart';
import 'package:sns_vol2/views/admin_page.dart';
import 'package:sns_vol2/views/comments/comments_page.dart';
import 'package:sns_vol2/views/edit_profile_page.dart';
import 'package:sns_vol2/views/main/passive_user_profle_page.dart';
import 'package:sns_vol2/views/mute_users_page.dart';
import 'package:sns_vol2/views/replies/replies_page.dart';
import 'package:sns_vol2/views/signup_page.dart';
import 'package:sns_vol2/views/login_page.dart';

void toMyAppPage({required BuildContext context}) =>
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

void toPassiveUserProfilePage(
        {required BuildContext context,
        required FirestoreUser passiveUser,
        required MainModel mainModel}) =>
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PassiveUserProfilePage(
                  passiveUser: passiveUser,
                  mainModel: mainModel,
                )));

void toAdminPage(
        {required BuildContext context, required MainModel mainModel}) =>
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AdminPage(
                  mainModel: mainModel,
                )));

void toCommentsPage(
        {required BuildContext context,
        required Post post,
        required DocumentSnapshot<Map<String, dynamic>> postDoc,
        required MainModel mainModel,
        required MuteUsersModel muteUserModel}) =>
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CommentsPage(
                  post: post,
                  postDoc: postDoc,
                  mainModel: mainModel,
                  muteUserModel: muteUserModel,
                )));

void toRepliesPage(
        {required BuildContext context,
        required Comment comment,
        required DocumentSnapshot<Map<String, dynamic>> commentDoc,
        required MainModel mainModel}) =>
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RepliesPage(
                comment: comment,
                commentDoc: commentDoc,
                mainModel: mainModel)));

void toEditProfilePage(
        {required BuildContext context, required MainModel mainModel}) =>
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditProfilePage(
                  mainModel: mainModel,
                )));

void toMuteUsersPage(
        {required BuildContext context, required MainModel mainModel}) =>
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MuteUsersPage(
                  mainModel: mainModel,
                )));
