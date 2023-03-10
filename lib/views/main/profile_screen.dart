//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//constants
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;
//details
import 'package:sns_vol2/details/normal_appbar.dart';
import 'package:sns_vol2/details/post_card.dart';
import 'package:sns_vol2/details/refresh_screen.dart';
import 'package:sns_vol2/details/reload_screen.dart';
import 'package:sns_vol2/details/sns_drawer.dart';
import 'package:sns_vol2/details/user_header.dart';
//domain
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/domain/post/post.dart';
//models
import 'package:sns_vol2/models/main/profile_model.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/mute_users_model.dart';
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key, required this.mainModel}) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProfileModel profileModel = ref.watch(profileProvider);
    final FirestoreUser firestoreUser = mainModel.firestoreUser;
    final MuteUsersModel muteUsersModel = ref.watch(muteUsersProvider);
    final postDocs = profileModel.postDocs;

    return Scaffold(
      backgroundColor: colors.green,
      appBar: NormalAppBar(title: profileText, mainModel: mainModel),
      drawer: SNSDrawer(
        mainModel: mainModel,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(color: colors.green),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            UserHeader(
              mainModel: mainModel,
              firestoreUser: firestoreUser,
              onPressed: () => profileModel.onMenuPressed(context: context),
            ),
            Container(
              decoration: const BoxDecoration(color: colors.green),
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
