//flutter
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sns_vol2/details/post_card.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/models/comments_model.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/posts_model.dart';

class RefreshScreen extends StatelessWidget {
  const RefreshScreen({Key? key, required this.child, required this.onRefresh, required this.onLoading, required this.refreshController}) : super(key: key);
  final void Function()? onRefresh;
  final void Function()? onLoading;
  final RefreshController refreshController;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: const WaterDropHeader(),
          onRefresh: onRefresh,
          onLoading: onLoading,
          controller: refreshController,
          child: child,
        ))
      ],
    );
  }
}
