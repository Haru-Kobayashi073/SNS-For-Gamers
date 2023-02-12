//flutter
// ignore_for_file: depend_on_referenced_packages

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
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sns_vol2/views/main/components/video_watch_page.dart';
import 'package:sns_vol2/views/main/post/post_page.dart';

final createPostModelProvider =
    ChangeNotifierProvider((ref) => CreatePostModel());

class CreatePostModel extends ChangeNotifier {
  final TextEditingController textEditingController = TextEditingController();
  String text = '';
  File? video;
  // File? video = File(XFile.path);

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
              // await createPost(mainModel: mainModel);
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

  Future<void> createPost(
      {required MainModel mainModel, required bool postModeToggle}) async {
    final FirestoreUser firestoreUser = mainModel.firestoreUser;
    final Timestamp now = Timestamp.now();
    final String activeUid = mainModel.currentUserDoc.id;
    print(video);
    final pickedVideo = await uploadImageAndGetURL(
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
        video: pickedVideo,
        isVideo: postModeToggle,
        postId: postId,
        uid: activeUid);
//currentUserDoc.reference = FirebaseFirestore.instance.collection('users').doc(firestoreUser.uid)
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

    //データの型をPickedFileからFileに変更する。
    // final pickFile = File(pickVideoOrImage.path);

    // //localPathを呼び出して、アプリ内のストレージ領域を確保。
    // final path = await localPath;

    // //拡張子を取得
    // final String fileName = basename(pickVideoOrImage.path);

    // //pickした動画をコピーする場所を作成。
    // final videoPath = '$path/$fileName';

    // //pickした動画をvideoPathにコピー。※ .copyはデータの型がFileの必要あり。
    // final File saveVideo = await pickFile.copy(videoPath);

    //saveVideoを引数に、VideoItemページに移動。
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => PostPage(mainModel: mainModel),
    //   ),
    // );
  }

  // Future<dynamic> pickVideo({required MainModel mainModel}) async {
  //   var result = await others.returnXFile();
  //   if (result != null) {
  //     await uploadImageAndGetURL(
  //         uid: mainModel.currentUserDoc.id, file: result);
  //     video = result;
  //   }
  //   notifyListeners();
  //   return video;
  // }
}
