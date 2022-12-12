//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sns_vol2/details/card_popup_menu_button.dart';
import 'package:sns_vol2/details/user_image.dart';
//domain
import 'package:sns_vol2/domain/comment/comment.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/models/comments_model.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/mute_user_model.dart';
import 'package:sns_vol2/models/replies_model.dart';
import 'package:sns_vol2/views/comments/comment_like_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentCard extends ConsumerWidget {
  const CommentCard({
    Key? key,
    required this.comment,
    required this.post,
    required this.mainModel,
    required this.commentsModel,
    required this.commentDoc,
    required this.onSelected,
    required this.muteUserModel
  }) : super(key: key);
  final Comment comment;
  final Post post;
  final MainModel mainModel;
  final CommentsModel commentsModel;
  final DocumentSnapshot<Map<String, dynamic>> commentDoc;
  final void Function(String)? onSelected;
  final MuteUserModel muteUserModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RepliesModel repliesModel = ref.watch(repliesProvider);

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
                  child: UserImage(length: 48, userImageURL: comment.userImageURL),
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
                    Text(comment.comment),
                  ],
                ),
              ],
            ),
            CardPopupMenuButton(
              onSelected: onSelected,
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
                  child: const Icon(
                    Icons.reply,
                  ),
                  onTap: () async => await repliesModel.init(
                      context: context,
                      comment: comment,
                      commentDoc: commentDoc,
                      mainModel: mainModel),
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
