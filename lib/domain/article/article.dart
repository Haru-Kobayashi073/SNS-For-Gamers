import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'article.freezed.dart';
part 'article.g.dart';
//jsonのデータがクラスになるファイルを生成

@freezed
abstract class Article with _$Article {
  //constは一定という意味
  const factory Article({
    required String id,
    required int comments_count,
    required int likes_count,
    required bool private,
    required int reactions_count,
    required String title,
    required String url,
    required dynamic user,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}
