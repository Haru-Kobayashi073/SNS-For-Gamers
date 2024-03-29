//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/card_popup_menu_button.dart';
import 'package:sns_vol2/details/post_like_button.dart';
import 'package:sns_vol2/details/user_image.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/models/comments_model.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/mute_users_model.dart';
import 'package:sns_vol2/models/posts_model.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;

class InCommentPostCard extends StatelessWidget {
  const InCommentPostCard({
    Key? key,
    required this.mainModel,
    required this.post,
    required this.postDoc,
    required this.commentsModel,
    required this.postsModel,
    required this.muteUserModel,
  }) : super(key: key);
  final MainModel mainModel;
  final CommentsModel commentsModel;
  final PostsModel postsModel;
  final DocumentSnapshot<Map<String, dynamic>> postDoc;
  final Post post;
  final MuteUsersModel muteUserModel;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    final FirestoreUser firestoreUser = mainModel.firestoreUser;
    final bool isMyComment = post.uid == firestoreUser.uid;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        elevation: 20,
        // color: Color.fromARGB(255, 58, 58, 58),
        color: const Color.fromARGB(255, 225, 231, 225),
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UserImage(
                          length: 48,
                          userImageURL: post.uid == mainModel.firestoreUser.uid
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
                                    color: colors.green),
                              ),
                            ],
                          ),
                          Text(
                            post.text,
                            style: const TextStyle(color: colors.green),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                CardPopupMenuButton(
                  muteUsersModel: muteUserModel,
                  text: mutePostButtonText,
                  onSelected: (value) {},
                ),
              ],
            ),
            // createPostModel.video == null ?
            // Container() :
            Row(
              children: [
                SizedBox(
                  width: maxWidth * 0.15,
                ),
                Container(
                  width: maxWidth * 0.7,
                  height: maxHeight * 0.23,
                  child: const Image(
                      image: NetworkImage(
                          'https://cdn1.epicgames.com/offer/cbd5b3d310a54b12bf3fe8c41994174f/EGS_VALORANT_RiotGames_S1_2560x1440-e746d8e946fd6dfc9f17bc343e94500a?h=270&resize=1&w=480')),
                  // child: Image.file(createPostModel.video!, fit: BoxFit.cover),
                ),
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
                        color: colors.green,
                      ),
                      onTap: () => commentsModel.showCommentFlashBar(
                          context: context,
                          mainModel: mainModel,
                          postDoc: postDoc),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        post.postCommentCount.toString(),
                        style: const TextStyle(color: colors.green),
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
    );
  }
}
