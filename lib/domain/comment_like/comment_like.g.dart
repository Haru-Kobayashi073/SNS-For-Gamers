// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommentLike _$$_CommentLikeFromJson(Map<String, dynamic> json) =>
    _$_CommentLike(
      activeUid: json['activeUid'] as String,
      createdAt: json['createdAt'],
      postCommentCreatorUid: json['postCommentCreatorUid'] as String,
      postCommentRef: json['postCommentRef'],
      postCommentId: json['postCommentId'] as String,
    );

Map<String, dynamic> _$$_CommentLikeToJson(_$_CommentLike instance) =>
    <String, dynamic>{
      'activeUid': instance.activeUid,
      'createdAt': instance.createdAt,
      'postCommentCreatorUid': instance.postCommentCreatorUid,
      'postCommentRef': instance.postCommentRef,
      'postCommentId': instance.postCommentId,
    };
