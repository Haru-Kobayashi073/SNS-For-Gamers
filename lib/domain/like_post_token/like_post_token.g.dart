// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_post_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LikePostToken _$$_LikePostTokenFromJson(Map<String, dynamic> json) =>
    _$_LikePostToken(
      activeUid: json['activeUid'] as String,
      passiveUid: json['passiveUid'] as String,
      createdAt: json['createdAt'],
      postId: json['postId'] as String,
      tokenId: json['tokenId'] as String,
      postRef: json['postRef'],
    );

Map<String, dynamic> _$$_LikePostTokenToJson(_$_LikePostToken instance) =>
    <String, dynamic>{
      'activeUid': instance.activeUid,
      'passiveUid': instance.passiveUid,
      'createdAt': instance.createdAt,
      'postId': instance.postId,
      'tokenId': instance.tokenId,
      'postRef': instance.postRef,
    };
