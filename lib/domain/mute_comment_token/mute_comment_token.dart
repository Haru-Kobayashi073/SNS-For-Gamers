import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'mute_comment_token.freezed.dart';
part 'mute_comment_token.g.dart';

@freezed
abstract class MuteCommentToken with _$MuteCommentToken {
  //DBに保存するcreated_atやIdが必要。
  //自分が投稿にいいねしたことの印
  const factory MuteCommentToken({
    required String activeUid,
    required String postCommentId,
    required dynamic postCommentRef,
    required dynamic createdAt,
    required String tokenId,
    required String tokenType,
  }) = _MuteCommentToken;

  factory MuteCommentToken.fromJson(Map<String, dynamic> json) =>
      _$MuteCommentTokenFromJson(json);
}
