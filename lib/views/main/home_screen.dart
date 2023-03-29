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
//domain
import 'package:sns_vol2/domain/post/post.dart';
//models
import 'package:sns_vol2/models/create_post_model.dart';
import 'package:sns_vol2/models/main/home_model.dart';
import 'package:sns_vol2/models/main/profile_model.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/mute_users_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen(
      {Key? key,
      required this.mainModel,
      required this.muteUsersModel,
      required this.createPostModel})
      : super(key: key);
  final MainModel mainModel;
  final MuteUsersModel muteUsersModel;
  final CreatePostModel createPostModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeModel homeModel = ref.watch(homeProvider);
    final MainModel mainModel = ref.watch(mainProvider);
    final ProfileModel profileModel = ref.watch(profileProvider);
    final postDocs = profileModel.postDocs;

    return Scaffold(
      appBar: const NormalAppBar(title: homeText),
      drawer: SNSDrawer(
        mainModel: mainModel,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: colors.green),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                        itemCount: postDocs.length,
                        itemBuilder: (context, index) {
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
    );
  }
}
