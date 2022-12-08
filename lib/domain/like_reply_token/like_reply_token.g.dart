// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_reply_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LikeReplyToken _$$_LikeReplyTokenFromJson(Map<String, dynamic> json) =>
    _$_LikeReplyToken(
      activeUid: json['activeUid'] as String,
      passiveUid: json['passiveUid'] as String,
      createdAt: json['createdAt'],
      postCommentReplyId: json['postCommentReplyId'] as String,
      tokenId: json['tokenId'] as String,
      postCommentReplyRef: json['postCommentReplyRef'],
      tokenType: json['tokenType'] as String,
    );

Map<String, dynamic> _$$_LikeReplyTokenToJson(_$_LikeReplyToken instance) =>
    <String, dynamic>{
      'activeUid': instance.activeUid,
      'passiveUid': instance.passiveUid,
      'createdAt': instance.createdAt,
      'postCommentReplyId': instance.postCommentReplyId,
      'tokenId': instance.tokenId,
      'postCommentReplyRef': instance.postCommentReplyRef,
      'tokenType': instance.tokenType,
    };
