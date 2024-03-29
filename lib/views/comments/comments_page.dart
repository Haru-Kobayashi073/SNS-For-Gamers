//flutter
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//package
import 'package:cloud_firestore/cloud_firestore.dart';
//constants
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;
import 'package:sns_vol2/constants/voids.dart' as voids;
import 'package:sns_vol2/details/normal_appbar.dart';
//details
import 'package:sns_vol2/details/refresh_screen.dart';
import 'package:sns_vol2/details/reload_screen.dart';
//domain
import 'package:sns_vol2/domain/comment/comment.dart';
import 'package:sns_vol2/domain/post/post.dart';
//models
import 'package:sns_vol2/models/comments_model.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/mute_comments_model.dart';
import 'package:sns_vol2/models/mute_users_model.dart';
import 'package:sns_vol2/models/posts_model.dart';
//views
import 'package:sns_vol2/views/comments/components/comment_card.dart';

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
    final MuteCommentsModel muteCommentsModel = ref.watch(muteCommentsProvider);
    final commentDocs = commentsModel.commentDocs;

    return Scaffold(
      backgroundColor: colors.green,
      appBar: const NormalAppBar(title: commentTitle),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.black,
        onPressed: () => commentsModel.showCommentFlashBar(
            context: context, mainModel: mainModel, postDoc: postDoc),
        child: const Icon(Icons.add_comment_rounded),
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
