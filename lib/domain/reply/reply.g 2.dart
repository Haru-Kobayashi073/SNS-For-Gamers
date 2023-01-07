// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Reply _$$_ReplyFromJson(Map<String, dynamic> json) => _$_Reply(
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      reply: json['reply'] as String,
      postRef: json['postRef'],
      postCommentRef: json['postCommentRef'],
      postCommentReplyId: json['postCommentReplyId'] as String,
      likeCount: json['likeCount'] as int,
      userName: json['userName'] as String,
      uid: json['uid'] as String,
      userImageURL: json['userImageURL'] as String,
    );

Map<String, dynamic> _$$_ReplyToJson(_$_Reply instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'reply': instance.reply,
      'postRef': instance.postRef,
      'postCommentRef': instance.postCommentRef,
      'postCommentReplyId': instance.postCommentReplyId,
      'likeCount': instance.likeCount,
      'userName': instance.userName,
      'uid': instance.uid,
      'userImageURL': instance.userImageURL,
    };
