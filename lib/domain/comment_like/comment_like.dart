import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'comment_like.freezed.dart';
part 'comment_like.g.dart';
//jsonのデータがクラスになるファイルを生成

//投稿がいいねされたことの印
@freezed
abstract class CommentLike with _$CommentLike {
  //constは一定という意味
  const factory CommentLike({
    required String activeUid,
    required dynamic createdAt,
    required String postCommentCreatorUid,
    required dynamic postCommentRef,
    required String postCommentId,
  }) = _CommentLike;

  factory CommentLike.fromJson(Map<String, dynamic> json) =>
      _$CommentLikeFromJson(json);
}
