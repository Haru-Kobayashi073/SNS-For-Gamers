//flutter
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sns_vol2/constants/voids.dart' as voids;
import 'package:sns_vol2/domain/article/article.dart';
import 'package:sns_vol2/domain/steam_api/steam_api.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:html/parser.dart' as parser;

final articlesProvider = ChangeNotifierProvider((ref) => ArticlesModel());

class ArticlesModel extends ChangeNotifier {
  Map<String, dynamic> jsons = {};
  List<dynamic> newsList = [];
  List<Article> articles = [];
  List<Article> news = [];
  String gmtTime = '';
  String? articleImgUrl = '';

  ArticlesModel() {
    init();
  }

  String apiKey = dotenv.env["STEAM_API_KEY"]!;
  String baseUrl = 'https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/';
  // String optionUrl = '?appid=990080&count=3&maxlength=100&format=json';
  String optionUrl = '?appid=1172470&count=2&maxlength=100&format=json';

  Future<void> init() async {
    // パラメータを設定（アプリIDとAPIキー）
    String apiUrl = baseUrl + optionUrl;
    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // レスポンスボディをJSONに変換
      jsons = jsonDecode(response.body);
      // JSONからニュース記事のデータを抽出
      newsList = jsons['appnews']['newsitems'];
      print(newsList[0]);
      // ニュース記事のデータからNewsオブジェクトのリストに変換
      // articles = newsList.map((item) => Article.fromJson(item)).toList();
      // Newsオブジェクトのリストを返す
      // og:image
    } else {
      voids.showfluttertoast(msg: "記事の取得に失敗しました");
    }
  }

  String convertTime(int unixNum) {
    //int型からDateTime型に変換
    print('$unixNum + aaaaaaaaaaaa');
    DateTime date = DateTime.fromMicrosecondsSinceEpoch(unixNum * 1000);
    print(date);
    gmtTime = DateFormat("yyyy年MM月dd日").format(date).toString();
    return gmtTime; //例 2020年08月14日
  }

  Future<void> launchToBrawser({required String url}) async {
    if (url != null) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      voids.showfluttertoast(msg: 'アクセスに失敗しました');
    }
  }

  Future<String> fetchImgToUrl({required int index}) async {
    final url = newsList[index]['url'];
    final response = await http.get(Uri.parse(url));
    // レスポンスをDOMに変換
    final document = parser.parse(response.body);
    // metaタグの要素を取得
    // metaタグのプロパティog:imageの値を検索する
    var image = document.querySelector('meta[property="og:image"]');
    // プロパティ名と値を表示
    // for (var tag in metaTags) {
    //   print('${tag.attributes['property']!}: ${tag.attributes['content']!}');
    //   articleImgUrl =
    //       '${tag.attributes['og:image']!}: ${tag.attributes['content']!}';
    // }
    if (image != null) {
      articleImgUrl = '${image.attributes['content']}';
      print(articleImgUrl);
      print(image.attributes['content']);
    } else {
      // レスポンスが失敗した場合
      print('Request failed with status: ${response.statusCode}.');
    }
    return articleImgUrl!;
  }
}
