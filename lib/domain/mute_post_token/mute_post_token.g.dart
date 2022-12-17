// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mute_post_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MutePostToken _$$_MutePostTokenFromJson(Map<String, dynamic> json) =>
    _$_MutePostToken(
      activeUid: json['activeUid'] as String,
      postId: json['postId'] as String,
      postRef: json['postRef'],
      createdAt: json['createdAt'],
      tokenId: json['tokenId'] as String,
      tokenType: json['tokenType'] as String,
    );

Map<String, dynamic> _$$_MutePostTokenToJson(_$_MutePostToken instance) =>
    <String, dynamic>{
      'activeUid': instance.activeUid,
      'postId': instance.postId,
      'postRef': instance.postRef,
      'createdAt': instance.createdAt,
      'tokenId': instance.tokenId,
      'tokenType': instance.tokenType,
    };
