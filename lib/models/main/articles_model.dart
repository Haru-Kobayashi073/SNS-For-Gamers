//flutter
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//packages
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:html/parser.dart' as parser;
//constants
import 'package:sns_vol2/constants/voids.dart' as voids;
//domain
import 'package:sns_vol2/domain/article/article.dart';

final articlesProvider = ChangeNotifierProvider((ref) => ArticlesModel());
class ArticlesModel extends ChangeNotifier {
  Map<String, dynamic> jsons = {};
  List<dynamic> newsLists = [];
  List<Article> articles = [];
  List<Article> news = [];
  String gmtTime = '';
  String? articleImgUrl = '';
  RefreshController refreshController = RefreshController();

  ArticlesModel() {
    init();
  }

  String apiKey = dotenv.env["STEAM_API_KEY"]!;
  String baseUrl = 'https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/';
  // String optionUrl = '?appid=990080&count=3&maxlength=100&format=json';
  String optionUrl = '?appid=1172470&count=8&maxlength=100&format=json';
  // String optionUrl = '?appid=1449850&count=8&maxlength=100&format=json';

  Future<void> init() async {
    // パラメータを設定（アプリIDとAPIキー）
    String apiUrl = baseUrl + optionUrl;
    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      jsons = jsonDecode(response.body);
      // JSONからニュース記事のデータを抽出
      newsLists = jsons['appnews']['newsitems'];

      for (int i = 0; i < newsLists.length; i++) {
        await Future.delayed(const Duration(seconds: 2));
        articleImgUrl = await fetchImgToUrl(index: i);
        newsLists[i]["image_url"] = articleImgUrl;
        notifyListeners();
      }
      for (int i = 0; i < newsLists.length; i++) {
        newsLists[i]["date"] = convertTime(newsLists[i]["date"]);
        notifyListeners();
      }
      print(newsLists[0]);
      // ニュース記事のデータからNewsオブジェクトのリストに変換
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
    final url = newsLists[index]['url'];
    final response = await http.get(Uri.parse(url));
    // レスポンスをDOMに変換
    final document = parser.parse(response.body);
    // metaタグのプロパティog:imageの値を検索する
    var image = document.querySelector('meta[property="og:image"]');
    if (image != null) {
      articleImgUrl = '${image.attributes['content']}';
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return articleImgUrl!;
  }

  Future<void> onRefresh() async {
    refreshController.refreshCompleted();
    notifyListeners();
  }

  Future<void> onReload() async {
    notifyListeners();
  }

  Future<void> onLoading() async {
    refreshController.loadComplete();
    notifyListeners();
  }
}
