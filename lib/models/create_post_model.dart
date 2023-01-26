//flutter
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flash/flash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;
import 'package:sns_vol2/constants/voids.dart' as voids;
import 'package:sns_vol2/constants/others.dart' as others;

final createPostModelProvider =
    ChangeNotifierProvider((ref) => CreatePostModel());

class CreatePostModel extends ChangeNotifier {
  final TextEditingController textEditingController = TextEditingController();
  String text = '';
  File? video;
  // File? video = File(XFile.path);

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

  void showPostDialog(
      {required BuildContext context, required MainModel mainModel}) {
    // File? video;
    context.showFlashBar(
      persistent: true,
      content: Column(
        children: [
          Form(
            child: TextFormField(
              controller: textEditingController,
              style: const TextStyle(fontWeight: FontWeight.bold),
              onChanged: (value) => text = value,
              maxLength: 30,
            ),
          ),
          GestureDetector(
            child: video == null
                ? Container(
                    height: 270,
                    width: 360,
                    color: Colors.grey,
                    child: const Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 68,
                    ),
                  )
                : Container(),
            onTap: () {},
          ),
          // GestureDetector(
          //   onTap: () async {
          //     var result = await others.returnXFile();
          //     if (result != null) {
          //       // await uploadImageAndGetURL(
          //       //     uid: mainModel.currentUserDoc.id, file: result);
          //       video = result;
          //     }
          //     notifyListeners();
          //   },
          //   child: video == null
          //       ? Container(
          //           height: 270,
          //           width: 360,
          //           color: Color.fromARGB(255, 213, 210, 210),
          //           child: Icon(
          //             Icons.add_photo_alternate_outlined,
          //             color: Colors.white,
          //             size: 100,
          //           ))
          //       : Container(
          //           height: 270,
          //           width: 360,
          //           child: Image.file(video!, fit: BoxFit.cover),
          //         ),
          // ),
        ],
      ),
      title: const Text(createPostText),
      primaryActionBuilder: (context, controller, _) {
        return InkWell(
          child: const Icon(
            Icons.send,
            color: colors.postDialogIconColor,
          ),
          onTap: () async {
            if (textEditingController.text.isNotEmpty) {
              //メインの動作
              await createPost(mainModel: mainModel);
              // await uploadImageAndGetURL(
              //     uid: mainModel.currentUserDoc.id, file: video!);

              await controller.dismiss();
              text = "";
            } else {
              //何もしない
              await controller.dismiss();
            }
          },
        );
      },
      negativeActionBuilder: (context, controller, _) {
        return InkWell(
          child: const Icon(
            Icons.close,
            color: colors.postDialogIconColor,
          ),
          onTap: () async {
            await controller.dismiss();
          },
        );
      },
    );
  }

  Future<void> createPost({required MainModel mainModel}) async {
    final FirestoreUser firestoreUser = mainModel.firestoreUser;
    final Timestamp now = Timestamp.now();
    final String activeUid = mainModel.currentUserDoc.id;
    print(video);
    final pickedVideo =
        await uploadImageAndGetURL(uid: activeUid, file: video!);
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
        video: pickedVideo,
        postId: postId,
        uid: activeUid);
//currentUserDoc.reference = FirebaseFirestore.instance.collection('users').doc(firestoreUser.uid)
    await mainModel.currentUserDoc.reference
        .collection('posts')
        .doc(postId)
        .set(post.toJson());
    await voids.showfluttertoast(msg: createdPostMsg);
  }

  Future<dynamic> pickVideo({required MainModel mainModel}) async {
    var result = await others.returnXFile();
    if (result != null) {
      await uploadImageAndGetURL(
          uid: mainModel.currentUserDoc.id, file: result);
      video = result;
    }
    notifyListeners();
    return video;
  }
}
