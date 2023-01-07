//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/details/user_image.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/post_search_model.dart';
import 'package:sns_vol2/views/main/components/search_screen.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;

class PostSearchScreen extends ConsumerWidget {
  const PostSearchScreen({Key? key, required this.mainModel}) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PostSearchModel postSearchModel = ref.watch(postSearchProvider);
    final postMaps = postSearchModel.postMaps;
    final maxHeight = MediaQuery.of(context).size.height;
    return SearchScreen(
        onQueryChanged: (text) async {
          postSearchModel.searchTerm = text;
          print(text);
          await postSearchModel.operation(
              muteUids: mainModel.muteUids, mutePostIds: mainModel.mutePostIds);
        },
        // child: Container(child: Text("aaaa"),),
        child: ListView.builder(
            itemCount: postMaps.length,
            itemBuilder: (context, index) {
              final post = Post.fromJson(postMaps[index]);
              return index == 0
                  ? Column(
                      children: [
                        SizedBox(
                          height: maxHeight * 0.06,
                        ),
                        ListTile(
                          title: Text(
                            post.userName,
                            style: const TextStyle(
                                color: colors.listTileTextColor),
                          ),
                          subtitle: Text(
                            post.text,
                            style: const TextStyle(
                                color: colors.listTileTextColor),
                          ),
                          leading: UserImage(
                              length: 48.0, userImageURL: post.userImageURL),
                        ),
                      ],
                    )
                  : ListTile(
                      title: Text(
                        post.userName,
                        style: const TextStyle(color: colors.listTileTextColor),
                      ),
                      subtitle: Text(
                        post.text,
                        style: const TextStyle(color: colors.listTileTextColor),
                      ),
                      leading: UserImage(
                          length: 48.0, userImageURL: post.userImageURL),
                    );
            }));
  }
}
