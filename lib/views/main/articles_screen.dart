//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//constants
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;
//details
import 'package:sns_vol2/details/normal_appbar.dart';
import 'package:sns_vol2/details/refresh_screen.dart';
import 'package:sns_vol2/details/reload_screen.dart';
//models
import 'package:sns_vol2/models/main/articles_model.dart';

class ArticleScreen extends ConsumerWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ArticlesModel articlesModel = ref.watch(articlesProvider);
    final newsLists = articlesModel.newsLists;
    return Scaffold(
        backgroundColor: colors.green,
        appBar: const NormalAppBar(title: articleText),
        body: Container(
            child: newsLists.isEmpty
                ? ReloadScreen(
                    onReload: () async => await articlesModel.onReload())
                : RefreshScreen(
                    onRefresh: () async => await articlesModel.onRefresh(),
                    onLoading: () async => await articlesModel.onLoading(),
                    refreshController: articlesModel.refreshController,
                    child: ListView.builder(
                        itemCount: newsLists.length,
                        itemBuilder: (context, index) {
                          final newsList = newsLists[index];
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: colors.greenishWhite,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: ListTile(
                                leading: newsList['image_url'] == null
                                    ? Image.network(
                                        'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/clans/38098458/85af5c722fa902f45b49a2f3a5c0daeb9e4eb976.jpg')
                                    : SizedBox(
                                        width: 100,
                                        child: Image.network(
                                            newsList['image_url'])),
                                title: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 8, 0, 2),
                                  child: Text(
                                    newsList['title'],
                                    style: const TextStyle(
                                        color: colors.green,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                subtitle: Text(
                                  newsList['contents'],
                                  style: const TextStyle(color: colors.green),
                                ),
                                onTap: () async => await articlesModel
                                    .launchToBrawser(url: newsList['url']),
                              ),
                            ),
                          );
                        }),
                  )));
  }
}
