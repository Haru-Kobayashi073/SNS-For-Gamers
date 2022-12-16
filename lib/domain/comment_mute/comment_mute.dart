import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'comment_mute.freezed.dart';
part 'comment_mute.g.dart';
//jsonのデータがクラスになるファイルを生成

//投稿がいいねされたことの印
@freezed
abstract class CommentMute with _$CommentMute {
  //constは一定という意味
  const factory CommentMute({
    required String activeUid,
    required dynamic createdAt,
    required String postCommentId,
    required dynamic postCommentRef,
  }) = _CommentMute;

  factory CommentMute.fromJson(Map<String, dynamic> json) =>
      _$CommentMuteFromJson(json);
}
