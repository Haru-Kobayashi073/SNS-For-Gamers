import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'steam_api.freezed.dart';
part 'steam_api.g.dart';
//jsonのデータがクラスになるファイルを生成

//投稿がいいねされたことの印
@freezed
abstract class SteamApi with _$SteamApi {
  //constは一定という意味
  const factory SteamApi({
    required String title,
    required String url,
    required String contents
  }) = _SteamApi;

  factory SteamApi.fromJson(Map<String, dynamic> json) =>
      _$SteamApiFromJson(json);
}
