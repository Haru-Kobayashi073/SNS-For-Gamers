//flutter
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//package
import 'package:cloud_firestore/cloud_firestore.dart';
//constants
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;
import 'package:sns_vol2/constants/voids.dart' as voids;
import 'package:sns_vol2/details/normal_appbar.dart';
//domain
import 'package:sns_vol2/domain/comment/comment.dart';
import 'package:sns_vol2/domain/reply/reply.dart';
//models
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/mute_replies_model.dart';
import 'package:sns_vol2/models/mute_users_model.dart';
import 'package:sns_vol2/models/replies_model.dart';
//views
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
    final MuteUsersModel muteUsersModel = ref.watch(muteUsersProvider);
    final MuteRepliesModel muteRepliesModel = ref.watch(muteRepliesProvider);
    return Scaffold(
      backgroundColor: colors.green,
      appBar: const NormalAppBar(title: replyTitle),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.black,
        onPressed: () => repliesModel.showReplyFlashBar(
            context: context,
            mainModel: mainModel,
            commentDoc: commentDoc,
            comment: comment),
        child: const Icon(Icons.add_comment_rounded),
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
            print('aaaaaaaaaaa');
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
                  muteUsersModel: muteUsersModel,
                  onSelected: (result) {
                    if (result == '0') {
                      voids.showPopup(
                          context: context,
                          builder: (BuildContext innerContext) =>
                              CupertinoActionSheet(
                                actions: <CupertinoDialogAction>[
                                  CupertinoDialogAction(
                                    isDestructiveAction: true,
                                    onPressed: () async {
                                      Navigator.pop(innerContext);
                                      muteUsersModel.showMuteUserDialog(
                                          context: context,
                                          passiveUid: reply.uid,
                                          mainModel: mainModel,
                                          docs: []);
                                    },
                                    child: const Text(muteUserText),
                                  ),
                                  CupertinoDialogAction(
                                    isDestructiveAction: true,
                                    onPressed: () async {
                                      Navigator.pop(innerContext);
                                      //リアルタイム取得なので表示しなければいい
                                      muteRepliesModel.showMuteReplyDialog(
                                          context: context,
                                          mainModel: mainModel,
                                          replyDoc: replyDoc);
                                    },
                                    child: const Text(muteReplyText),
                                  ),
                                  CupertinoDialogAction(
                                    isDefaultAction: true,
                                    onPressed: () =>
                                        Navigator.pop(innerContext),
                                    child: const Text(noText),
                                  ),
                                ],
                              ));
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
