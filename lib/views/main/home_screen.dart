//flutter
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/normal_appbar.dart';
import 'package:sns_vol2/details/post_card.dart';
import 'package:sns_vol2/details/refresh_screen.dart';
import 'package:sns_vol2/details/reload_screen.dart';
import 'package:sns_vol2/details/sns_drawer.dart';
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
import 'package:sns_vol2/models/themes_model.dart';

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

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeModel homeModel = ref.watch(homeProvider);
    final MainModel mainModel = ref.watch(mainProvider);
    final ThemeModel themeModel = ref.watch(themeProvider);
    final postDocs = homeModel.postDocs;

    return Scaffold(
      appBar: NormalAppBar(title: homeText, mainModel: mainModel),
      drawer: Drawer(
        child: SNSDrawer(
          mainModel: mainModel,
          themeModel: themeModel,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: colors.backScreenColor),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            decoration: const BoxDecoration(color: colors.backScreenColor),
            child: postDocs.isEmpty
                ? ReloadScreen(
                    onReload: () async => await homeModel.onReload())
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
