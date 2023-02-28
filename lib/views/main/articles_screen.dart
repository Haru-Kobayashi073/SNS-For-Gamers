//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/card_popup_menu_button.dart';
import 'package:sns_vol2/details/normal_appbar.dart';
import 'package:sns_vol2/details/refresh_screen.dart';
import 'package:sns_vol2/details/reload_screen.dart';
import 'package:sns_vol2/details/user_image.dart';
import 'package:sns_vol2/domain/qiita_user/qiita_user.dart';
import 'package:sns_vol2/domain/steam_api/steam_api.dart';
import 'package:sns_vol2/models/main/articles_model.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/themes_model.dart';

class ArticleScreen extends ConsumerWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ArticlesModel articlesModel = ref.watch(articlesProvider);
    final MainModel mainModel = ref.watch(mainProvider);
    final ThemeModel themeModel = ref.watch(themeProvider);
    final articles = articlesModel.articles;
    final newsLists = articlesModel.newsLists;
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: colors.backScreenColor,
        appBar: NormalAppBar(title: articleText, mainModel: mainModel),
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
                                color: colors.cardBackColor,
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
                                // subtitle: newsList['is_external_url'] == true
                                //     ? const Text(
                                //         'Steamコミュニティ外の記事です',
                                //         style: TextStyle(color: colors.green),
                                //       )
                                //     : const Text(
                                //         'Steamの記事です',
                                //         style: TextStyle(color: colors.green),
                                //       ),
                                onTap: () async => await articlesModel
                                    .launchToBrawser(url: newsList['url']),
                              ),
                            ),
                          );
                        }),
                  )));
  }
}
