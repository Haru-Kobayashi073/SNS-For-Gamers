import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'post_mute.freezed.dart';
part 'post_mute.g.dart';
//jsonのデータがクラスになるファイルを生成

//投稿がいいねされたことの印
@freezed
abstract class PostMute with _$PostMute {
  //constは一定という意味
  const factory PostMute({
    required String activeUid,
    required dynamic createdAt,
    required String postId,
    required dynamic postRef,
  }) = _PostMute;

  factory PostMute.fromJson(Map<String, dynamic> json) =>
      _$PostMuteFromJson(json);
}
