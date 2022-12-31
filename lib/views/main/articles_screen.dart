//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/normal_appbar.dart';
import 'package:sns_vol2/details/user_image.dart';
import 'package:sns_vol2/domain/qiita_user/qiita_user.dart';
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
    return Scaffold(
      // appBar: NormalAppBar(
      //     title: articleText, mainModel: mainModel, themeModel: themeModel),
      body: Container(
        decoration: const BoxDecoration(color: colors.backScreenColor),
        alignment: Alignment.center,
        child: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              final QiitaUser qiitaUser = QiitaUser.fromJson(article.user);
              return ListTile(
                leading: UserImage(
                    length: 64, userImageURL: qiitaUser.profile_image_url),
                title: qiitaUser.name == ""
                    ? const Text(
                        "Qiita User",
                        style: TextStyle(color: colors.listTileTextColor),
                      )
                    : Text(
                        qiitaUser.name,
                        style: const TextStyle(color: colors.listTileTextColor),
                      ),
                subtitle: Text(
                  article.title,
                  style: const TextStyle(color: colors.listTileTextColor),
                ),
              );
            }),
      ),
    );
  }
}
