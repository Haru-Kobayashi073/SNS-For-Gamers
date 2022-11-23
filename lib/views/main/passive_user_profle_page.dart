//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//package
import 'package:riverpod/riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';

class PassiveUserProfilePage extends ConsumerWidget {
  const PassiveUserProfilePage({Key? key, required this.passiveUser}) : super(key: key);
  final FirestoreUser passiveUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(passiveUserProfileTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(passiveUser.uid))
        ],
      ),
    );
  }
}
