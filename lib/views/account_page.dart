//flutter
import 'package:flutter/material.dart';
import 'package:sns_vol2/constants/routes.dart' as routes;
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/models/main_model.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key, required this.mainModel}) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(accountTitle),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(logoutText),
            onTap: () async => await mainModel.logout(context: context, mainModel: mainModel),
          )
        ],
      ),
    );
  }
}
