//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/posts_model.dart';

class PostLikeButton extends StatelessWidget {
  const PostLikeButton(
      {Key? key,
      required this.mainModel,
      required this.post,
      required this.postsModel,
      required this.postDoc})
      : super(key: key);
  final MainModel mainModel;
  final Post post;
  final PostsModel postsModel;
  final DocumentSnapshot<Map<String, dynamic>> postDoc;

  @override
  Widget build(BuildContext context) {
    return mainModel.likePostIds.contains(post.postId)
        ? InkWell(
            child: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            onTap: () async => await postsModel.unlike(
                post: post,
                postDoc: postDoc,
                postRef: postDoc.reference,
                mainModel: mainModel),
          )
        : InkWell(
            child: const Icon(Icons.favorite),
            onTap: () async => await postsModel.like(
                post: post,
                postDoc: postDoc,
                postRef: postDoc.reference,
                mainModel: mainModel),
          );
  }
}
