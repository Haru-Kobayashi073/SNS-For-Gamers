//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sns_vol2/domain/comment/comment.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/models/comments_model.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/posts_model.dart';

class CommentLikeButton extends StatelessWidget {
  const CommentLikeButton(
      {Key? key,
      required this.mainModel,
      required this.comment,
      required this.commentsModel,
      required this.commentDoc,
      required this.post})
      : super(key: key);
  final MainModel mainModel;
  final Post post;
  final Comment comment;
  final CommentsModel commentsModel;
  final DocumentSnapshot<Map<String, dynamic>> commentDoc;

  @override
  Widget build(BuildContext context) {
    return mainModel.likeCommentIds.contains(comment.postCommentId)
        ? InkWell(
            child: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            onTap: () async => await commentsModel.unlike(comment: comment, mainModel: mainModel, post: post, commentDoc: commentDoc),
          )
        : InkWell(
            child: const Icon(Icons.favorite),
            onTap: () async => await commentsModel.like(
                comment: comment,
                mainModel: mainModel,
                post: post,
                commentDoc: commentDoc),
          );
  }
}
