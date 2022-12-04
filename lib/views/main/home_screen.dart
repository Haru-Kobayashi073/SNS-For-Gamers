//flutter
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/post_card.dart';
import 'package:sns_vol2/details/post_like_button.dart';
import 'package:sns_vol2/details/refresh_screen.dart';
import 'package:sns_vol2/details/reload_screen.dart';
import 'package:sns_vol2/details/rounded_button.dart';
import 'package:sns_vol2/details/user_image.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/main.dart';
import 'package:sns_vol2/models/comments_model.dart';
import 'package:sns_vol2/models/main/home_model.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/posts_model.dart';
import 'package:sns_vol2/constants/routes.dart' as routes;

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key, required this.mainModel}) : super(key: key);
  final MainModel mainModel;
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeModel homeModel = ref.watch(homeProvider);
    final PostsModel postsModel = ref.watch(postsProvider);
    final CommentsModel commentsModel = ref.watch(commentsProvider);
    final postDocs = homeModel.postDocs;
    return postDocs.isEmpty
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
                      postsModel: postsModel);
                }),
          );
  }
}
