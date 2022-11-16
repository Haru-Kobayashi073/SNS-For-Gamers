//flutter
import 'package:flutter/material.dart';
//packages
import 'package:uuid/uuid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//domain
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';

final mainProvider = ChangeNotifierProvider(
  (ref) => MainModel(),
);

//ChangeNotifier = 値の変更を知らせる
class MainModel extends ChangeNotifier {
  int counter = 0;

  Future<void> createUser({required BuildContext context}) async {
    //引数でmain.dartからcontextを受け取る
    counter++;
    final uuid = Uuid();
    final String v4 = uuid.v4();
    final FirestoreUser firestoreUser =
        FirestoreUser(userName: 'Alice', uid: v4);
    final Map<String, dynamic> userData = firestoreUser.toJson();
    final Map<String, dynamic> userData2 = {
      'uid': 'abcd',
      'userName': 'Bob',
    };
    final FirestoreUser firestoreUser2 = FirestoreUser.fromJson(userData2);
    print(firestoreUser2.userName);
    await FirebaseFirestore.instance.collection('users').doc(v4).set(userData);
    //usersコレクションの中にfirstUserを作る処理

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('ユーザーが作成できました。')));
    notifyListeners();
  }
}
