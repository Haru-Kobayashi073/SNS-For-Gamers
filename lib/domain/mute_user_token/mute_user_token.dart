import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'mute_user_token.freezed.dart';
part 'mute_user_token.g.dart';

@freezed
abstract class MuteUserToken with _$MuteUserToken {
  //DBに保存するcreated_atやIdが必要。
  //自分が投稿にいいねしたことの印
  const factory MuteUserToken({
    required String activeUid,
    required String passiveUid,
    required dynamic createdAt,
    required String tokenId,
    required String tokenType,
  }) = _MuteUserToken;

  factory MuteUserToken.fromJson(Map<String, dynamic> json) =>
      _$MuteUserTokenFromJson(json);
}
