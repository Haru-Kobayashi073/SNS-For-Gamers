//flutter
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/rounded_button.dart';
import 'package:sns_vol2/details/user_image.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/main.dart';
import 'package:sns_vol2/models/main/home_model.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/posts_model.dart';

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
    final postDocs = homeModel.postDocs;
    return homeModel.postDocs.isEmpty
        ? Column(
            children: [
              Center(
                child: RoundedButton(
                    onPressed: () async => await homeModel.onReload(),
                    widthRate: 0.4,
                    color: Colors.blue,
                    text: reloadText),
              )
            ],
          )
        : Column(
            children: [
              Expanded(
                  child: SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                header: const WaterDropHeader(),
                onRefresh: () async => await homeModel.onRefresh(),
                onLoading: () async => await homeModel.onLoading(),
                controller: homeModel.refreshController,
                child: ListView.builder(
                    itemCount: homeModel.postDocs.length,
                    itemBuilder: (context, int index) {
                      final postDoc = postDocs[index];
                      final Post post = Post.fromJson(postDoc.data()!);
                      return ListTile(
                        leading: UserImage(
                            length: 32,
                            userImageURL:
                                post.uid == mainModel.firestoreUser.uid
                                    ? mainModel.firestoreUser.userImageURL
                                    : post.imageURL),
                        trailing: mainModel.likePostIds.contains(post.postId)
                            ? InkWell(
                                child: const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                onTap: () async => await postsModel.unlike(
                                    post: post,
                                    postDoc: postDoc,
                                    postRef: postDoc.reference,
                                    mainModel: mainModel),
                              )
                            : InkWell(
                                child: const Icon(Icons.favorite),
                                onTap: () async => await postsModel.like(
                                    post: post,
                                    postDoc: postDoc,
                                    postRef: postDoc.reference,
                                    mainModel: mainModel),
                              ),
                        title: Text(post.text),
                      );
                    }),
              ))
            ],
          );
  }
}
