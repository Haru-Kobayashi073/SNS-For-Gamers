// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mute_user_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MuteUserToken _$$_MuteUserTokenFromJson(Map<String, dynamic> json) =>
    _$_MuteUserToken(
      activeUid: json['activeUid'] as String,
      passiveUid: json['passiveUid'] as String,
      createdAt: json['createdAt'],
      tokenId: json['tokenId'] as String,
      tokenType: json['tokenType'] as String,
    );

Map<String, dynamic> _$$_MuteUserTokenToJson(_$_MuteUserToken instance) =>
    <String, dynamic>{
      'activeUid': instance.activeUid,
      'passiveUid': instance.passiveUid,
      'createdAt': instance.createdAt,
      'tokenId': instance.tokenId,
      'tokenType': instance.tokenType,
    };
