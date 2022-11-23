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
import 'package:sns_vol2/models/main_model.dart';

final profileProvider = ChangeNotifierProvider((ref) => ProfileModel());

class ProfileModel extends ChangeNotifier {
  File? croppedFile = null;

  // Future<void> pickImage() async {
  //   xFile = await returnXFile();
  // }

  Future<String> uploadImageAndGetURL(
      {required String uid, required File file}) async {
    final String fileName = returnJpgFileName();
    final Reference storageRef = FirebaseStorage.instance
        .ref()
        .child('users')
        .child(uid)
        .child(fileName);
    // users/uid/ファイル名 にアップロード
    await storageRef.putFile(file);
    // users/uid/ファイル名 のURLを取得している
    return await storageRef.getDownloadURL();
  }

  Future<void> uploadUserImage(
      {required DocumentSnapshot<Map<String, dynamic>> currentUserDoc}) async {
    final XFile xFile = await returnXFile();
    final File file = File(xFile.path);
    final String uid = currentUserDoc.id;
    croppedFile = await returnCroppedFile(xFile: xFile);
    final String url = await uploadImageAndGetURL(uid: uid, file: file);
    await currentUserDoc.reference.update({'userImageURL': url});
    notifyListeners();
  }

  void follow(
      {required MainModel mainModel,
      required FirestoreUser passiveFirestoreUser}) {
    mainModel.followingUids.add(passiveFirestoreUser.uid);
    //mainmodelのListにフォローする対象のUidを追加していく
    notifyListeners();
  }

  void unfollow(
      {required MainModel mainModel,
      required FirestoreUser passiveFirestoreUser}) {
    mainModel.followingUids.remove(passiveFirestoreUser.uid);
    //mainmodelのListにフォローする対象のUidを追加していく
    notifyListeners();
  }
}
