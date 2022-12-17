//flutter
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/post_card.dart';
import 'package:sns_vol2/details/refresh_screen.dart';
import 'package:sns_vol2/details/reload_screen.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/models/comments_model.dart';
import 'package:sns_vol2/models/create_post_model.dart';
import 'package:sns_vol2/models/main/home_model.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/mute_posts_model.dart';
import 'package:sns_vol2/models/mute_users_model.dart';
import 'package:sns_vol2/models/posts_model.dart';
import 'package:sns_vol2/constants/routes.dart' as routes;
import 'package:sns_vol2/constants/colors.dart' as colors;
import 'package:sns_vol2/constants/voids.dart' as voids;

class HomeScreen extends ConsumerWidget {
  const HomeScreen(
      {Key? key,
      required this.mainModel,
      required this.muteUserModel,
      required this.createPostModel})
      : super(key: key);
  final MainModel mainModel;
  final MuteUsersModel muteUserModel;
  final CreatePostModel createPostModel;

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeModel homeModel = ref.watch(homeProvider);
    final PostsModel postsModel = ref.watch(postsProvider);
    final CommentsModel commentsModel = ref.watch(commentsProvider);
    final MutePostsModel mutePostsModel = ref.watch(mutePostsProvider);
    final postDocs = homeModel.postDocs;

    return Container(
      decoration: const BoxDecoration(color: colors.backScreenColor
          // gradient: LinearGradient(
          //   begin: Alignment.bottomCenter,
          //   end: Alignment.topCenter,
          //   colors: [
          //     Color.fromARGB(255, 98, 252, 165),
          //     Color.fromARGB(255, 71, 179, 118),
          //     Color(0xFF388D5D),
          //     ],
          // ),
          ),
      child: postDocs.isEmpty
          ? ReloadScreen(onReload: () async => await homeModel.onReload())
          : RefreshScreen(
              onRefresh: () async => await homeModel.onRefresh(),
              onLoading: () async => await homeModel.onLoading(),
              refreshController: homeModel.refreshController,
              child: ListView.builder(
                  itemCount: homeModel.postDocs.length,
                  itemBuilder: (context, int index) {
                    final postDoc = postDocs[index];
                    final Post post = Post.fromJson(postDoc.data()!);
                    return PostCard(
                      mainModel: mainModel,
                      post: post,
                      postDoc: postDoc,
                      commentsModel: commentsModel,
                      postsModel: postsModel,
                      muteUserModel: muteUserModel,
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
                                          muteUserModel.showMuteUserDialog(
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
                                          mutePostsModel.showMutePostDialog(
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
    );
  }
}
