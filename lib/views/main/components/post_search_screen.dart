//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//details
import 'package:sns_vol2/details/user_image.dart';
//domain
import 'package:sns_vol2/domain/post/post.dart';
//models
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/post_search_model.dart';
//constants
import 'package:sns_vol2/constants/colors.dart' as colors;
import 'package:sns_vol2/constants/routes.dart' as routes;

class PostSearchScreen extends ConsumerWidget {
  const PostSearchScreen({Key? key, required this.mainModel}) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PostSearchModel postSearchModel = ref.watch(postSearchProvider);
    final postMaps = postSearchModel.postMaps;

    return Scaffold(
      backgroundColor: colors.green,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            width: 360,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 1.0,
                    blurRadius: 10.0,
                    offset: Offset(5, 5),
                  ),
                ],
                color: colors.cardBackColor,
                borderRadius: BorderRadius.circular(8.0)),
            child: TextFormField(
              decoration: const InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hoverColor: colors.white,
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  prefixStyle: TextStyle(color: colors.green),
                  border: OutlineInputBorder(),
                  hintText: "Search..."),
              onChanged: (text) async {
                postSearchModel.searchTerm = text;
                print(text);
                await postSearchModel.operation(
                    muteUids: mainModel.muteUids,
                    mutePostIds: mainModel.mutePostIds);
              },
            ),
          ),
          Flexible(
            child: ListView.builder(
                itemCount: postMaps.length,
                itemBuilder: (context, index) {
                  final post = Post.fromJson(postMaps[index]);
                  return ListTile(
                    title: Text(
                      post.userName,
                      style: const TextStyle(color: colors.white),
                    ),
                    subtitle: Text(
                      post.text,
                      style: const TextStyle(color: colors.white),
                    ),
                    leading: GestureDetector(
                      onTap: () => postSearchModel.routesToUsersProf(
                          passiveUid: post.uid,
                          context: context,
                          mainModel: mainModel),
                      child: UserImage(
                          length: 48.0, userImageURL: post.userImageURL),
                    ),
                    onTap: () {
                      routes.toFocusPostPage(
                          context: context, mainModel: mainModel, post: post);
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
