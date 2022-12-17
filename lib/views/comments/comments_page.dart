//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//package
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/in_comment_post_card.dart';
import 'package:sns_vol2/details/post_card.dart';
import 'package:sns_vol2/details/refresh_screen.dart';
import 'package:sns_vol2/details/reload_screen.dart';
import 'package:sns_vol2/domain/comment/comment.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/models/comments_model.dart';
import 'package:sns_vol2/models/create_post_model.dart';
import 'package:sns_vol2/models/main/home_model.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/mute_comments_model.dart';
import 'package:sns_vol2/models/mute_users_model.dart';
import 'package:sns_vol2/models/posts_model.dart';
import 'package:sns_vol2/views/comments/components/comment_card.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;
import 'package:sns_vol2/constants/voids.dart' as voids;

class CommentsPage extends ConsumerWidget {
  const CommentsPage(
      {Key? key,
      required this.post,
      required this.postDoc,
      required this.mainModel,
      required this.muteUserModel})
      : super(key: key);
  final Post post;
  final DocumentSnapshot<Map<String, dynamic>> postDoc;
  final MainModel mainModel;
  final MuteUsersModel muteUserModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CommentsModel commentsModel = ref.watch(commentsProvider);
    final PostsModel postsModel = ref.watch(postsProvider);
    final HomeModel homeModel = ref.watch(homeProvider);
    final MuteCommentsModel muteCommentsModel = ref.watch(muteCommentsProvider);
    final commentDocs = commentsModel.commentDocs;

    return Scaffold(
      backgroundColor: colors.backScreenColor,
      appBar: AppBar(
        title: Text(commentTitle),
        backgroundColor: colors.appBarBackColor,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.floatingButtonBackColor,
        onPressed: () => commentsModel.showCommentFlashBar(
            context: context, mainModel: mainModel, postDoc: postDoc),
        child: const Icon(Icons.new_label),
      ),
      body: commentDocs.isEmpty
          ? ReloadScreen(
              onReload: () async =>
                  await commentsModel.onReload(postDoc: postDoc))
          : RefreshScreen(
              onRefresh: () async =>
                  await commentsModel.onRefresh(postDoc: postDoc),
              onLoading: () async =>
                  await commentsModel.onLoading(postDoc: postDoc),
              refreshController: commentsModel.refreshController,
              child: ListView.builder(
                  itemCount: commentDocs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final commentDoc = commentDocs[index];
                    final Comment comment =
                        Comment.fromJson(commentDoc.data()!);
                    return Column(
                      children: [
                      //   InCommentPostCard(
                      //       mainModel: mainModel,
                      //       post: post,
                      //       postDoc: postDoc,
                      //       commentsModel: commentsModel,
                      //       postsModel: postsModel,
                      //       muteUserModel: muteUserModel,
                      //       onselected: (result) {
                      //   if (result == '0') {
                      //     voids.showPopup(
                      //         context: context,
                      //         builder: (BuildContext innerContext) =>
                      //             CupertinoActionSheet(
                      //               actions: <CupertinoDialogAction>[
                      //                 CupertinoDialogAction(
                      //                   isDestructiveAction: true,
                      //                   onPressed: () async {
                      //                     Navigator.pop(innerContext);
                      //                     muteUserModel.showMuteUserDialog(
                      //                         context: context,
                      //                         passiveUid: post.uid,
                      //                         mainModel: mainModel,
                      //                         docs: homeModel.postDocs);
                      //                   },
                      //                   child: const Text(yesText),
                      //                 ),
                      //                 CupertinoDialogAction(
                      //                   isDefaultAction: true,
                      //                   onPressed: () =>
                      //                       Navigator.pop(innerContext),
                      //                   child: const Text(noText),
                      //                 ),
                      //               ],
                      //             ));
                      //   }
                      // },),
                        CommentCard(
                          comment: comment,
                          post: post,
                          mainModel: mainModel,
                          commentsModel: commentsModel,
                          commentDoc: commentDoc,
                          muteUserModel: muteUserModel,
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
                                              muteUserModel.showMuteUserDialog(
                                                  context: context,
                                                  passiveUid: comment.uid,
                                                  mainModel: mainModel,
                                                  docs: commentDocs);
                                            },
                                            child: const Text(muteUserText),
                                          ),
                                          CupertinoDialogAction(
                                            isDestructiveAction: true,
                                            onPressed: () async {
                                              Navigator.pop(innerContext);
                                              muteCommentsModel
                                                  .showMuteCommentDialog(
                                                      context: context,
                                                      mainModel: mainModel,
                                                      commentDoc: commentDoc,
                                                      commentDocs: commentDocs);
                                            },
                                            child: const Text(muteCommentText),
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
                    );
                  }),
            ),
    );
  }
}
