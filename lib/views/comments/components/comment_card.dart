//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sns_vol2/details/user_image.dart';
//domain
import 'package:sns_vol2/domain/comment/comment.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/models/comments_model.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/views/comments/comment_like_button.dart';

class CommentCard extends StatelessWidget {
  const CommentCard(
      {Key? key,
      required this.comment,
      required this.post,
      required this.mainModel,
      required this.commentsModel,
      required this.commentDoc})
      : super(key: key);
  final Comment comment;
  final Post post;
  final MainModel mainModel;
  final CommentsModel commentsModel;
  final DocumentSnapshot<Map<String, dynamic>> commentDoc;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(color: Colors.grey, width: 0),
      )),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: UserImage(length: 48, userImageURL: comment.userImageURL),
            ),
            Text(comment.comment),
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
                  onTap: () {},
                ),
              ],
            ),
            CommentLikeButton(
              mainModel: mainModel,
              comment: comment,
              commentsModel: commentsModel,
              commentDoc: commentDoc,
              post: post,
            ),
          ],
        ),
      ]),
    );
  }
}
