//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sns_vol2/details/card_popup_menu_button.dart';
import 'package:sns_vol2/details/post_like_button.dart';
import 'package:sns_vol2/details/user_image.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/models/comments_model.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/mute_user_model.dart';
import 'package:sns_vol2/models/posts_model.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.mainModel,
    required this.post,
    required this.postDoc,
    required this.commentsModel,
    required this.postsModel,
    required this.onselected,
    required this.muteUserModel
  }) : super(key: key);
  final MainModel mainModel;
  final CommentsModel commentsModel;
  final PostsModel postsModel;
  final DocumentSnapshot<Map<String, dynamic>> postDoc;
  final Post post;
  final void Function(String)? onselected;
  final MuteUserModel muteUserModel;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(color: Colors.grey, width: 0),
      )),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: UserImage(
                      length: 48,
                      userImageURL: post.uid == mainModel.firestoreUser.uid
                          ? mainModel.firestoreUser.userImageURL
                          : post.imageURL),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          mainModel.firestoreUser.userName,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Text(post.text),
                  ],
                ),
              ],
            ),
            CardPopupMenuButton(
              onSelected: onselected,
              muteUserModel: muteUserModel,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                InkWell(
                  child: Icon(
                    Icons.messenger_outline_rounded,
                  ),
                  onTap: () async => await commentsModel.onCommentButtonPressed(
                      context: context,
                      mainModel: mainModel,
                      post: post,
                      postDoc: postDoc),
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
    );
  }
}
