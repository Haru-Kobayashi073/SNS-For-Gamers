import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'reply_mute.freezed.dart';
part 'reply_mute.g.dart';
//jsonのデータがクラスになるファイルを生成

//投稿がいいねされたことの印
@freezed
abstract class ReplyMute with _$ReplyMute {
  //constは一定という意味
  const factory ReplyMute({
    required String activeUid,
    required dynamic createdAt,
    required String postCommentReplyId,
    required dynamic postCommentReplyRef,
  }) = _ReplyMute;

  factory ReplyMute.fromJson(Map<String, dynamic> json) =>
      _$ReplyMuteFromJson(json);
}
