//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sns_vol2/domain/comment/comment.dart';
import 'package:sns_vol2/domain/reply/reply.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/replies_model.dart';

class ReplyLikeButton extends StatelessWidget {
  const ReplyLikeButton({
    Key? key,
    required this.mainModel,
    required this.reply,
    required this.comment,
    required this.repliesModel,
    required this.replyDoc,
  }) : super(key: key);
  final MainModel mainModel;
  final Comment comment;
  final Reply reply;
  final RepliesModel repliesModel;
  final DocumentSnapshot replyDoc;

  @override
  Widget build(BuildContext context) {
    final bool isLike =
        mainModel.likeReplyIds.contains(reply.postCommentReplyId);
    final likeCount = reply.likeCount;
    // final int plusOneCount = likeCount + 1;

    return Row(
      children: [
        Container(
          child: isLike
              ? InkWell(
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  onTap: () async => await repliesModel.unlike(
                      reply: reply,
                      mainModel: mainModel,
                      comment: comment,
                      replyDoc: replyDoc),
                )
              : InkWell(
                  child: const Icon(Icons.favorite),
                  onTap: () async => await repliesModel.like(
                      reply: reply,
                      mainModel: mainModel,
                      comment: comment,
                      replyDoc: replyDoc)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
              // isLike ? plusOneCount.toString() : 
              reply.likeCount.toString()),
        ),
      ],
    );
  }
}
