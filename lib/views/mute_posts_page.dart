//flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/refresh_screen.dart';
import 'package:sns_vol2/details/rounded_button.dart';
import 'package:sns_vol2/details/user_image.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/mute_posts_model.dart';
import 'package:sns_vol2/constants/voids.dart' as voids;
//package

class MutePostsPage extends ConsumerWidget {
  const MutePostsPage({Key? key, required this.mainModel}) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MutePostsModel mutePostsModel = ref.watch(mutePostsProvider);
    final mutePostDocs = mutePostsModel.mutePostDocs;
    return Scaffold(
      appBar: AppBar(title: const Text(mutePostsPageTitle)),
      body: mutePostsModel.showMutePosts
          ? RefreshScreen(
              onRefresh: () async => await mutePostsModel.onRefresh(),
              onLoading: () async => await mutePostsModel.onLoading(),
              refreshController: mutePostsModel.refreshController,
              child: ListView.builder(
                  itemCount: mutePostsModel.mutePostDocs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final mutePostDoc = mutePostDocs[index];
                    final Post mutePost = Post.fromJson(mutePostDoc.data()!);
                    return ListTile(
                      leading: UserImage(
                          length: 100, userImageURL: mutePost.userImageURL),
                      title: Text(mutePost.userName),
                      subtitle: Text(mutePost.text),
                      onTap: () => voids.showPopup(
                          context: context,
                          builder: (BuildContext innerContext) =>
                              CupertinoActionSheet(
                                actions: <CupertinoDialogAction>[
                                  CupertinoDialogAction(
                                    isDestructiveAction: true,
                                    onPressed: () async {
                                      Navigator.pop(innerContext);
                                      mutePostsModel.showUnMutePostDialog(
                                          context: context,
                                          mainModel: mainModel,
                                          postDoc: mutePostDoc,
                                          postDocs: mutePostDocs);
                                    },
                                    child: const Text(unMutePostText),
                                  ),
                                  CupertinoDialogAction(
                                    isDefaultAction: true,
                                    onPressed: () =>
                                        Navigator.pop(innerContext),
                                    child: const Text(noText),
                                  ),
                                ],
                              )),
                    );
                  }),
            )
          : Center(
              child: Column(
                children: [
                  RoundedButton(
                    onPressed: () async =>
                        await mutePostsModel.getMutePosts(mainModel: mainModel),
                    widthRate: 0.7,
                    color: Colors.black,
                    text: showMutePostsText,
                    textColor: Colors.white,
                  )
                ],
              ),
            ),
    );
  }
}