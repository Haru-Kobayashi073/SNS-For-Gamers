//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/normal_appbar.dart';
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
    final newsLists = articlesModel.newsList;
    return Scaffold(
      appBar: NormalAppBar(title: articleText, mainModel: mainModel),
      body: Container(
        decoration: const BoxDecoration(color: colors.backScreenColor),
        alignment: Alignment.center,
        child: ListView.builder(
            itemCount: newsLists.length,
            itemBuilder: (context, index) {
              final newsList = newsLists[index];
              return ListTile(
                title: Text(
                  newsList['title'],
                  style: const TextStyle(color: colors.listTileTextColor),
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {},
              );
            }),
      ),
    );
  }
}
