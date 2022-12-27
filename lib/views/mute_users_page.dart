//flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/normal_appbar.dart';
import 'package:sns_vol2/details/refresh_screen.dart';
import 'package:sns_vol2/details/rounded_button.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/mute_users_model.dart';
import 'package:sns_vol2/constants/voids.dart' as voids;
import 'package:sns_vol2/constants/colors.dart' as colors;

class MuteUsersPage extends ConsumerWidget {
  const MuteUsersPage({Key? key, required this.mainModel}) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MuteUsersModel muteUsersModel = ref.watch(muteUsersProvider);
    final muteUserDocs = muteUsersModel.muteUserDocs;

    return Scaffold(
      backgroundColor: colors.backScreenColor,
      appBar: const NormalAppBar(title: muteUsersPageTitle),
      body: muteUsersModel.showMuteUsers
          ?
          // Text(showMuteUsersText)
          RefreshScreen(
              onRefresh: () async => await muteUsersModel.onRefresh(),
              onLoading: () async => await muteUsersModel.onLoading(),
              refreshController: muteUsersModel.refreshController,
              child: ListView.builder(
                  itemCount: muteUsersModel.muteUserDocs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final muteUserDoc = muteUserDocs[index];
                    final FirestoreUser muteFirestoreUser =
                        FirestoreUser.fromJson(muteUserDoc.data()!);
                    return ListTile(
                      title: Text(muteFirestoreUser.userName, style: const TextStyle(color: colors.mainTextPrimaryColor),),
                      onTap: () => voids.showPopup(
                          context: context,
                          builder: (BuildContext innerContext) =>
                              CupertinoActionSheet(
                                actions: <CupertinoDialogAction>[
                                  CupertinoDialogAction(
                                    isDestructiveAction: true,
                                    onPressed: () async {
                                      Navigator.pop(innerContext);
                                      muteUsersModel.showUnMuteUserDialog(
                                          context: context,
                                          passiveUid: muteFirestoreUser.uid,
                                          mainModel: mainModel,
                                          muteUserDoc: muteUserDoc);
                                    },
                                    child: const Text(muteUserText),
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
                    onPressed: () async =>
                        await muteUsersModel.getMuteUsers(mainModel: mainModel),
                    widthRate: 0.7,
                    color: Colors.black,
                    text: showMuteUsersText,
                    textColor: Colors.white,
                  )
                ],
              ),
            ),
    );
  }
}
