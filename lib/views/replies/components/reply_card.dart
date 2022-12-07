//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sns_vol2/details/user_image.dart';
//domain
import 'package:sns_vol2/domain/reply/reply.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/domain/reply/reply.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/replies_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReplyCard extends ConsumerWidget {
  const ReplyCard({
    Key? key,
    required this.reply
  }) : super(key: key);
  final Reply reply;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RepliesModel repliesModel = ref.watch(repliesProvider);

    return Container(
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(color: Colors.grey, width: 0),
      )),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: UserImage(length: 48, userImageURL: reply.userImageURL),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(reply.userName),
                const SizedBox(height: 5,),
                Text(
                  reply.reply,
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                InkWell(
                  child: const Icon(
                    Icons.favorite,
                  ),
                  onTap: () {}
                ),
              ],
            ),
            // ReplyLikeButton(
            //   mainModel: mainModel,
            //   reply: reply,
            //   replysModel: replysModel,
            //   replyDoc: replyDoc,
            //   post: post,
            // ),
          ],
        ),
      ]),
    );
  }
}
