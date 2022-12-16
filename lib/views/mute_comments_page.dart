//flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/refresh_screen.dart';
import 'package:sns_vol2/details/rounded_button.dart';
import 'package:sns_vol2/details/user_image.dart';
import 'package:sns_vol2/domain/comment/comment.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/mute_comments_model.dart';
import 'package:sns_vol2/constants/voids.dart' as voids;
//package

class MuteCommentsPage extends ConsumerWidget {
  const MuteCommentsPage({Key? key, required this.mainModel}) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MuteCommentsModel muteCommentsModel = ref.watch(muteCommentsProvider);
    final muteCommentDocs = muteCommentsModel.muteCommentDocs;
    return Scaffold(
      appBar: AppBar(title: const Text(muteCommentsPageTitle)),
      body: muteCommentsModel.showMuteComments
          ? RefreshScreen(
              onRefresh: () async => await muteCommentsModel.onRefresh(),
              onLoading: () async => await muteCommentsModel.onLoading(),
              refreshController: muteCommentsModel.refreshController,
              child: ListView.builder(
                  itemCount: muteCommentsModel.muteCommentDocs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final muteCommentDoc = muteCommentDocs[index];
                    final Comment muteComment =
                        Comment.fromJson(muteCommentDoc.data()!);
                    return ListTile(
                      leading: UserImage(length: 100, userImageURL: muteComment.userImageURL),
                      title: Text(muteComment.userName),
                      subtitle: Text(muteComment.comment),
                      onTap: () => voids.showPopup(
                          context: context,
                          builder: (BuildContext innerContext) =>
                              CupertinoActionSheet(
                                actions: <CupertinoDialogAction>[
                                  CupertinoDialogAction(
                                    isDestructiveAction: true,
                                    onPressed: () async {
                                      Navigator.pop(innerContext);
                                      muteCommentsModel.showUnMuteCommentDialog(
                                          context: context,
                                          mainModel: mainModel,
                                          commentDoc: muteCommentDoc,
                                          commentDocs: muteCommentDocs);
                                    },
                                    child: const Text(unMuteCommentText),
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
                    onPressed: () async => await muteCommentsModel
                        .getMuteComments(mainModel: mainModel),
                    widthRate: 0.7,
                    color: Colors.black,
                    text: showMuteCommentsText,
                    textColor: Colors.white,
                  )
                ],
              ),
            ),
    );
  }
}
