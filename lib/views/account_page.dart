//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/enums.dart';
import 'package:sns_vol2/constants/routes.dart' as routes;
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/normal_appbar.dart';
import 'package:sns_vol2/models/auth/account_model.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;
import 'package:sns_vol2/models/themes_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({Key? key, required this.mainModel}) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AccountModel accountModel = ref.watch(accountProvider);
    final MainModel mainModel = ref.watch(mainProvider);
    final ThemeModel themeModel = ref.watch(themeProvider);
    final firestoreUser = mainModel.firestoreUser;

    return Scaffold(
      backgroundColor: colors.green,
      appBar: const NormalAppBar(title: accountTitle),
      body: ListView(
        children: [
          ListTile(
            title: const Text(
              updatePasswordText,
              style: TextStyle(color: colors.white),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: colors.white,
            ),
            onTap: () {
              accountModel.reauthenticationState =
                  ReauthenticationState.updatePassword;
              routes.toReauthenticationPage(context: context, firestoreUser: firestoreUser);
            },
          ),
          ListTile(
            title: Text(
              '$updateEmailText \n ${accountModel.currentUser!.email!}',
              style: const TextStyle(color: colors.white),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: colors.white,
            ),
            onTap: () {
              accountModel.reauthenticationState =
                  ReauthenticationState.updateEmail;
              routes.toReauthenticationPage(context: context, firestoreUser: firestoreUser);
            },
          ),
          ListTile(
            title: const Text(
              logoutText,
              style: TextStyle(color: colors.white),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: colors.white,
            ),
            onTap: () async => await accountModel.logout(
                context: context, mainModel: mainModel),
          ),
          ListTile(
              title: const Text(
                "アカウント削除",
                style: TextStyle(color: colors.white),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: colors.white,
              ),
              onTap: () {
                accountModel.reauthenticationState =
                    ReauthenticationState.deleteUser;
                routes.toReauthenticationPage(
                    context: context, firestoreUser: firestoreUser);
              }),
        ],
      ),
    );
  }
}
