//package
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';

//なぜFutureを使うかというと、画像ファイルの取得には時間がかかるから非同期処理をする必要がある
Future<XFile> returnXFile() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  return image!;
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

DocumentReference<Map<String, dynamic>> currentUserDocToTokenDocRef(
        {required DocumentSnapshot<Map<String, dynamic>> currentUserDoc,
        required String tokenId}) =>
    currentUserDoc.reference.collection('tokens').doc(tokenId);
