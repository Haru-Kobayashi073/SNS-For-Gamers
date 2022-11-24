// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follower.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Follower _$$_FollowerFromJson(Map<String, dynamic> json) => _$_Follower(
      followedUid: json['followedUid'] as String,
      createdAt: json['createdAt'],
      followerUid: json['followerUid'] as String,
    );

Map<String, dynamic> _$$_FollowerToJson(_$_Follower instance) =>
    <String, dynamic>{
      'followedUid': instance.followedUid,
      'createdAt': instance.createdAt,
      'followerUid': instance.followerUid,
    };
