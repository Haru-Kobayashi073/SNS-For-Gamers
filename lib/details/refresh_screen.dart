//flutter
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
class RefreshScreen extends StatelessWidget {
  const RefreshScreen({Key? key, required this.onRefresh, required this.onLoading, required this.refreshController, required this.child}) : super(key: key);
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
