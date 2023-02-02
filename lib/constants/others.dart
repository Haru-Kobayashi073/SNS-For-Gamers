//package
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//なぜFutureを使うかというと、画像ファイルの取得には時間がかかるから非同期処理をする必要がある
Future<dynamic> returnXFile({required bool postModeToggle}) async {
  ImagePicker picker = ImagePicker();
  // Image? image;
  File? file;
  if (postModeToggle == false) {
  XFile? pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      file = File(pickedFile.path);
      // image = Image.file(file);
    } else {
      print('No Video selected.');
    }
  } else {
  XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      file = File(pickedFile.path);
      // image = Image.file(file);
    } else {
      print('No image selected.');
    }
  }
  return file;
}

Future<File?> returnCroppedFile({required XFile? xFile}) async {
  final instance = ImageCropper();
  final File? result = await instance.cropImage(
      sourcePath: xFile!.path,
      aspectRatioPresets: [CropAspectRatioPreset.square],
      androidUiSettings: const AndroidUiSettings(
        toolbarTitle: cropperTitle,
        toolbarColor: Colors.blue,
        initAspectRatio: CropAspectRatioPreset.square,
        lockAspectRatio: false,
      ),
      iosUiSettings: const IOSUiSettings(
        title: cropperTitle,
      ));
  return result;
}

User? returnAuthUser() => FirebaseAuth.instance.currentUser;

DocumentReference<Map<String, dynamic>> userDocToTokenDocRef(
        {required DocumentSnapshot<Map<String, dynamic>> userDoc,
        required String tokenId}) =>
    userDoc.reference.collection('tokens').doc(tokenId);

Query<Map<String, dynamic>> returnSearchQuery(
    {required List<String> searchWords}) {
  Query<Map<String, dynamic>> users =
      FirebaseFirestore.instance.collection("users");
  final mute = users.get();
  // for (final searchWord in searchWords) {
  final query = users.where("newMuteUser25", isEqualTo: true);
  //TODO:検索機能書く
  // }
  return query;
}

AppLocalizations returnL10n({required BuildContext context}) =>
    AppLocalizations.of(context);
