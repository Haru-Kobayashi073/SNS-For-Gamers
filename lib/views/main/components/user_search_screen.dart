//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//constants
import 'package:sns_vol2/constants/colors.dart' as colors;
//domain
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
//models
import 'package:sns_vol2/models/main/user_search_model.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/passive_user_profile_model.dart';
//views
import 'package:sns_vol2/views/main/components/search_widget.dart';

class UserSearchScreen extends ConsumerWidget {
  const UserSearchScreen({
    super.key,
    required this.passiveUserProfileModel,
    required this.mainModel,
  });
  final PassiveUserProfileModel passiveUserProfileModel;
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserSearchModel userSearchModel = ref.watch(userSearchProvider);
    final userDocs = userSearchModel.userDocs;

    return SearchWidget(
      onChanged: (text) async {
        userSearchModel.searchTerm = text;
        print(text);
        await userSearchModel.operation(
            muteUids: mainModel.muteUids, mutePostIds: mainModel.mutePostIds);
      },
      child: ListView.builder(
          itemCount: userDocs.length,
          itemBuilder: (context, index) {
            // usersの配列から１つ１つを取得している
            final userDoc = userDocs[index];
            final FirestoreUser firestoreUser =
                FirestoreUser.fromJson(userDoc.data()!);
            return ListTile(
                tileColor: colors.green,
                title: Text(
                  firestoreUser.userName,
                  style: const TextStyle(color: colors.white),
                ),
                onTap: () async =>
                    await passiveUserProfileModel.onUserIconPressed(
                        mainModel: mainModel,
                        context: context,
                        passiveUserDoc: userDoc));
          }),
    );
  }
}
