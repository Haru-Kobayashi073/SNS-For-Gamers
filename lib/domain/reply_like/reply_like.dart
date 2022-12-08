import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'reply_like.freezed.dart';
part 'reply_like.g.dart';
//jsonのデータがクラスになるファイルを生成

//投稿がいいねされたことの印
@freezed
abstract class ReplyLike with _$ReplyLike {
  //constは一定という意味
  const factory ReplyLike({
    required String activeUid,
    required dynamic createdAt,
    required String postCommentReplyCreatorUid,
    required dynamic postCommentReplyRef,
    required String postCommentReplyId,
  }) = _ReplyLike;

  factory ReplyLike.fromJson(Map<String, dynamic> json) =>
      _$ReplyLikeFromJson(json);
}
