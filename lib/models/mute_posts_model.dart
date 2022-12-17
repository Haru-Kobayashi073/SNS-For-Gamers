//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sns_vol2/constants/enums.dart';
import 'package:sns_vol2/constants/ints.dart';
import 'package:sns_vol2/constants/others.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/domain/mute_post_token/mute_post_token.dart';
import 'package:sns_vol2/domain/mute_user_token/mute_user_token.dart';
import 'package:sns_vol2/domain/post_mute/post_mute.dart';
import 'package:sns_vol2/domain/user_mute/user_mute.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/constants/voids.dart' as voids;


final mutePostsProvider =
    ChangeNotifierProvider((ref) => MutePostsModel());

class MutePostsModel extends ChangeNotifier {
  bool showMutePosts = false;
  List<DocumentSnapshot<Map<String, dynamic>>> mutePostDocs = [];
  final RefreshController refreshController = RefreshController();
  //新しくミュートするユーザー
  List<MutePostToken> newMutePostTokens = [];
  List<String> mutePostIds = [];
  //ミュートしているコメントのDocumentを取得する
  Query<Map<String, dynamic>> returnQuery(
          {required List<String> max10MutePostIds}) =>
      FirebaseFirestore.instance
          .collectionGroup('posts')
          .where('postId', whereIn: max10MutePostIds);

  Future<void> getMutePosts({required MainModel mainModel}) async {
    showMutePosts = true;
    mutePostIds = mainModel.mutePostIds;
    //PostIdがmutePostIdsに含まれているユーザーを全取得
    //processBasicDocsはmuteしているユーザーを弾くので使用できない
    await process();
    notifyListeners();
  }

  Future<void> onRefresh() async {
    refreshController.refreshCompleted();
    //必ずしも実装する必要はない =>　新しく取得するのは能動的
    await processNewPosts();
    notifyListeners();
  }

  Future<void> onReload() async {
    await process();
    notifyListeners();
  }

  Future<void> onLoading() async {
    refreshController.loadComplete();
    await process();
    notifyListeners();
  }

  Future<void> processNewPosts() async {
    //newMuteUserTokensをfor文で回し、PostIdだけをまとめている
    final List<String> newMutePostIds =
        newMutePostTokens.map((e) => e.postId).toList();
    //新しくミュートしたコメントが10以上の場合
    final List<String> max10MutePostIds =
        newMutePostIds.length > 10
            ? newMutePostIds.sublist(0, tenCount) //10より大きかったら取り出す
            : newMutePostIds; //10より大きかったらそのまま適用
    if (max10MutePostIds.isNotEmpty) {
      final qshot =
          await returnQuery(max10MutePostIds: max10MutePostIds)
              .get();
      //いつもの新しいdocsに対して行う処理
      final reversed = qshot.docs.reversed.toList();
      for (final mutePostDoc in reversed) {
        mutePostDocs.insert(0, mutePostDoc);
        //muteUserDocsに加えたということは、もう新しくない
        //新しいやつからはぶく
        //tokensに含まれるPostIdがミュートされるべきユーザーと同じPostIdのやつを取得
        final deleteNewMutePostToken = newMutePostTokens
            .where((element) => element.postId == mutePostDoc.id)
            .toList()
            .first;
        newMutePostTokens.remove(deleteNewMutePostToken);
      }
    }
    notifyListeners();
  }

  Future<void> process() async {
    if (mutePostIds.length > mutePostDocs.length) {
      //序盤のmutePostDocsの長さを保持
      final mutePostDocsLength = mutePostDocs.length;
      //max10MutePostIdsには10個までしかPostIdを入れない。＝>なぜならWhereInで検索にかけるから
      List<String> max10MutePostIds =
          (mutePostIds.length - mutePostDocs.length) >= 10
              ? mutePostIds.sublist(mutePostDocsLength,
                  mutePostDocsLength + tenCount)
              : mutePostIds.sublist(
                  mutePostDocsLength, mutePostIds.length);
      if (max10MutePostIds.isNotEmpty) {
        final qshot =
            await returnQuery(max10MutePostIds: max10MutePostIds)
                .get();
        for (final mutePostDoc in qshot.docs) {
          mutePostDocs.add(mutePostDoc);
        }
      }
    }
    notifyListeners();
  }

  Future<void> mutePost(
      {required MainModel mainModel,
      //docsにはpostDocs、PostDocsが含まれる
      required DocumentSnapshot<Map<String, dynamic>> postDoc,
      required List<DocumentSnapshot<Map<String, dynamic>>>
          postDocs}) async {
    final String tokenId = returnUuidV4();
    final Timestamp now = Timestamp.now();
    final currentUserDoc = mainModel.currentUserDoc;
    final String activeUid = currentUserDoc.id;
    final String postId = postDoc.id;
    final postRef = postDoc.reference;
    final MutePostToken mutePostToken = MutePostToken(
        activeUid: activeUid,
        postId: postId,
        postRef: postRef,
        createdAt: now,
        tokenId: tokenId,
        tokenType: mutePostTokenTypeString);
    //新しくミュートしたコメント
    newMutePostTokens.add(mutePostToken);
    mainModel.mutePostTokens.add(mutePostToken);
    mainModel.mutePostIds.add(postId);
    //muteしたいユーザーが作成したコメントを除外
    postDocs.remove(postDoc);
    notifyListeners();
    //currentUserDoc.ref ...
    //自分がミュートしたことの印
    await currentUserDocToTokenDocRef(
            currentUserDoc: currentUserDoc, tokenId: tokenId)
        .set(mutePostToken.toJson());
    //ミュートされたことの印
    final PostMute postMute = PostMute(
        activeUid: activeUid,
        createdAt: now,
        postId: postId,
        postRef: postRef);
    await postDoc.reference
        .collection('postMutes')
        .doc(activeUid)
        .set(postMute.toJson());
  }

