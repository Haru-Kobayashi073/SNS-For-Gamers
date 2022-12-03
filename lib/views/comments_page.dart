//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//package
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/models/comments_model.dart';
import 'package:sns_vol2/models/create_post_model.dart';
import 'package:sns_vol2/models/main_model.dart';

class CommentsPage extends ConsumerWidget {
  const CommentsPage(
      {Key? key,
      required this.post,
      required this.postDoc,
      required this.mainModel})
      : super(key: key);
  final Post post;
  final DocumentSnapshot<Map<String, dynamic>> postDoc;
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CommentsModel commentsModel = ref.watch(commentsProvider);
    return Scaffold(
      appBar: AppBar(title: Text(commentTitle)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => commentsModel.showCommentFlashBar(context: context, mainModel: mainModel, postDoc: postDoc),
        child: const Icon(Icons.new_label),
      ),
      body: Container(),
    );
  }
}
