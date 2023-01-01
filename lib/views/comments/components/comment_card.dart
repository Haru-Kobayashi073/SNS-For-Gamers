//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sns_vol2/constants/bools.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/card_popup_menu_button.dart';
import 'package:sns_vol2/details/user_image.dart';
//domain
import 'package:sns_vol2/domain/comment/comment.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/models/comments_model.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/mute_users_model.dart';
import 'package:sns_vol2/models/replies_model.dart';
import 'package:sns_vol2/views/comments/comment_like_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentCard extends ConsumerWidget {
  const CommentCard(
      {Key? key,
      required this.comment,
      required this.post,
      required this.mainModel,
      required this.commentsModel,
      required this.commentDoc,
      required this.onSelected,
      required this.muteUserModel})
      : super(key: key);
  final Comment comment;
  final Post post;
  final MainModel mainModel;
  final CommentsModel commentsModel;
  final DocumentSnapshot<Map<String, dynamic>> commentDoc;
  final void Function(String)? onSelected;
  final MuteUsersModel muteUserModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //updateされた瞬間にmainModelのfirestoreUserは更新されている
    final RepliesModel repliesModel = ref.watch(repliesProvider);
    final FirestoreUser firestoreUser = mainModel.firestoreUser;
    final bool isMyComment = comment.uid == firestoreUser.uid;

    return isValidUser(muteUids: mainModel.muteUids, map: commentDoc.data()!) &&
            isValidComment(muteCommentIds: mainModel.muteCommentIds, comment: comment)
        ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: Material(
              elevation: 20,
              color: const Color.fromARGB(255, 225, 231, 225),
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                                userImageURL: firestoreUser.userImageURL),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    firestoreUser.userName,
                                    style: const TextStyle(
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
                        muteUsersModel: muteUserModel,
                        text: muteCommentButtonText,
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
              ),
            ),
          )
        : const Center(
            child: Text('コメントが取得できませんでした'),
          );
  }
}
