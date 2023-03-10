//flutter
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
//constants
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/constants/voids.dart' as voids;
//domain
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/domain/post/post.dart';
//models
import 'package:sns_vol2/models/main_model.dart';

final createPostModelProvider =
    ChangeNotifierProvider((ref) => CreatePostModel());

class CreatePostModel extends ChangeNotifier {
  final TextEditingController textEditingController = TextEditingController();
  String text = '';
  File? video;
  String? videoPath;

  Future<String> uploadImageAndGetURL(
      {required String uid,
      required File file,
      required bool postModetoggle}) async {
    final String jpgFileName = returnJpgFileName();
    final String mp4FileName = returnMp4FileName();
    Reference storageRef;
    if (postModetoggle == false) {
      storageRef = FirebaseStorage.instance
          .ref()
          .child('users')
          .child(uid)
          .child(jpgFileName);
    } else {
      storageRef = FirebaseStorage.instance
          .ref()
          .child('users')
          .child(uid)
          .child(mp4FileName);
    }
    // users/uid/ファイル名 にアップロード
    await storageRef.putFile(file);
    // users/uid/ファイル名 のURLを取得している
    return await storageRef.getDownloadURL();
  }

  Future<void> createPost(
      {required MainModel mainModel, required bool postModeToggle}) async {
    final FirestoreUser firestoreUser = mainModel.firestoreUser;
    final Timestamp now = Timestamp.now();
    final String activeUid = mainModel.currentUserDoc.id;
    print(video);
    videoPath = await uploadImageAndGetURL(
        uid: activeUid, file: video!, postModetoggle: postModeToggle);
    final String postId = returnUuidV4();
    final Post post = Post(
        updatedAt: now,
        createdAt: now,
        hashTags: [],
        imageURL: "",
        likeCount: 0,
        muteCount: 0,
        postCommentCount: 0,
        reportCount: 0,
        userName: mainModel.firestoreUser.userName,
        userImageURL: mainModel.firestoreUser.userImageURL,
        userNameLanguageCode: firestoreUser.userNameLanguageCode,
        userNameNegativeScore: firestoreUser.userNameNegativeScore,
        userNamePositiveScore: firestoreUser.userNamePositiveScore,
        userNameSentiment: firestoreUser.userNameSentiment,
        text: text,
        textLanguageCode: "",
        textNegativeScore: 0,
        textPositiveScore: 0,
        textSentiment: "",
        video: videoPath,
        isVideo: postModeToggle,
        postId: postId,
        uid: activeUid);
    await mainModel.currentUserDoc.reference
        .collection('posts')
        .doc(postId)
        .set(post.toJson());
    await voids.showfluttertoast(msg: createdPostMsg);
  }

  //path_providerでアプリ内のストレージ領域を確保。
  static Future get localPath async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = appDocDir.path;
    return path;
  }

  Future<dynamic> getVideo({required bool postModeToggle}) async {
    //image pickerを用いて動画を選択する。
    ImagePicker picker = ImagePicker();
    File? pickedFile;
    if (postModeToggle == false) {
      XFile? pickVideoOrImage =
          await picker.pickVideo(source: ImageSource.gallery);
      if (pickVideoOrImage != null) {
        pickedFile = File(pickVideoOrImage.path);
        notifyListeners();
        print(pickVideoOrImage.path);
      } else {
        print('No Video selected.');
      }
    } else {
      XFile? pickVideoOrImage =
          await picker.pickImage(source: ImageSource.gallery);
      if (pickVideoOrImage != null) {
        pickedFile = File(pickVideoOrImage.path);
        notifyListeners();
        print(pickVideoOrImage.path);
      } else {
        print('No image selected.');
      }
    }
    return pickedFile;
  }
}
