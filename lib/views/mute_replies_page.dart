//flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/normal_appbar.dart';
import 'package:sns_vol2/details/refresh_screen.dart';
import 'package:sns_vol2/details/rounded_button.dart';
import 'package:sns_vol2/details/user_image.dart';
import 'package:sns_vol2/domain/reply/reply.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/mute_replies_model.dart';
import 'package:sns_vol2/constants/voids.dart' as voids;
import 'package:sns_vol2/constants/colors.dart' as colors;
import 'package:sns_vol2/models/themes_model.dart';
//package

class MuteRepliesPage extends ConsumerWidget {
  const MuteRepliesPage({Key? key, required this.mainModel}) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MuteRepliesModel muteRepliesModel = ref.watch(muteRepliesProvider);
    final muteReplyDocs = muteRepliesModel.muteReplyDocs;
    final ThemeModel themeModel = ref.watch(themeProvider);

    return Scaffold(
      backgroundColor: colors.backScreenColor,
      appBar: NormalAppBar(title: muteRepliesPageTitle, mainModel: mainModel),
      body: muteRepliesModel.showMuteReplies
          ? RefreshScreen(
              onRefresh: () async => await muteRepliesModel.onRefresh(),
              onLoading: () async => await muteRepliesModel.onLoading(),
              refreshController: muteRepliesModel.refreshController,
              child: ListView.builder(
                  itemCount: muteRepliesModel.muteReplyDocs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final muteReplyDoc = muteReplyDocs[index];
                    final Reply muteReply =
                        Reply.fromJson(muteReplyDoc.data()!);
                    return ListTile(
                      leading: UserImage(length: 100, userImageURL: muteReply.userImageURL),
                      title: Text(muteReply.userName, style: const TextStyle(color: colors.mainTextPrimaryColor),),
                      subtitle: Text(muteReply.reply, style: const TextStyle(color: colors.mainTextPrimaryColor),),
                      onTap: () => voids.showPopup(
                          context: context,
                          builder: (BuildContext innerContext) =>
                              CupertinoActionSheet(
                                actions: <CupertinoDialogAction>[
                                  CupertinoDialogAction(
                                    isDestructiveAction: true,
                                    onPressed: () async {
                                      Navigator.pop(innerContext);
                                      muteRepliesModel.showUnMuteReplyDialog(
                                          context: context,
                                          mainModel: mainModel,
                                          replyDoc: muteReplyDoc);
                                    },
                                    child: const Text(unMuteReplyText),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedButton(
                    onPressed: () async => await muteRepliesModel
                        .getMuteReplies(mainModel: mainModel),
                    widthRate: 0.7,
                    color: Colors.black,
                    text: showMuteRepliesText,
                    textColor: Colors.white,
                  )
                ],
              ),
            ),
    );
  }
}
