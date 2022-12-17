// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mute_reply_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MuteReplyToken _$$_MuteReplyTokenFromJson(Map<String, dynamic> json) =>
    _$_MuteReplyToken(
      activeUid: json['activeUid'] as String,
      postCommentReplyId: json['postCommentReplyId'] as String,
      postCommentReplyRef: json['postCommentReplyRef'],
      createdAt: json['createdAt'],
      tokenId: json['tokenId'] as String,
      tokenType: json['tokenType'] as String,
    );

Map<String, dynamic> _$$_MuteReplyTokenToJson(_$_MuteReplyToken instance) =>
    <String, dynamic>{
      'activeUid': instance.activeUid,
      'postCommentReplyId': instance.postCommentReplyId,
      'postCommentReplyRef': instance.postCommentReplyRef,
      'createdAt': instance.createdAt,
      'tokenId': instance.tokenId,
      'tokenType': instance.tokenType,
    };
