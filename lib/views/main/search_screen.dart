//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/models/main/search_model.dart';
import 'package:sns_vol2/constants/routes.dart' as routes;
import 'package:sns_vol2/constants/colors.dart' as colors;
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/passive_user_profile_model.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen(
      {Key? key, required this.mainModel})
      : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SearchModel searchModel = ref.watch(searchProvider);
    final PassiveUserProfileModel passiveUserProfileModel =
        ref.watch(passiveUserProfileProvider);

    return Container(
      decoration: const BoxDecoration(color: colors.backScreenColor),
      child: ListView.builder(
          itemCount: searchModel.userDocs.length,
          itemBuilder: (context, index) {
            //usersの配列から１つ１つを取得している
            final userDoc = searchModel.userDocs[index];
            final FirestoreUser firestoreUser =
                FirestoreUser.fromJson(userDoc.data()!);
            return ListTile(
                tileColor: colors.backScreenColor,
                title: Text(
                  firestoreUser.uid,
                  style: TextStyle(color: colors.listTileTextColor),
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
