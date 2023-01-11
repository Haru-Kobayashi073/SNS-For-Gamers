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
      commentLanguageCode: json['commentLanguageCode'] as String,
      commentNegativeScore: (json['commentNegativeScore'] as num).toDouble(),
      commentPositiveScore: (json['commentPositiveScore'] as num).toDouble(),
      commentSentiment: json['commentSentiment'] as String,
      likeCount: json['likeCount'] as int,
      postCommentReplyCount: json['postCommentReplyCount'] as int,
      muteCount: json['muteCount'] as int,
      reportCount: json['reportCount'] as int,
      postCommentId: json['postCommentId'] as String,
      userName: json['userName'] as String,
      userNameLanguageCode: json['userNameLanguageCode'] as String,
      userNameNegativeScore: (json['userNameNegativeScore'] as num).toDouble(),
      userNamePositiveScore: (json['userNamePositiveScore'] as num).toDouble(),
      userNameSentiment: json['userNameSentiment'] as String,
      uid: json['uid'] as String,
      userImageURL: json['userImageURL'] as String,
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'postRef': instance.postRef,
      'comment': instance.comment,
      'commentLanguageCode': instance.commentLanguageCode,
      'commentNegativeScore': instance.commentNegativeScore,
      'commentPositiveScore': instance.commentPositiveScore,
      'commentSentiment': instance.commentSentiment,
      'likeCount': instance.likeCount,
      'postCommentReplyCount': instance.postCommentReplyCount,
      'muteCount': instance.muteCount,
      'reportCount': instance.reportCount,
      'postCommentId': instance.postCommentId,
      'userName': instance.userName,
      'userNameLanguageCode': instance.userNameLanguageCode,
      'userNameNegativeScore': instance.userNameNegativeScore,
      'userNamePositiveScore': instance.userNamePositiveScore,
      'userNameSentiment': instance.userNameSentiment,
      'uid': instance.uid,
      'userImageURL': instance.userImageURL,
    };
