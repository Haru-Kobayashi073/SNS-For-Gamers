//flutter
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sns_vol2/constants/others.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/domain/user_update_log/user_update_log.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/views/login_page.dart';

final editProfileProvider = ChangeNotifierProvider((ref) => EditProfileModel());

class EditProfileModel extends ChangeNotifier {
  File? croppedFile;
  String userName = '';
  String introduction = '';

  Future<void> updateUserInfo(
      {required BuildContext context, required MainModel mainModel}) async {
    String userImageURL = '';
    if (!(userName.isEmpty && croppedFile == null)) {
      final currentUserDoc = mainModel.currentUserDoc;
      final firestoreUser = mainModel.firestoreUser;
      if (croppedFile != null) {
        userImageURL = await uploadImageAndGetURL(
            uid: currentUserDoc.id, file: croppedFile!);
      } else {
        //croppedFileがnullなら
        userImageURL = firestoreUser.userImageURL;
      }
      if (userName.isEmpty) {
        userName = firestoreUser.userName;
      }
      mainModel.updateFrontUserInfo(
          newUserName: userName, newUserImageURL: userImageURL, introduction: introduction);
      Navigator.pop(context);
      //idを指定する必要がない。＝アプリから呼び出すことがなく、消すこともないから
      final UserUpdateLog updateLog = UserUpdateLog(
          logCreatedAt: Timestamp.now(),
          userName: userName,
          userImageURL: userImageURL,
          introduction: introduction,
          userRef: currentUserDoc.reference,
          uid: currentUserDoc.id);
      // doc()とidを指定しないと、勝手に生成してくれる
      await currentUserDoc.reference
          .collection('userUpdateLogs')
          .doc()
          .set(updateLog.toJson());
    }
  }

  // Future<void> pickImage() async {
  //   xFile = await returnXFile();
  // }

  Future<void> onImageTapped() async {
    final XFile xFile = await returnXFile();
    croppedFile = await returnCroppedFile(xFile: xFile);
    notifyListeners();
  }
}

Future<String> uploadImageAndGetURL(
    {required String uid, required File file}) async {
  final String fileName = returnJpgFileName();
  final Reference storageRef =
      FirebaseStorage.instance.ref().child('users').child(uid).child(fileName);
  // users/uid/ファイル名 にアップロード
  await storageRef.putFile(file);
  // users/uid/ファイル名 のURLを取得している
  return await storageRef.getDownloadURL();
}
