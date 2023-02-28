//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/search_tab_bar_elements.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/models/main/user_search_model.dart';
import 'package:sns_vol2/constants/routes.dart' as routes;
import 'package:sns_vol2/constants/colors.dart' as colors;
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/passive_user_profile_model.dart';
import 'package:sns_vol2/views/main/components/post_search_screen.dart';
import 'package:sns_vol2/views/main/components/user_search_screen.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({Key? key, required this.mainModel}) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PassiveUserProfileModel passiveUserProfileModel =
        ref.watch(passiveUserProfileProvider);

    return DefaultTabController(
      length: searchTabBarElements.length,
      child: Scaffold(
          backgroundColor: colors.backScreenColor,
          appBar: AppBar(
            backgroundColor: colors.green,
            elevation: 0,
            title: const Text(searchText),
            bottom: TabBar(
                indicatorColor: colors.appBarTextColor,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: searchTabBarElements
                    .map((e) => Tab(
                          text: e.title,
                        ))
                    .toList()),
          ),
          body: TabBarView(
            children: [
              UserSearchScreen(
                  passiveUserProfileModel: passiveUserProfileModel,
                  mainModel: mainModel),
              PostSearchScreen(
                mainModel: mainModel,
              )
            ],
          )),
    );
  }
}
