//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//package
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/post_card.dart';
import 'package:sns_vol2/details/refresh_screen.dart';
import 'package:sns_vol2/details/reload_screen.dart';
import 'package:sns_vol2/details/user_header.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/models/comments_model.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/mute_posts_model.dart';
import 'package:sns_vol2/models/mute_users_model.dart';
import 'package:sns_vol2/models/passive_user_profile_model.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;
import 'package:sns_vol2/constants/voids.dart' as voids;
import 'package:sns_vol2/models/posts_model.dart';

class PassiveUserProfilePage extends ConsumerWidget {
  const PassiveUserProfilePage(
      {Key? key,
      required this.mainModel,
      required this.passiveUserDoc})
      : super(key: key);
  final DocumentSnapshot<Map<String, dynamic>> passiveUserDoc;
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PassiveUserProfileModel passiveUserProfileModel =
        ref.watch(passiveUserProfileProvider);
    final PostsModel postsModel = ref.watch(postsProvider);
    final CommentsModel commentsModel = ref.watch(commentsProvider);
    final MutePostsModel mutePostsModel = ref.watch(mutePostsProvider);
    final MuteUsersModel muteUsersModel = ref.watch(muteUsersProvider);
    final postDocs = passiveUserProfileModel.postDocs;
    final muteUids = mainModel.muteUids;
    final FirestoreUser passiveUser =
        FirestoreUser.fromJson(passiveUserDoc.data()!);
    return Scaffold(
      backgroundColor: colors.backScreenColor,
      appBar: AppBar(
        title: const Text(passiveUserProfileTitle),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: colors.backScreenColor),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            UserHeader(
              mainModel: mainModel,
              firestoreUser: passiveUser,
            ),
            Container(
              decoration: const BoxDecoration(color: colors.backScreenColor),
              child: postDocs.isEmpty
                  ? ReloadScreen(
                      onReload: () async =>
                          await passiveUserProfileModel.onReload(
                              muteUids: muteUids,
                              passiveUserDoc: passiveUserDoc))
                  : RefreshScreen(
                      onRefresh: () async =>
                          await passiveUserProfileModel.onRefresh(
                              muteUids: muteUids,
                              passiveUserDoc: passiveUserDoc),
                      onLoading: () async =>
                          await passiveUserProfileModel.onLoading(
                              muteUids: muteUids,
                              passiveUserDoc: passiveUserDoc),
                      refreshController:
                          passiveUserProfileModel.refreshController,
                      child: ListView.builder(
                          itemCount: passiveUserProfileModel.postDocs.length,
                          itemBuilder: (context, int index) {
                            final postDoc = postDocs[index];
                            final Post post = Post.fromJson(postDoc.data()!);
                            return PostCard(
                              mainModel: mainModel,
                              post: post,
                              postDoc: postDoc,
                              commentsModel: commentsModel,
                              postsModel: postsModel,
                              muteUserModel: muteUsersModel,
                              onselected: (result) {
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
                                                  muteUsersModel
                                                      .showMuteUserDialog(
                                                          context: context,
                                                          passiveUid: post.uid,
                                                          mainModel: mainModel,
                                                          docs: postDocs);
                                                },
                                                child: const Text(muteUserText),
                                              ),
                                              CupertinoDialogAction(
                                                isDestructiveAction: true,
                                                onPressed: () async {
                                                  Navigator.pop(innerContext);
                                                  mutePostsModel
                                                      .showMutePostDialog(
                                                          context: context,
                                                          mainModel: mainModel,
                                                          postDoc: postDoc,
                                                          postDocs: postDocs);
                                                },
                                                child: const Text(mutePostText),
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
                            );
                          }),
                    ),
            ),
          ]),
        ),
      ),
    );
  }
}
