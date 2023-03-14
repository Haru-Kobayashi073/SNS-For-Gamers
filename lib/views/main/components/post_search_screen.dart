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
//views
import 'package:sns_vol2/views/main/components/search_widget.dart';

class PostSearchScreen extends ConsumerWidget {
  const PostSearchScreen({Key? key, required this.mainModel}) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PostSearchModel postSearchModel = ref.watch(postSearchProvider);
    final postMaps = postSearchModel.postMaps;

    return SearchWidget(
      onChanged: (text) async {
        postSearchModel.searchTerm = text;
        print(text);
        await postSearchModel.operation(
            muteUids: mainModel.muteUids, mutePostIds: mainModel.mutePostIds);
      },
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
                child: UserImage(length: 48.0, userImageURL: post.userImageURL),
              ),
              onTap: () {
                routes.toFocusPostPage(
                    context: context, mainModel: mainModel, post: post);
              },
            );
          }),
    );
  }
}
