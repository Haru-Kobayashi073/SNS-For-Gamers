//flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/post_card.dart';
import 'package:sns_vol2/details/refresh_screen.dart';
import 'package:sns_vol2/details/reload_screen.dart';
import 'package:sns_vol2/details/user_header.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/models/comments_model.dart';
import 'package:sns_vol2/models/edit_profile_model.dart';
import 'package:sns_vol2/models/main/profile_model.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/constants/routes.dart' as routes;
import 'package:sns_vol2/constants/colors.dart' as colors;
import 'package:sns_vol2/constants/voids.dart' as voids;
import 'package:sns_vol2/models/mute_posts_model.dart';
import 'package:sns_vol2/models/mute_users_model.dart';
import 'package:sns_vol2/models/posts_model.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key, required this.mainModel}) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final ProfileModel profileModel = ref.watch(profileProvider);
    final EditProfileModel editProfileModel = ref.watch(editProfileProvider);
    final ProfileModel profileModel = ref.watch(profileProvider);
    final FirestoreUser firestoreUser = mainModel.firestoreUser;
    final PostsModel postsModel = ref.watch(postsProvider);
    final CommentsModel commentsModel = ref.watch(commentsProvider);
    final MutePostsModel mutePostsModel = ref.watch(mutePostsProvider);
    final MuteUsersModel muteUsersModel = ref.watch(muteUsersProvider);
    final int followerCount = firestoreUser.followerCount;
    final maxWidth = MediaQuery.of(context).size.width;
    final postDocs = profileModel.postDocs;

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(color: colors.backScreenColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
          UserHeader(mainModel: mainModel,firestoreUser: firestoreUser,),
          Container(
            decoration: const BoxDecoration(color: colors.backScreenColor),
            child: postDocs.isEmpty
                ? ReloadScreen(
                    onReload: () async => await profileModel.onReload())
                : RefreshScreen(
                    onRefresh: () async => await profileModel.onRefresh(),
                    onLoading: () async => await profileModel.onLoading(),
                    refreshController: profileModel.refreshController,
                    child: ListView.builder(
                        itemCount: profileModel.postDocs.length,
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
                                                muteUsersModel.showMuteUserDialog(
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
          ),
        ]),
      ),
    );
  }
}
