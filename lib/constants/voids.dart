import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flash/flash.dart';
import 'package:fluttertoast/fluttertoast.dart' as fluttertoast;
import 'package:sns_vol2/constants/bools.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/constants/routes.dart' as routes;

void showFlashBar({
  required BuildContext context,
  required MainModel mainModel,
  required TextEditingController textEditingController,
  required void Function(String)? onchanged,
  required String titleString,
  required Color positiveActionColor,
  required Widget Function(BuildContext, FlashController<Object?>,
          void Function(void Function()))?
      primaryActionBuilder,
}) {
  context.showFlashBar(
    content: Form(
      child: TextFormField(
        controller: textEditingController,
        style: const TextStyle(fontWeight: FontWeight.bold),
        onChanged: onchanged,
        maxLength: 30,
      ),
    ),
    title: Text(titleString),
    primaryActionBuilder: primaryActionBuilder,
    negativeActionBuilder: (context, controller, _) {
      return InkWell(
        child: const Icon(Icons.close),
        onTap: () async => await controller.dismiss(),
      );
    },
  );
}

//onRefreshの内部
Future<void> processNewDocs(
    {required List<DocumentSnapshot<Map<String, dynamic>>> docs,
    required Query<Map<String, dynamic>> query,
    required List<String> muteUids}) async {
  if (docs.isNotEmpty) {
    final qshot = await query.endBeforeDocument(docs.first).get();
    final reversed = qshot.docs.reversed.toList();
    for (final doc in reversed) {
      //正しいユーザーかどうかの処理と、重複処理
      if (isValidUser(muteUids: muteUids, doc: doc) &&
          !reversed.contains(doc)) {
        docs.insert(0, doc);
      }
    }
  }
}

//onReloadの内部
Future<void> processBasicDocs(
    {required List<DocumentSnapshot<Map<String, dynamic>>> docs,
    required Query<Map<String, dynamic>> query,
    required List<String> muteUids}) async {
  final qshot = await query.get();
  final basicDocs = qshot.docs;
    docs.removeWhere((element) => true);
  // print(basicDocs);
  for (final doc in basicDocs) {
    //doc['uid']は投稿主のuid
    //！は否定
    //正しいユーザーかどうかの処理と、重複処理
    if (isValidUser(muteUids: muteUids, doc: doc) && !docs.contains(doc)) {
      docs.add(doc);
    }
    // print("$docs 111");
    //addだと上手くいく
  }
}

//onloadingの内部
Future<void> processOldDocs(
    {required List<DocumentSnapshot<Map<String, dynamic>>> docs,
    required Query<Map<String, dynamic>> query,
    required List<String> muteUids}) async {
  if (docs.isNotEmpty) {
    final qshot = await query.startAfterDocument(docs.last).get();
    final oldDocs = qshot.docs;
    for (final doc in oldDocs) {
      if (isValidUser(muteUids: muteUids, doc: doc) && !docs.contains(doc))
        docs.add(doc);
    }
  }
}

void showPopup(
    {required BuildContext context,
    required Widget Function(BuildContext) builder}) {
  showCupertinoModalPopup(
      context: context,
      //中で別のinnercontextを生成する
      //!showPopupとbuilderの引数のcontextは名前を変える   >Navigator.popでどちらも反応してしまうから
      // builder: (BuildContext innerContext) {
      //   return CupertinoAlertDialog(
      //     content: const Text(muteUserAlertMsg),
      //     actions: [],

      //   );
      // }
      builder: builder);
}

Future<void> showfluttertoast({required String msg}) async {
  //flashにtoastが定められているので分ける
  await fluttertoast.Fluttertoast.showToast(
      msg: msg,
      toastLength: fluttertoast.Toast.LENGTH_SHORT,
      gravity: fluttertoast.ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red[900],
      textColor: Colors.white,
      fontSize: 16.0);
}
