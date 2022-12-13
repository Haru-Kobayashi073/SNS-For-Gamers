//flutter
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sns_vol2/constants/strings.dart';
//constants
import 'package:sns_vol2/constants/routes.dart' as routes;

//domain
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';

final signupProvider = ChangeNotifierProvider(
  (ref) => SignUpModel(),
);

//ChangeNotifier = 値の変更を知らせる
class SignUpModel extends ChangeNotifier {
  int counter = 0;
  User? currentUser = null;

  //auth
  String email = '';
  String password = '';
  bool isObscure = true;

  Future<void> createFirestoreUser(
      {required BuildContext context, required String uid}) async {
    //引数でmain.dartからcontextを受け取る
    counter++;
    final Timestamp now = Timestamp.now();
    final FirestoreUser firestoreUser = FirestoreUser(
      userName: 'Alice',
      userImageURL: '',
      followerCount: 0,
      followingCount: 0,
      muteCount: 0,
      isAdmin: false,
      uid: uid,
      createdAt: now,
      updatedAt: now,
    );
    final Map<String, dynamic> userData = firestoreUser.toJson();
    await FirebaseFirestore.instance.collection('users').doc(uid).set(userData);
    //usersコレクションの中にfirstUserを作る処理

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(userCreatedMsg)));
    notifyListeners();
  }

  Future<dynamic> createUser({required BuildContext context}) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? user = result.user;
      final String uid = user!.uid;
      await createFirestoreUser(context: context, uid: uid);
      routes.toMyAppPage(context: context);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  void toggleIsObscure() {
    isObscure = !isObscure;
    //！でboolを反転
    notifyListeners();
  }
}
