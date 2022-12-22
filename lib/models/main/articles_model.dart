//flutter
import 'dart:convert';
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:sns_vol2/constants/voids.dart' as voids;
import 'package:sns_vol2/domain/article/article.dart';

final articlesProvider = ChangeNotifierProvider((ref) => ArticlesModel());

class ArticlesModel extends ChangeNotifier {
  List<dynamic> jsons = [];
  List<Article> articles = [];

  ArticlesModel() {
    init();
  }

  Future<void> init() async {
    const String uri = "https://qiita.com/api/v2/items";
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      jsons = json.decode(response.body);
      articles = jsons.map((e) => Article.fromJson(e)).toList();
    } else {
      voids.showfluttertoast(msg: "リクエストが失敗しました。");
    }
  }
}
