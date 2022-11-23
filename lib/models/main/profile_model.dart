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
import 'package:sns_vol2/domain/following_token/following_token.dart';
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

  Future<void> follow(
      {required MainModel mainModel,
      required FirestoreUser passiveFirestoreUser}) async {
    mainModel.followingUids.add(passiveFirestoreUser.uid);
    //mainmodelのListにフォローする対象のUidを追加していく
    notifyListeners();
    final String tokenId = returnUuidV4();
    final FollowingToken followingToken = FollowingToken(
        passiveUid: passiveFirestoreUser.uid,
        createdAt: Timestamp.now(),
        tokenId: tokenId);
    final FirestoreUser activeUser = mainModel.firestoreUser;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(activeUser.uid)
        .collection('tokens')
        .doc(tokenId)
        .set(followingToken.toJson());
  }

  Future<void> unfollow(
      {required MainModel mainModel,
      required FirestoreUser passiveFirestoreUser}) async {
    mainModel.followingUids.remove(passiveFirestoreUser.uid);
    //mainmodelのListにフォローする対象のUidを追加していく
    notifyListeners();
    //followしているTokenを取得する
    final FirestoreUser activeUser = mainModel.firestoreUser;
    //qshotというdataの塊の存在を取得
    final QuerySnapshot<Map<String, dynamic>> qshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(activeUser.uid)
        .collection('tokens')
        .where('passiveUid', isEqualTo: passiveFirestoreUser.uid)
        .get();
    //passiveUidが受動的なユーザーと同じだった場合にコレクションする
    //一個しか取得してないけど複数している扱い
    final List<DocumentSnapshot<Map<String, dynamic>>> docs = qshot.docs;
    final DocumentSnapshot<Map<String, dynamic>> token = docs.first;
    //await FirebaseFirestore.instance.collection('users').doc(activeUser.uid).collection('tokens').doc(tokenId).delete();
    await token.reference.delete();
  }
}
