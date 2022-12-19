import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/mute_posts_model.dart';
import 'package:sns_vol2/models/mute_users_model.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;
import 'package:sns_vol2/constants/voids.dart' as voids;

class CardPopupMenuButton extends ConsumerWidget {
  const CardPopupMenuButton(
      {super.key,
      // required this.post,
      // required this.postDoc,
      // required this.postDocs,
      // required this.mainModel,
      required this.onSelected,
      required this.muteUsersModel,
      required this.text});
  final MuteUsersModel muteUsersModel;
  final String text;
  final void Function(String)? onSelected;
  // final Post post;
  // final MainModel mainModel;
  // final DocumentSnapshot<Map<String, dynamic>> postDoc;
  // final List<DocumentSnapshot<Map<String, dynamic>>> postDocs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MutePostsModel mutePostsModel = ref.watch(mutePostsProvider);

    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      icon: const Icon(
        Icons.more_horiz,
        color: colors.cardTextPrimaryColor,
      ),
      // color: colors.cardTextPrimaryColor,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: '0',
          child: Text(text),
        ),
      ],
      onSelected: onSelected,
    );
  }
}
