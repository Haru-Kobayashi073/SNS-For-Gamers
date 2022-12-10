//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/enums.dart';
import 'package:sns_vol2/constants/others.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/domain/mute_user_token/mute_user_token.dart';
import 'package:sns_vol2/domain/user_mute/user_mute.dart';
import 'package:sns_vol2/models/main_model.dart';

final muteUserProvider = ChangeNotifierProvider((ref) => MuteUserModel());

class MuteUserModel extends ChangeNotifier {
  Future<void> muteUser(
      {required MainModel mainModel,
      required String passiveUid,
      //docsにはpostDocs、commentDocsが含まれる
      required List<DocumentSnapshot<Map<String, dynamic>>> docs}) async {
    final String tokenId = returnUuidV4();
    final Timestamp now = Timestamp.now();
    final currentUserDoc = mainModel.currentUserDoc;
    final passiveUserDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(passiveUid)
        .get();
    final String activeUid = currentUserDoc.id;
    final MuteUserToken muteUserToken = MuteUserToken(
        activeUid: activeUid,
        passiveUid: passiveUid,
        createdAt: now,
        tokenId: tokenId,
        tokenType: muteUserTokenTypeString);
    mainModel.muteUserTokens.add(muteUserToken);
    mainModel.muteUids.add(passiveUid);
    //muteしたいユーザーが作成したコンテンツを除外
    docs.removeWhere((element) => element.data()!['uid'] == passiveUid);
    notifyListeners();
    //currentUserDoc.ref ...
    //自分がミュートしたことの印
    await currentUserDocToTokenDocRef(
            currentUserDoc: currentUserDoc, tokenId: tokenId)
        .set(muteUserToken.toJson());
    //ミュートされたことの印
    final UserMute userMute = UserMute(
        activeUid: activeUid,
        createdAt: now,
        passiveUid: passiveUid,
        passiveUserRef: passiveUserDoc.reference);
    await passiveUserDoc.reference
        .collection('userMutes')
        .doc(activeUid)
        .set(userMute.toJson());
  }

  void showDialog(
      {required BuildContext context,
      required String passiveUid,
      required MainModel mainModel,
      required List<DocumentSnapshot<Map<String, dynamic>>> docs}) {
    showCupertinoModalPopup(
        context: context,
        //中で別のinnercontextを生成する
        //!showPopupとbuilderの引数のcontextは名前を変える   >Navigator.popでどちらも反応してしまうから
        builder: (BuildContext innerContext) {
          return CupertinoAlertDialog(
            title: const Text('ユーザーをミュートする'),
            content: const Text('このユーザーを本当にミュートしますか？'),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () => Navigator.pop(innerContext),
                child: const Text('いいえ'),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () async {
                  Navigator.pop(innerContext);
                  await muteUser(
                      mainModel: mainModel, passiveUid: passiveUid, docs: docs);
                },
                child: const Text('はい'),
              ),
            ],
          );
        });
  }

  void showPopup(
      {required BuildContext context,
      required String passiveUid,
      required MainModel mainModel,
      required List<DocumentSnapshot<Map<String, dynamic>>> docs}) {
    showCupertinoModalPopup(
        context: context,
        //中で別のinnercontextを生成する
        //!showPopupとbuilderの引数のcontextは名前を変える   >Navigator.popでどちらも反応してしまうから
        builder: (BuildContext innerContext) {
          return CupertinoActionSheet(
              title: const Text('行う操作を選択'),
              actions: <CupertinoActionSheetAction>[
                CupertinoActionSheetAction(
                  isDestructiveAction: true,
                  onPressed: () {
                    Navigator.pop(innerContext);
                    showDialog(
                        context: context,
                        passiveUid: passiveUid,
                        mainModel: mainModel,
                        docs: docs);
                  },
                  child: const Text('ユーザーをミュートする'),
                ),
                CupertinoActionSheetAction(
                  onPressed: () => Navigator.pop(innerContext),
                  child: const Text('戻る'),
                ),
              ]);
        });
  }
}
