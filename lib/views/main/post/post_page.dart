//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;
import 'package:sns_vol2/details/user_image.dart';
import 'package:sns_vol2/models/create_post_model.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/posts_model.dart';
//package

class PostPage extends ConsumerWidget {
  const PostPage({super.key, required this.mainModel});
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CreatePostModel createPostModel = ref.watch(createPostModelProvider);
    final PostsModel postsModel = ref.watch(postsProvider);
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;
    final firestoreUser = mainModel.firestoreUser;

    return Scaffold(
      backgroundColor: colors.backScreenColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.appBarBackColor,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: maxWidth * 0.9,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                                  color: colors.cardTextPrimaryColor),
                            ),
                            SizedBox(
                              width: maxWidth * 0.68,
                              // height: 70,
                              child: TextFormField(
                                maxLines: 6,
                                minLines: 1,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  hoverColor: colors.cardTextPrimaryColor,
                                  hintText: "detail...",
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: colors.cardTextPrimaryColor,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      width: 2,
                                      color: colors.cardTextPrimaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: maxHeight * 0.02,),
                            GestureDetector(
                              onTap: () async {
                                await createPostModel.pickVideo(
                                    mainModel: mainModel);
                              },
                              child: postsModel.video == null
                                  ? Container(
                                      width: maxWidth * 0.68,
                                      height: maxHeight * 0.23,
                                      color: const Color.fromARGB(255, 213, 210, 210),
                                      child: const Icon(
                                        // Icons.add_photo_alternate_outlined,
                                        Icons.video_file_outlined,
                                        color: Colors.white,
                                        size: 100,
                                      ))
                                  : Container(
                                      width: maxWidth * 0.68,
                                      height: maxHeight * 0.23,
                                      child: Image.file(postsModel.video!,
                                          fit: BoxFit.cover),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: maxHeight * 0.05,
            )
          ],
        ),
      ),
    );
  }
}
