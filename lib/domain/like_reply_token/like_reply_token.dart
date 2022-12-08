import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'like_reply_token.freezed.dart';
part 'like_reply_token.g.dart';

@freezed
abstract class LikeReplyToken with _$LikeReplyToken {
  //DBに保存するcreated_atやIdが必要。
  //自分が投稿にいいねしたことの印
  const factory LikeReplyToken({
    required String activeUid,
    required String passiveUid,
    required dynamic createdAt,
    required String postCommentReplyId,
    required String tokenId,
    required dynamic postCommentReplyRef,
    required String tokenType,
  }) = _LikeReplyToken;

  factory LikeReplyToken.fromJson(Map<String, dynamic> json) =>
      _$LikeReplyTokenFromJson(json);
}
