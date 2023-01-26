//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/details/normal_appbar.dart';
import 'package:sns_vol2/details/post_card.dart';
import 'package:sns_vol2/domain/comment/comment.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/models/comments_model.dart';
import 'package:sns_vol2/models/main/home_model.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;
import 'package:sns_vol2/models/mute_comments_model.dart';
import 'package:sns_vol2/models/mute_users_model.dart';
import 'package:sns_vol2/views/comments/components/comment_card.dart';
import 'package:sns_vol2/constants/voids.dart' as voids;
import 'package:sns_vol2/constants/strings.dart';

class FocusPostPage extends ConsumerWidget {
  const FocusPostPage(
      {Key? key,
      required this.mainModel,
      required this.post,})
      : super(key: key);
  final MainModel mainModel;
  final Post post;
  // final Comment comment;
  // final DocumentSnapshot<Map<String, dynamic>> commentDoc;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeModel homeModel = ref.watch(homeProvider);
    final MuteUsersModel muteUsersModel = ref.watch(muteUsersProvider);
    final MuteCommentsModel muteCommentsModel = ref.watch(muteCommentsProvider);
    final CommentsModel commentsModel = ref.watch(commentsProvider);
    final postDocs = homeModel.postDocs;
    final commentDocs = commentsModel.commentDocs;

    return Scaffold(
      backgroundColor: colors.backScreenColor,
      appBar: NormalAppBar(title: "スレッド", mainModel: mainModel),
      body: SingleChildScrollView(
          child: Column(
        children: [
          PostCard(
              mainModel: mainModel,
              post: post,
              index: 0,
              postDocs: postDocs,
              muteUsersModel: muteUsersModel),
          // CommentCard(
          //   comment: comment,
          //   post: post,
          //   mainModel: mainModel,
          //   commentsModel: commentsModel,
          //   commentDoc: commentDoc,
          //   muteUserModel: muteUsersModel,
          //   onSelected: (result) {
          //     if (result == '0') {
          //       voids.showPopup(
          //           context: context,
          //           builder: (BuildContext innerContext) =>
          //               CupertinoActionSheet(
          //                 actions: <CupertinoDialogAction>[
          //                   CupertinoDialogAction(
          //                     isDestructiveAction: true,
          //                     onPressed: () async {
          //                       Navigator.pop(innerContext);
          //                       muteUsersModel.showMuteUserDialog(
          //                           context: context,
          //                           passiveUid: comment.uid,
          //                           mainModel: mainModel,
          //                           docs: commentDocs);
          //                     },
          //                     child: const Text(muteUserText),
          //                   ),
          //                   CupertinoDialogAction(
          //                     isDestructiveAction: true,
          //                     onPressed: () async {
          //                       Navigator.pop(innerContext);
          //                       muteCommentsModel.showMuteCommentDialog(
          //                           context: context,
          //                           mainModel: mainModel,
          //                           commentDoc: commentDoc,
          //                           commentDocs: commentDocs);
          //                     },
          //                     child: const Text(muteCommentText),
          //                   ),
          //                   CupertinoDialogAction(
          //                     isDefaultAction: true,
          //                     onPressed: () => Navigator.pop(innerContext),
          //                     child: const Text(noText),
          //                   ),
          //                 ],
          //               ));
          //     }
          //   },
          // )
        ],
      )),
    );
  }
}
