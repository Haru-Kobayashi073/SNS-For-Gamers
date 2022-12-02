import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'following_token.freezed.dart';
part 'following_token.g.dart';

@freezed
abstract class FollowingToken with _$FollowingToken {
  //DBに保存するcreated_atやIdが必要。
  //自分がフォローしたことの印
  const factory FollowingToken({
    required String passiveUid,
    required dynamic createdAt,
    required String tokenId,
    required String tokenType,
  }) = _FollowingToken;

  factory FollowingToken.fromJson(Map<String, dynamic> json) =>
      _$FollowingTokenFromJson(json);
}
