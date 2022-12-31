//flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/normal_appbar.dart';
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
    final ProfileModel profileModel = ref.watch(profileProvider);
    final FirestoreUser firestoreUser = mainModel.firestoreUser;
    final MuteUsersModel muteUsersModel = ref.watch(muteUsersProvider);
    final int followerCount = firestoreUser.followerCount;
    final maxWidth = MediaQuery.of(context).size.width;
    final postDocs = profileModel.postDocs;

    return Scaffold(
      appBar: const NormalAppBar(title: profileText, boolValue: true),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(color: colors.backScreenColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
            UserHeader(mainModel: mainModel,firestoreUser: firestoreUser,onPressed: () => profileModel.onMenuPressed(context: context),),
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
                              index: index,
                              postDocs: postDocs,
                              muteUsersModel: muteUsersModel,
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
