//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//package
import 'package:riverpod/riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/rounded_button.dart';
import 'package:sns_vol2/models/admin_model.dart';
import 'package:sns_vol2/models/main_model.dart';

class AdminPage extends ConsumerWidget {
  const AdminPage({Key? key, required this.mainModel}) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AdminModel adminModel = ref.watch(adminProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(adminTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RoundedButton(
                onPressed: () async => await adminModel.admin(currentUserDoc: mainModel.currentUserDoc, firestoreUser: mainModel.firestoreUser),
                widthRate: 0.4,
                color: Colors.red,
                text: adminTitle,
                textColor: Colors.black,),
          )
        ],
      ),
    );
  }
}
