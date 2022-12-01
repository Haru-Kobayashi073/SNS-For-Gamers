//flutter
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/rounded_button.dart';
import 'package:sns_vol2/domain/post/post.dart';
import 'package:sns_vol2/models/main/home_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeModel homeModel = ref.watch(homeProvider);
    final postDocs = homeModel.postDocs;
    return homeModel.postDocs.isEmpty
        ? Column(
            children: [
              Center(
                child: RoundedButton(
                    onPressed: () async => await homeModel.onReload(),
                    widthRate: 0.4,
                    color: Colors.blue,
                    text: reloadText),
              )
            ],
          )
        : Column(
            children: [
              Expanded(
                  child: SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                header: const WaterDropHeader(),
                onRefresh: () async => await homeModel.onRefresh(),
                onLoading: () async => await homeModel.onLoading(),
                controller: homeModel.refreshController,
                child: ListView.builder(
                    itemCount: homeModel.postDocs.length,
                    itemBuilder: (context, int index) {
                      final doc = postDocs[index];
                      final Post post = Post.fromJson(doc.data()!);
                      return ListTile(
                        title: Text(post.text),
                      );
                    }),
              ))
            ],
          );
  }
}
