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
import 'package:sns_vol2/domain/like_reply_token/like_reply_token.dart';
import 'package:sns_vol2/domain/mute_comment_token/mute_comment_token.dart';
import 'package:sns_vol2/domain/mute_post_token/mute_post_token.dart';
import 'package:sns_vol2/domain/mute_reply_token/mute_reply_token.dart';
import 'package:sns_vol2/domain/mute_user_token/mute_user_token.dart';
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
  List<LikeReplyToken> likeReplyTokens = [];
  List<String> likeReplyIds = [];
  List<MuteUserToken> muteUserTokens = [];
  List<String> muteUids = [];
  List<MuteCommentToken> muteCommentTokens = [];
  List<String> muteCommentIds = [];
  List<MutePostToken> mutePostTokens = [];
  List<String> mutePostIds = [];
  List<MuteReplyToken> muteReplyTokens = [];
  List<String> muteReplyIds = [];

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
    //新しい順に並び替える
    //古い順にするならaとbを変える
    tokenDocs.sort(
        (a, b) => (b['createdAt'] as Timestamp).compareTo(a['createdAt']));
    for (final token in tokenDocs) {
      final Map<String, dynamic> tokenMap = token.data();
      //Stringからenumに変換してミスのないようにしたい
      final TokenType tokenType = mapToTokenType(tokenMap: tokenMap);
      //switch文enumの相性は良く、絶対に失敗しない
      switch (tokenType) {
        case TokenType.following:
          //クラスに格納
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
        case TokenType.likeReply:
          final LikeReplyToken likeReplyToken =
              LikeReplyToken.fromJson(tokenMap);
          likeReplyTokens.add(likeReplyToken);
          likeReplyIds.add(likeReplyToken.postCommentReplyId);
          break;
        case TokenType.muteUser:
          final MuteUserToken muteUserToken = MuteUserToken.fromJson(tokenMap);
          muteUserTokens.add(muteUserToken);
          muteUids.add(muteUserToken.passiveUid);
          break;
        case TokenType.muteComment:
          final MuteCommentToken muteCommentToken =
              MuteCommentToken.fromJson(tokenMap);
          muteCommentTokens.add(muteCommentToken);
          muteCommentIds.add(muteCommentToken.postCommentId);
          break;
        case TokenType.mutePost:
          final MutePostToken mutePostToken = MutePostToken.fromJson(tokenMap);
          mutePostTokens.add(mutePostToken);
          mutePostIds.add(mutePostToken.postId);
          break;
        case TokenType.muteReply:
          final MuteReplyToken muteReplyToken =
              MuteReplyToken.fromJson(tokenMap);
          muteReplyTokens.add(muteReplyToken);
          muteReplyIds.add(muteReplyToken.postCommentReplyId);
          break;
        case TokenType.mistake:
          break;
      }
    }
  }

  void updateFrontUserInfo(
      {required String newUserName, required String newUserImageURL}) {
    //firestoreUserの中身を現在の現在のfirestoreUserをほぼコピーしてuserNameだけ変更したものに更新
    firestoreUser = firestoreUser.copyWith(
        userName: newUserName, userImageURL: newUserImageURL);
    notifyListeners();
  }

  Future<void> logout(
      {required BuildContext context, required MainModel mainModel}) async {
    await FirebaseAuth.instance.signOut();
    routes.toLoginpPage(context: context);
  }
}
