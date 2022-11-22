import 'package:flutter/material.dart';
import 'package:sns_vol2/constants/routes.dart' as routes;
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/models/main_model.dart';

class SNSDrawer extends StatelessWidget {
  const SNSDrawer({Key? key, required this.mainModel}) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text(accountTitle),
            onTap: () =>
                routes.toAccountPage(context: context, mainModel: mainModel),
          )
        ],
      ),
    );
  }
}
