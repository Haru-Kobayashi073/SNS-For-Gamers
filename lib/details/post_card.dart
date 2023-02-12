//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/card_popup_menu_button.dart';
import 'package:sns_vol2/details/post_like_button.dart';
import 'package:sns_vol2/details/user_image.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/models/comments_model.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/mute_posts_model.dart';
import 'package:sns_vol2/models/mute_users_model.dart';
import 'package:sns_vol2/models/posts_model.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;
import 'package:sns_vol2/constants/voids.dart' as voids;
import 'package:sns_vol2/constants/routes.dart' as routes;
import 'package:sns_vol2/views/main/components/video_watch_page.dart';

class PostCard extends ConsumerWidget {
  const PostCard({
    Key? key,
    required this.mainModel,
    required this.post,
    required this.index,
    required this.postDocs,
    required this.muteUsersModel,
  }) : super(key: key);
  final MainModel mainModel;
  final List<DocumentSnapshot<Map<String, dynamic>>> postDocs;
  final int index;
  final Post post;
  final MuteUsersModel muteUsersModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    final PostsModel postsModel = ref.watch(postsProvider);
    final CommentsModel commentsModel = ref.watch(commentsProvider);
    final FirestoreUser firestoreUser = mainModel.firestoreUser;
    final MutePostsModel mutePostsModel = ref.watch(mutePostsProvider);
    final bool isMyComment = post.uid == firestoreUser.uid;
    final postDoc = postDocs[index];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () => routes.toFocusPostPage(
            context: context, mainModel: mainModel, post: post),
        child: Material(
          elevation: 20,
          color: const Color.fromARGB(255, 216, 218, 216),
          borderRadius: BorderRadius.circular(30),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: UserImage(
                            length: 48,
                            userImageURL:
                                post.uid == mainModel.firestoreUser.uid
                                    ? mainModel.firestoreUser.userImageURL
                                    : post.imageURL),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 9.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  mainModel.firestoreUser.userName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: colors.cardTextPrimaryColor),
                                ),
                              ],
                            ),
                            Text(
                              post.text,
                              style: const TextStyle(
                                  color: colors.cardTextPrimaryColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  CardPopupMenuButton(
                    muteUsersModel: muteUsersModel,
                    text: "option",
                    onSelected: (result) {
                      if (result == '0') {
                        voids.showPopup(
                            context: context,
                            builder: (BuildContext innerContext) =>
                                CupertinoActionSheet(
                                  actions: <CupertinoDialogAction>[
                                    CupertinoDialogAction(
                                      isDestructiveAction: true,
                                      onPressed: () async {
                                        Navigator.pop(innerContext);
                                        muteUsersModel.showMuteUserDialog(
                                            context: context,
                                            passiveUid: post.uid,
                                            mainModel: mainModel,
                                            docs: postDocs);
                                      },
                                      child: const Text(muteUserText),
                                    ),
                                    CupertinoDialogAction(
                                      isDestructiveAction: true,
                                      onPressed: () async {
                                        Navigator.pop(innerContext);
                                        mutePostsModel.showMutePostDialog(
                                            context: context,
                                            mainModel: mainModel,
                                            postDoc: postDoc,
                                            postDocs: postDocs);
                                      },
                                      child: const Text(mutePostText),
                                    ),
                                    CupertinoDialogAction(
                                      isDestructiveAction: true,
                                      onPressed: () async {
                                        Navigator.pop(innerContext);
                                        postsModel.reportPost(
                                            context: context,
                                            firestoreUser: firestoreUser,
                                            post: post,
                                            postDoc: postDoc);
                                      },
                                      child: const Text(reportPostText),
                                    ),
                                    CupertinoDialogAction(
                                      isDefaultAction: true,
                                      onPressed: () =>
                                          Navigator.pop(innerContext),
                                      child: const Text(noText),
                                    ),
                                  ],
                                ));
                      }
                    },
                  ),
                ],
              ),
              post.video == null
                  ? Row(
                      children: [
                        SizedBox(
                          width: maxWidth * 0.15,
                        ),
                        Container(
                          width: maxWidth * 0.7,
                          height: maxHeight * 0.23,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: NetworkImage(
                                'https://cdn1.epicgames.com/offer/cbd5b3d310a54b12bf3fe8c41994174f/EGS_VALORANT_RiotGames_S1_2560x1440-e746d8e946fd6dfc9f17bc343e94500a?h=270&resize=1&w=480'),
                          )),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        SizedBox(
                          width: maxWidth * 0.15,
                        ),
                        post.isVideo
                            ? Text(post.text)
                            // VideoWatchPage(post.video)
                            : Container(
                                width: maxWidth * 0.7,
                                height: maxHeight * 0.23,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: NetworkImage(post.video
                                      // 'https://cdn1.epicgames.com/offer/cbd5b3d310a54b12bf3fe8c41994174f/EGS_VALORANT_RiotGames_S1_2560x1440-e746d8e946fd6dfc9f17bc343e94500a?h=270&resize=1&w=480'
                                      ),
                                )),
                              )
                      ],
                    ),
              const SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      InkWell(
                        child: const Icon(
                          Icons.messenger_outline_rounded,
                          color: colors.cardTextPrimaryColor,
                        ),
                        onTap: () async =>
                            await commentsModel.onCommentButtonPressed(
                                context: context,
                                mainModel: mainModel,
                                post: post,
                                postDoc: postDoc,
                                muteUserModel: muteUsersModel),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          post.postCommentCount.toString(),
                          style: const TextStyle(
                              color: colors.cardTextPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                  PostLikeButton(
                      mainModel: mainModel,
                      post: post,
                      postsModel: postsModel,
                      postDoc: postDoc),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
