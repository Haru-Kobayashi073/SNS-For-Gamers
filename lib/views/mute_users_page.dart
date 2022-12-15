//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/refresh_screen.dart';
import 'package:sns_vol2/details/rounded_button.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/mute_users_model.dart';

class MuteUsersPage extends ConsumerWidget {
  const MuteUsersPage({Key? key, required this.mainModel}) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MuteUsersModel muteUsersModel = ref.watch(muteUsersProvider);
    final muteUserDocs = muteUsersModel.muteUserDocs;

    return Scaffold(
      appBar: AppBar(title: const Text(muteUsersPageTitle)),
      body: muteUsersModel.showMuteUsers
          ?
          // Text(showMuteUsersText)
          RefreshScreen(
              onRefresh: () =>  muteUsersModel.onRefresh(),
              onLoading: () async => await muteUsersModel.onLoading(),
              refreshController: muteUsersModel.refreshController,
              child: ListView.builder(
                  itemCount: muteUsersModel.muteUserDocs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final muteUserDoc = muteUserDocs[index];
                    final FirestoreUser muteFirestoreUser =
                        FirestoreUser.fromJson(muteUserDoc.data()!);
                    return ListTile(
                      title: Text(muteFirestoreUser.userName),
                      onTap: () => muteUsersModel.showUnMuteUserDialog(context: context, passiveUid: muteFirestoreUser.uid, mainModel: mainModel,
                      muteUserDoc: muteUserDoc),
                    );
                  }),
            )
          : Center(
              child: Column(
                children: [
                  RoundedButton(
                      onPressed: () async => await muteUsersModel.getMuteUsers(
                          mainModel: mainModel),
                      widthRate: 0.7,
                      color: Colors.black,
                      text: showMuteUsersText)
                ],
              ),
            ),
    );
  }
}
