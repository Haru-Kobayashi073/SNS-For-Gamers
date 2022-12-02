import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'like_post_token.freezed.dart';
part 'like_post_token.g.dart';

@freezed
abstract class LikePostToken with _$LikePostToken {
  //DBに保存するcreated_atやIdが必要。
  //自分が投稿にいいねしたことの印
  const factory LikePostToken({
    required String activeUid,
    required String passiveUid,
    required dynamic createdAt,
    required String postId,
    required String tokenId,
    required dynamic postRef,
    required String tokenType,
  }) = _LikePostToken;

  factory LikePostToken.fromJson(Map<String, dynamic> json) =>
      _$LikePostTokenFromJson(json);
}