  void showMutePostDialog(
      {required BuildContext context,
      required MainModel mainModel,
      //docsにはpostDocs、PostDocsが含まれる
      required DocumentSnapshot<Map<String, dynamic>> postDoc,
      required List<DocumentSnapshot<Map<String, dynamic>>> postDocs}) {
    showCupertinoModalPopup(
        context: context,
        //中で別のinnercontextを生成する
        //!showPopupとbuilderの引数のcontextは名前を変える   >Navigator.popでどちらも反応してしまうから
        builder: (BuildContext innerContext) {
          return CupertinoAlertDialog(
            content: const Text(mutePostAlertMsg),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () => Navigator.pop(innerContext),
                child: const Text(noText),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () async {
                  Navigator.pop(innerContext);
                  await mutePost(
                      mainModel: mainModel,
                      postDoc: postDoc,
                      postDocs: postDocs);
                },
                child: const Text(yesText),
              ),
            ],
          );
        });
  }

  Future<void> unMutePost(
      {required MainModel mainModel,
      //docsにはpostDocs、PostDocsが含まれる
      required DocumentSnapshot<Map<String, dynamic>> postDoc,
      required List<DocumentSnapshot<Map<String, dynamic>>>
          postDocs}) async {
    //mutePostsModel側の処理
    final String postId = postDoc.id;
    mutePostDocs.remove(postDoc);
    mainModel.mutePostIds.remove(postId);
    final currentUserDoc = mainModel.currentUserDoc;
    final String activeUid = currentUserDoc.id;

    final MutePostToken deleteMutePostToken = mainModel.mutePostTokens
        .where((element) => element.postId == postId)
        .toList()
        .first;
    if (newMutePostTokens.contains(deleteMutePostToken)) {
      //もし削除するミュートユーザーが新しい人なら
      newMutePostTokens.remove(deleteMutePostToken);
    }
    mainModel.mutePostTokens.remove(deleteMutePostToken);
    notifyListeners();
    //自分がミュートしたことの印を削除
    await currentUserDocToTokenDocRef(
            currentUserDoc: currentUserDoc,
            tokenId: deleteMutePostToken.tokenId)
        .delete();
    //ユーザーのミュートれた印を削除
    final DocumentReference<Map<String, dynamic>> mutePostRef =
        deleteMutePostToken.postRef;
    await mutePostRef.collection('postMutes').doc(activeUid).delete();
  }

  void showUnMutePostDialog(
      {required BuildContext context,
      required MainModel mainModel,
      //docsにはpostDocs、PostDocsが含まれる
      required DocumentSnapshot<Map<String, dynamic>> postDoc,
      required List<DocumentSnapshot<Map<String, dynamic>>> postDocs}) {
    showCupertinoModalPopup(
        context: context,
        //中で別のinnercontextを生成する
        //!showPopupとbuilderの引数のcontextは名前を変える   >Navigator.popでどちらも反応してしまうから
        builder: (BuildContext innerContext) {
          return CupertinoAlertDialog(
            content: const Text(unMutePostAlertMsg),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () async {
                  Navigator.pop(innerContext);
                  await unMutePost(
                      mainModel: mainModel,
                      postDoc: postDoc,
                      postDocs: postDocs);
                },
                child: const Text(yesText),
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () => Navigator.pop(innerContext),
                child: const Text(noText),
              ),
            ],
          );
        });
  }

  void showUnMutePostPopup(
      {required BuildContext context,
      required MainModel mainModel,
      //docsにはpostDocs、PostDocsが含まれる
      required DocumentSnapshot<Map<String, dynamic>> postDoc,
      required List<DocumentSnapshot<Map<String, dynamic>>> postDocs}) {
    showCupertinoModalPopup(
        context: context,
        //中で別のinnercontextを生成する
        //!showPopupとbuilderの引数のcontextは名前を変える   >Navigator.popでどちらも反応してしまうから
        builder: (BuildContext innerContext) {
          return CupertinoActionSheet(actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(innerContext);
                showUnMutePostDialog(
                    context: context,
                    mainModel: mainModel,
                    postDoc: postDoc,
                    postDocs: postDocs);
              },
              child: const Text(unMutePostText),
            ),
            CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(innerContext),
              child: const Text(backText),
            ),
          ]);
        });
  }
}
