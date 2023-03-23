//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//packages
import 'package:cloud_firestore/cloud_firestore.dart';
//constants
import 'package:sns_vol2/constants/bools.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;
//details
import 'package:sns_vol2/details/card_popup_menu_button.dart';
import 'package:sns_vol2/details/user_image.dart';
//domain
import 'package:sns_vol2/domain/comment/comment.dart';
import 'package:sns_vol2/domain/reply/reply.dart';
//models
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/mute_users_model.dart';
import 'package:sns_vol2/models/replies_model.dart';
//views
import 'package:sns_vol2/views/replies/components/reply_like_button.dart';

class ReplyCard extends ConsumerWidget {
  const ReplyCard(
      {Key? key,
      required this.reply,
      required this.comment,
      required this.mainModel,
      required this.replyDoc,
      required this.onSelected,
      required this.muteUsersModel})
      : super(key: key);
  final Reply reply;
  final Comment comment;
  final MainModel mainModel;
  final DocumentSnapshot replyDoc;
  final void Function(String)? onSelected;
  final MuteUsersModel muteUsersModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RepliesModel repliesModel = ref.watch(repliesProvider);

    return isValidUser(
                muteUids: mainModel.muteUids,
                map: replyDoc.data() as Map<String, dynamic>) &&
            isValidReply(muteReplyIds: mainModel.muteReplyIds, reply: reply)
        ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: Material(
              elevation: 20,
              color: colors.greenishWhite,
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: UserImage(
                                length: 48, userImageURL: reply.userImageURL),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                reply.userName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: colors.green),
                              ),
                              Text(
                                reply.reply,
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: colors.green),
                              ),
                            ],
                          ),
                        ],
                      ),
                      CardPopupMenuButton(
                        onSelected: onSelected,
                        text: "option",
                        muteUsersModel: muteUsersModel,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ReplyLikeButton(
                          mainModel: mainModel,
                          reply: reply,
                          comment: comment,
                          repliesModel: repliesModel,
                          replyDoc: replyDoc)
                    ],
                  ),
                ]),
              ),
            ),
          )
        : const Center(
            child: Text('リプライが取得できませんでした'),
          );
  }
}
