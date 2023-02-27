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
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: colors.backScreenColor,
      appBar: NormalAppBar(title: articleText, mainModel: mainModel),
      body: ListView.builder(
          itemCount: newsLists.length,
          itemBuilder: (context, index) {
            final newsList = newsLists[index];
            final url = articlesModel.fetchImgToUrl(index: index);
            return ListTile(
              leading: Image.network(
                  'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/clans/38098458/85af5c722fa902f45b49a2f3a5c0daeb9e4eb976.jpg'),
              // leading: Container(
              //   width: 100,
              //   child: Image.network(Uri.parse(articlesModel.articleImgUrl!).toString())
              //   ),
              title: Text(
                newsList['title'],
                style: const TextStyle(color: colors.listTileTextColor),
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                // newsList['date'].toString()
                articlesModel.convertTime(newsList['date']),
                style: const TextStyle(color: colors.cardTextPrimaryColor),
                // 'qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnm'
              ),
              onTap: () async =>
                  await articlesModel.launchToBrawser(url: newsList['url']),
            );
            //     Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Material(
            //     elevation: 20,
            //     color: const Color.fromARGB(255, 216, 218, 216),
            //     borderRadius: BorderRadius.circular(30),
            //     child: Row(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Container(
            //           padding: const EdgeInsets.symmetric(
            //               horizontal: 30, vertical: 16),
            //           child: Column(
            //             children: [
            //               SizedBox(
            //                 height: maxHeight * 0.5,
            //                 child: Text(
            //                   newsList['title'],
            //                   maxLines: 20,
            //                   style: const TextStyle(
            //                       color: colors.cardTextPrimaryColor,
            //                       fontWeight: FontWeight.bold),
            //                   overflow: TextOverflow.ellipsis,
            //                 ),
            //               ),
            //               const Text(
            //                 'aaaaaaaa',
            //                 style: TextStyle(
            //                     color: colors.cardTextPrimaryColor),
            //                 )
            //             ],
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.all(16.0),
            //           child: Container(
            //             width: maxWidth * 0.4,
            //             child: Image.network(
            //                 "https://cdn.akamai.steamstatic.com/steamcommunity/public/images/clans/38098458/85af5c722fa902f45b49a2f3a5c0daeb9e4eb976.jpg"),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // );
            //     Text(
            //   newsList['title'],
            //   style: const TextStyle(color: colors.listTileTextColor),
            //   // overflow: TextOverflow.ellipsis,
            //   maxLines: 20,
            // );
            //     Container(
            //       width: maxWidth * 0.1,
            //   child: Row(
            //     children: [
            //       Text(
            //         newsList['title'],
            //         maxLines: 1,
            //         style: const TextStyle(color: colors.listTileTextColor),
            //         overflow: TextOverflow.ellipsis,
            //       ),
            //     ],
            //   ),
            // );
          }),
    );
  }
}
