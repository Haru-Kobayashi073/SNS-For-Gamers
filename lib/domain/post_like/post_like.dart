import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'post_like.freezed.dart';
part 'post_like.g.dart';
//jsonのデータがクラスになるファイルを生成

//投稿がいいねされたことの印
@freezed
abstract class PostLike with _$PostLike {
  //constは一定という意味
  const factory PostLike({
    required String activeUid,
    required dynamic createdAt,
    required String passiveUid,
    required dynamic postRef,
    required String postId,
  }) = _PostLike;

  factory PostLike.fromJson(Map<String, dynamic> json) =>
      _$PostLikeFromJson(json);
}
