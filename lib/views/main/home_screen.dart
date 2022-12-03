//flutter
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/post_like_button.dart';
import 'package:sns_vol2/details/rounded_button.dart';
import 'package:sns_vol2/details/user_image.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/main.dart';
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
                      return Container(
                        decoration: const BoxDecoration(
                            border: Border(
                          bottom: BorderSide(color: Colors.grey, width: 0),
                        )),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Column(children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: UserImage(
                                    length: 48,
                                    userImageURL: post.uid ==
                                            mainModel.firestoreUser.uid
                                        ? mainModel.firestoreUser.userImageURL
                                        : post.imageURL),
                              ),
                              Text(post.text),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                child: Icon(
                                  Icons.messenger_outline_rounded,
                                ),
                                onTap: () => routes.toCommentsPage(
                                    context: context,
                                    mainModel: mainModel,
                                    post: post,
                                    postDoc: postDoc),
                              ),
                              PostLikeButton(
                                  mainModel: mainModel,
                                  post: post,
                                  postsModel: postsModel,
                                  postDoc: postDoc),
                            ],
                          ),
                        ]),
                      );
                    }),
              ))
            ],
          );
  }
}
