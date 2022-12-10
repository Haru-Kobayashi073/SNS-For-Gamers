import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_mute.freezed.dart';
part 'user_mute.g.dart';
//jsonのデータがクラスになるファイルを生成

//投稿がいいねされたことの印
@freezed
abstract class UserMute with _$UserMute {
  //constは一定という意味
  const factory UserMute({
    required String activeUid,
    required dynamic createdAt,
    required String passiveUid,
    required dynamic passiveUserRef,
  }) = _UserMute;

  factory UserMute.fromJson(Map<String, dynamic> json) =>
      _$UserMuteFromJson(json);
}
