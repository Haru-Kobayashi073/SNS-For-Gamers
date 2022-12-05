//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sns_vol2/constants/enums.dart';
import 'package:sns_vol2/constants/routes.dart' as routes;
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/domain/following_token/following_token.dart';
import 'package:sns_vol2/domain/like_comment_token/like_comment_token.dart';
import 'package:sns_vol2/domain/like_post_token/like_post_token.dart';
//domain

final mainProvider = ChangeNotifierProvider(
  (ref) => MainModel(),
);

//ChangeNotifier = 値の変更を知らせる
class MainModel extends ChangeNotifier {
  bool isLoading = false;

  int counter = 0;
  late User? currentUser;
  late DocumentSnapshot<Map<String, dynamic>> currentUserDoc;
  //Snapshotは簡単に言うとusersが持つドキュメント5行ぐらいのこと
  //jsonみたいなものでもある
  late FirestoreUser firestoreUser;

  //token
  List<LikePostToken> likePostTokens = [];
  List<FollowingToken> followingTokens = [];
  List<LikeCommentToken> likeCommentTokens = [];
  List<String> followingUids = [];
  List<String> likePostIds = [];
  List<String> likeCommentIds = [];

  //以下関数がMainModelが起動した時の処理
  //ユーザーの動作を必要としないモデルの関数
  MainModel() {
    init();
  }

  //initの中でcurrentUserを更新すればいい
  Future<void> init() async {
    startLoading();
    //modelを跨がないでcurrentUserの更新
    currentUser = FirebaseAuth.instance.currentUser;
    currentUserDoc = await FirebaseFirestore.instance
        .collection(usersFieldKey)
        .doc(currentUser!.uid)
        .get();
    await distributeTokens();
    firestoreUser = FirestoreUser.fromJson(currentUserDoc.data()!);
    endLoading();
    //currentUserのuidの取得が可能になりました
  }

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  void setCurrentUser() {
    currentUser = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }

  Future<void> distributeTokens() async {
    final tokensQshot =
        await currentUserDoc.reference.collection('tokens').get();
    final tokenDocs = tokensQshot.docs;
    for (final token in tokenDocs) {
      final Map<String, dynamic> tokenMap = token.data();
      final String tokenTyoeString = tokenMap['tokenType'];
      //Stringからenumに変換してミスのないようにしたい
      final TokenType tokenType = mapToTokenType(tokenMap: tokenMap);
      //switch文enumの相性は良く、絶対に失敗しない
      switch (tokenType) {
        case TokenType.following:
          final FollowingToken followingToken =
              FollowingToken.fromJson(tokenMap);
          followingTokens.add(followingToken);
          followingUids.add(followingToken.passiveUid);
          break;
        case TokenType.likePost:
          final LikePostToken likePostToken = LikePostToken.fromJson(tokenMap);
          likePostTokens.add(likePostToken);
          likePostIds.add(likePostToken.postId);
          break;
        case TokenType.likeComment:
          final LikeCommentToken likeCommentToken =
              LikeCommentToken.fromJson(tokenMap);
          likeCommentTokens.add(likeCommentToken);
          likeCommentIds.add(likeCommentToken.postCommentId);
          break;
        case TokenType.mistake:
          break;
      }
    }
  }

  Future<void> logout(
      {required BuildContext context, required MainModel mainModel}) async {
    await FirebaseAuth.instance.signOut();
    routes.toLoginpPage(context: context);
  }
}
