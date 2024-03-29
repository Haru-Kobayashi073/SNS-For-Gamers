import 'package:flutter/material.dart';
//constants
import 'package:sns_vol2/constants/routes.dart' as routes;
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;
//models
import 'package:sns_vol2/models/main_model.dart';

class SNSDrawer extends StatelessWidget {
  const SNSDrawer({Key? key, required this.mainModel}) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: colors.green,
      child: ListView(
        children: [
          ListTile(
            title: const Text(
              accountTitle,
              style: TextStyle(color: colors.white),
            ),
            onTap: () =>
                routes.toAccountPage(context: context, mainModel: mainModel),
          ),
          ListTile(
            title: const Text(
              muteUsersPageTitle,
              style: TextStyle(color: colors.white),
            ),
            onTap: () =>
                routes.toMuteUsersPage(context: context, mainModel: mainModel),
          ),
          ListTile(
              title: const Text(
                mutePostsPageTitle,
                style: TextStyle(color: colors.white),
              ),
              onTap: () => routes.toMutePostsPage(
                  context: context, mainModel: mainModel)),
          ListTile(
              title: const Text(
                muteCommentsPageTitle,
                style: TextStyle(color: colors.white),
              ),
              onTap: () => routes.toMuteCommentsPage(
                  context: context, mainModel: mainModel)),
          ListTile(
              title: const Text(
                muteRepliesPageTitle,
                style: TextStyle(color: colors.white),
              ),
              onTap: () => routes.toMuteRepliesPage(
                  context: context, mainModel: mainModel)),
          if (mainModel.firestoreUser.isAdmin)
            ListTile(
              title: const Text(
                adminTitle,
                style: TextStyle(color: colors.white),
              ),
              onTap: () =>
                  routes.toAdminPage(context: context, mainModel: mainModel),
            )
        ],
      ),
    );
  }
}
