//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/details/rounded_text_field.dart';
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
    final maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: colors.backScreenColor,
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
                  hoverColor: colors.listTileTextColor,
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  prefixStyle: TextStyle(color: colors.cardTextPrimaryColor),
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
                  return postMaps == null
                      ? ListTile(
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
                        )
                      : ListTile(
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
                        );
                }),
          ),
        ],
      ),
    );
  }
}
