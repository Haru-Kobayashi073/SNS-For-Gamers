// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      postRef: json['postRef'],
      comment: json['comment'] as String,
      likeCount: json['likeCount'] as int,
      postCommentId: json['postCommentId'] as String,
      postCommentReplyCount: json['postCommentReplyCount'] as int,
      userName: json['userName'] as String,
      uid: json['uid'] as String,
      userImageURL: json['userImageURL'] as String,
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'postRef': instance.postRef,
      'comment': instance.comment,
      'likeCount': instance.likeCount,
      'postCommentId': instance.postCommentId,
      'postCommentReplyCount': instance.postCommentReplyCount,
      'userName': instance.userName,
      'uid': instance.uid,
      'userImageURL': instance.userImageURL,
    };
