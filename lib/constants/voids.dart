import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//packages
import 'package:flash/flash.dart';
import 'package:sns_vol2/constants/bools.dart';
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
        maxLength: 10,
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
      if (isValidUser(muteUids: muteUids, doc: doc)) docs.insert(0, doc);
    }
  }
}

//onReloadの内部
Future<void> processBasicDocs(
    {required List<DocumentSnapshot<Map<String, dynamic>>> docs,
    required Query<Map<String, dynamic>> query,
    required List<String> muteUids}) async {
  final qshot = await query.get();
  for (final doc in qshot.docs) {
  //doc['uid']は投稿主のuid
  //！は否定
    if (isValidUser(muteUids: muteUids, doc: doc)) docs.add(doc);
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
    for (final doc in qshot.docs) {
      if (isValidUser(muteUids: muteUids, doc: doc)) docs.add(doc);
    }
  }
}
