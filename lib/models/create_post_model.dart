//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flash/flash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/models/main_model.dart';

final createPostModelProvider =
    ChangeNotifierProvider((ref) => CreatePostModel());

class CreatePostModel extends ChangeNotifier {
  final TextEditingController textEditingController = TextEditingController();
  String text = '';

  void showPostDialog(
      {required BuildContext context, required MainModel mainModel}) {
    context.showFlashBar(
      persistent: true,
      content: Form(
        child: TextFormField(
          controller: textEditingController,
          style: const TextStyle(fontWeight: FontWeight.bold),
          onChanged: (value) => text = value,
          maxLength: 10,
        ),
      ),
      title: const Text(createPostText),
      primaryActionBuilder: (context, controller, _) {
        return InkWell(
          child: Icon(Icons.send),
          onTap: () async {
            if (textEditingController.text.isNotEmpty) {
              //メインの動作
              await createPost(currentUserDoc: mainModel.currentUserDoc);
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
          child: const Icon(Icons.close),
          onTap: () async => await controller.dismiss(),
        );
      },
    );
  }

  Future<void> createPost(
      {required DocumentSnapshot<Map<String, dynamic>> currentUserDoc}) async {
    final Timestamp now = Timestamp.now();
    final String activeUid = currentUserDoc.id;
    final String postId = returnUuidV4();
    final Post post = Post(
        updatedAt: now,
        createdAt: now,
        hashTags: [],
        imageURL: "",
        likeCount: 0,
        text: text,
        postId: postId,
        uid: activeUid);
//currentUserDoc.reference = FirebaseFirestore.instance.collection('users').doc(firestoreUser.uid)
    await currentUserDoc.reference
        .collection('posts')
        .doc(postId)
        .set(post.toJson());
  }
}
