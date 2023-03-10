//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//constants
import 'package:sns_vol2/constants/colors.dart' as colors;
import 'package:sns_vol2/constants/others.dart' as others;
//details
import 'package:sns_vol2/details/animated_toggle_button.dart';
import 'package:sns_vol2/details/user_image.dart';
import 'package:sns_vol2/models/create_post_model.dart';
import 'package:sns_vol2/models/main_model.dart';

class PostPage extends ConsumerWidget {
  const PostPage({super.key, required this.mainModel});
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CreatePostModel createPostModel = ref.watch(createPostModelProvider);
    final TextEditingController textEditingController =
        TextEditingController(text: createPostModel.text);
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;
    final firestoreUser = mainModel.firestoreUser;
    bool postModeToggle = true;

    return Scaffold(
      backgroundColor: colors.green,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.green,
        actions: [
          IconButton(
              onPressed: () async {
                await createPostModel.createPost(
                    mainModel: mainModel, postModeToggle: postModeToggle);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.send)),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 24),
                child: Container(
                  width: maxWidth * 0.9,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: colors.cardBackColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: UserImage(
                                length: 48,
                                userImageURL: firestoreUser.userImageURL),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 9.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  mainModel.firestoreUser.userName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: colors.green),
                                ),
                                SizedBox(
                                  width: maxWidth * 0.68,
                                  child: TextFormField(
                                    controller: textEditingController,
                                    onChanged: (value) =>
                                        createPostModel.text = value,
                                    autofocus: true,
                                    maxLines: 6,
                                    minLines: 1,
                                    keyboardType: TextInputType.multiline,
                                    decoration: InputDecoration(
                                      hoverColor: colors.green,
                                      hintText: "detail...",
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 2,
                                          color: colors.green,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                          width: 2,
                                          color: colors.green,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: maxHeight * 0.02,
                                ),
                                GestureDetector(
                                    onTap: () async {
                                      createPostModel.video =
                                          await others.returnXFile(
                                              postModeToggle: postModeToggle);
                                      print(createPostModel.video);
                                    },
                                    child: Container(
                                        width: maxWidth * 0.68,
                                        height: maxHeight * 0.1,
                                        color: const Color.fromARGB(
                                            255, 213, 210, 210),
                                        child: postModeToggle == true
                                            ? const Icon(
                                                Icons
                                                    .add_photo_alternate_outlined,
                                                color: Colors.white,
                                                size: 40,
                                              )
                                            : const Icon(
                                                Icons.video_file_outlined,
                                                color: Colors.white,
                                                size: 40,
                                              ))),
                                AnimatedToggle(
                                    values: const ['photo', 'video'],
                                    onToggleCallback: (value) {
                                      if (value == 1) {
                                        postModeToggle = false;
                                        print(postModeToggle);
                                      } else {
                                        postModeToggle = true;
                                        print(postModeToggle);
                                      }
                                    })
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
