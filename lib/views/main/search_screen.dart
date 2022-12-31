//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/normal_appbar.dart';
import 'package:sns_vol2/details/sns_drawer.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/models/main/search_model.dart';
import 'package:sns_vol2/constants/routes.dart' as routes;
import 'package:sns_vol2/constants/colors.dart' as colors;
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/passive_user_profile_model.dart';
import 'package:sns_vol2/models/themes_model.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({Key? key, required this.mainModel}) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SearchModel searchModel = ref.watch(searchProvider);
    final PassiveUserProfileModel passiveUserProfileModel =
        ref.watch(passiveUserProfileProvider);
    final ThemeModel themeModel = ref.watch(themeProvider);
    final userDocs = searchModel.userDocs;

    return Scaffold(
      backgroundColor: colors.backScreenColor,
      // appBar: const NormalAppBar(title: searchText, boolValue: false),
      // appBar: AppBar(
      //   title: const Text(searchText),
      // ),
      // drawer: Drawer(
      //   child: SNSDrawer(mainModel: mainModel, themeModel: themeModel),
      // ),
      body:
          // ListView.builder(
          //     itemCount: userDocs.length,
          //     itemBuilder: (context, index) {
          //       final userDoc = userDocs[index];
          //       final FirestoreUser firestoreUser =
          //           FirestoreUser.fromJson(userDoc.data()!);
          //       return ListTile(title: Text(firestoreUser.userName),);
          //     })
          FloatingSearchBar(
        backgroundColor: colors.searchBarBackColor,
        onQueryChanged: (text) async {
          searchModel.searchTerm = text;
          print(text);
          await searchModel.operation(muteUids: mainModel.muteUids);
        },
        clearQueryOnClose: true,
        body: IndexedStack(
          children: [
            FloatingSearchBarScrollNotifier(
              child: ListView.builder(
                  itemCount: userDocs.length,
                  itemBuilder: (context, index) {
                    //usersの配列から１つ１つを取得している
                    final userDoc = userDocs[index];
                    final FirestoreUser firestoreUser =
                        FirestoreUser.fromJson(userDoc.data()!);
                    return ListTile(
                        tileColor: colors.backScreenColor,
                        title: Text(
                          firestoreUser.userName,
                          // '$index',
                          style:
                              const TextStyle(color: colors.listTileTextColor),
                        ),
                        onTap: () async =>
                            await passiveUserProfileModel.onUserIconPressed(
                                mainModel: mainModel,
                                context: context,
                                passiveUserDoc: userDoc));
                  }),
            ),
          ],
        ),
        builder: (context, transition) {
          return Container();
        },
      ),
    );
  }
}
