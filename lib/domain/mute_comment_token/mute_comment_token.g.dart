// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mute_comment_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MuteCommentToken _$$_MuteCommentTokenFromJson(Map<String, dynamic> json) =>
    _$_MuteCommentToken(
      activeUid: json['activeUid'] as String,
      postCommentId: json['postCommentId'] as String,
      postCommentRef: json['postCommentRef'],
      createdAt: json['createdAt'],
      tokenId: json['tokenId'] as String,
      tokenType: json['tokenType'] as String,
    );

Map<String, dynamic> _$$_MuteCommentTokenToJson(_$_MuteCommentToken instance) =>
    <String, dynamic>{
      'activeUid': instance.activeUid,
      'postCommentId': instance.postCommentId,
      'postCommentRef': instance.postCommentRef,
      'createdAt': instance.createdAt,
      'tokenId': instance.tokenId,
      'tokenType': instance.tokenType,
    };
