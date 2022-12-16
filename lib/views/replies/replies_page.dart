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
import 'package:sns_vol2/models/mute_users_model.dart';
import 'package:sns_vol2/models/replies_model.dart';
import 'package:sns_vol2/views/replies/components/reply_card.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;

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
    final MuteUsersModel muteUserModel = ref.watch(muteUsersProvider);
    final replyDocs = repliesModel.replyDocs;
    return Scaffold(
      backgroundColor: colors.backScreenColor,
      appBar: AppBar(title: const Text(replyTitle)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => repliesModel.showReplyFlashBar(
            context: context,
            mainModel: mainModel,
            commentDoc: commentDoc,
            comment: comment),
        child: const Icon(Icons.new_label),
      ),
      body: StreamBuilder<QuerySnapshot>(
        //streamにQueryのようなものを入れる
        stream: commentDoc.reference
            .collection('postCommentReplies')
            .orderBy('likeCount', descending: true)
            .snapshots(), //ゲットじゃなくてリアルタイム取得の印
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError ||
              snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading');
          } else if (!snapshot.hasData) {
            return const Text('データがありません');
          } else {
            final replyDocs = snapshot.data!.docs;
            return ListView(
              //DocumentSnapshot <Map<String, dynamic>> は不可
              children: replyDocs.map((DocumentSnapshot replyDoc) {
                final Map<String, dynamic> data =
                    replyDoc.data()! as Map<String, dynamic>;
                final Reply reply = Reply.fromJson(data);
                return ReplyCard(
                  reply: reply,
                  comment: comment,
                  mainModel: mainModel,
                  replyDoc: replyDoc,
                  muteUserModel: muteUserModel,
                  onSelected: (result) {
                    if (result == '0') {
                      muteUserModel.showMuteUserDialog(
                          context: context,
                          passiveUid: reply.uid,
                          mainModel: mainModel,
                          docs: []);
                    }
                  },
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
