//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//constants
import 'package:sns_vol2/constants/lists.dart';
import 'package:sns_vol2/constants/maps.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/constants/routes.dart' as routes;
import 'package:sns_vol2/constants/voids.dart' as voids;
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
    counter++;
    final Timestamp now = Timestamp.now();
    final FirestoreUser firestoreUser = FirestoreUser(
      userName: 'stranger',
      userImageURL: '',
      introduction: '',
      followerCount: 0,
      followingCount: 0,
      muteCount: 0,
      postCount: 0,
      userNameLanguageCode: "en",
      userNameNegativeScore: 0,
      userNamePositiveScore: 0,
      userNameSentiment: "POSITIVE",
      isAdmin: false,
      searchToken: returnSearchToken(
          searchWords: returnSearchWords(searchTerm: "alice")),
      uid: uid,
      createdAt: now,
      updatedAt: now,
    );
    final Map<String, dynamic> userData = firestoreUser.toJson();
    await FirebaseFirestore.instance.collection('users').doc(uid).set(userData);
    print(userData);
    //usersコレクションの中にfirstUserを作る処理
    notifyListeners();
    await voids.showfluttertoast(msg: userCreatedMsg);
  }

  Future<dynamic> createUser({required BuildContext context}) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? user = result.user;
      final String uid = user!.uid;
      await createFirestoreUser(context: context, uid: uid);
      routes.toVerifyEmailPage(context: context);
    } on FirebaseAuthException catch (e) {
      final String errorCode = e.code;
      switch (errorCode) {
        case "email-already-in-use":
          voids.showfluttertoast(msg: emailAlreadyInUseMsg);
          break;
        case "invalid-email":
          voids.showfluttertoast(msg: invalidEmailMsg);
          break;
        case "operation-not-allowed":
          //Firebaseでemail/passwordが許可されていないので開発側の過失
          debugPrint(operationNotAllowedMsg);
          break;
        case "weak-password":
          voids.showfluttertoast(msg: weakPasswordMsg);
          break;
      }
    }
  }

  void toggleIsObscure() {
    isObscure = !isObscure;
    //！でboolを反転
    notifyListeners();
  }
}
