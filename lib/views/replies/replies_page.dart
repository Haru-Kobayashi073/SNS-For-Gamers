//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//package
import 'package:riverpod/riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/refresh_screen.dart';
import 'package:sns_vol2/details/reload_screen.dart';
import 'package:sns_vol2/domain/comment/comment.dart';
import 'package:sns_vol2/domain/reply/reply.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/replies_model.dart';
import 'package:sns_vol2/views/replies/components/reply_card.dart';

class RepliesPage extends ConsumerWidget {
  const RepliesPage(
      {Key? key,
      required this.comment,
      required this.commentDoc,
      required this.mainModel})
      : super(key: key);
  final Comment comment;
  final DocumentSnapshot<Map<String, dynamic>> commentDoc;
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RepliesModel repliesModel = ref.watch(repliesProvider);
    final replyDocs = repliesModel.replyDocs;
    return Scaffold(
      appBar: AppBar(title: const Text(replyTitle)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => repliesModel.showReplyFlashBar(
            context: context,
            mainModel: mainModel,
            commentDoc: commentDoc,
            comment: comment),
        child: const Icon(Icons.new_label),
      ),
      body: replyDocs.isEmpty
          ? ReloadScreen(
              onReload: () async =>
                  await repliesModel.onReload(commentDoc: commentDoc))
          : RefreshScreen(
              onRefresh: () async =>
                  await repliesModel.onRefresh(commentDoc: commentDoc),
              onLoading: () async =>
                  await repliesModel.onLoading(commentDoc: commentDoc),
              refreshController: repliesModel.refreshController,
              child: ListView.builder(
                  itemCount: replyDocs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final replyDoc = replyDocs[index];
                    final Reply reply = Reply.fromJson(replyDoc.data()!);
                    return ReplyCard(reply: reply, comment: comment, mainModel: mainModel, replyDoc: replyDoc,);
                  }),
            ),
    );
  }
}
