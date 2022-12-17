import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'mute_post_token.freezed.dart';
part 'mute_post_token.g.dart';

@freezed
abstract class MutePostToken with _$MutePostToken {
  //DBに保存するcreated_atやIdが必要。
  //自分が投稿にいいねしたことの印
  const factory MutePostToken({
    required String activeUid,
    required String postId,
    required dynamic postRef,
    required dynamic createdAt,
    required String tokenId,
    required String tokenType,
  }) = _MutePostToken;

  factory MutePostToken.fromJson(Map<String, dynamic> json) =>
      _$MutePostTokenFromJson(json);
}
