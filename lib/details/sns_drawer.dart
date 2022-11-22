import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sns_vol2/constants/routes.dart' as routes;
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/themes_model.dart';

class SNSDrawer extends StatelessWidget {
  const SNSDrawer({Key? key, required this.mainModel, required this.themeModel}) : super(key: key);
  final MainModel mainModel;
  final ThemeModel themeModel;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text(accountTitle),
            onTap: () =>
                routes.toAccountPage(context: context, mainModel: mainModel),
          ),
          ListTile(
            title: Text(themeTitle),
            trailing: CupertinoSwitch(
              value: themeModel.isDarkTheme,
              onChanged: (value) => themeModel.setIsDarkTheme(value: value),
            ),
          )
        ],
      ),
    );
  }
}
