// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      updatedAt: json['updatedAt'],
      createdAt: json['createdAt'],
      hashTags:
          (json['hashTags'] as List<dynamic>).map((e) => e as String).toList(),
      imageURL: json['imageURL'] as String,
      likeCount: json['likeCount'] as int,
      muteCount: json['muteCount'] as int,
      reportCount: json['reportCount'] as int,
      text: json['text'] as String,
      textLanguageCode: json['textLanguageCode'] as String,
      textNegativeScore: (json['textNegativeScore'] as num).toDouble(),
      textPositiveScore: (json['textPositiveScore'] as num).toDouble(),
      textSentiment: json['textSentiment'] as String,
      video: json['video'],
      isVideo: json['isVideo'] as bool,
      postCommentCount: json['postCommentCount'] as int,
      postId: json['postId'] as String,
      uid: json['uid'] as String,
      userName: json['userName'] as String,
      userNameLanguageCode: json['userNameLanguageCode'] as String,
      userNameNegativeScore: (json['userNameNegativeScore'] as num).toDouble(),
      userNamePositiveScore: (json['userNamePositiveScore'] as num).toDouble(),
      userNameSentiment: json['userNameSentiment'] as String,
      userImageURL: json['userImageURL'] as String,
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
      'hashTags': instance.hashTags,
      'imageURL': instance.imageURL,
      'likeCount': instance.likeCount,
      'muteCount': instance.muteCount,
      'reportCount': instance.reportCount,
      'text': instance.text,
      'textLanguageCode': instance.textLanguageCode,
      'textNegativeScore': instance.textNegativeScore,
      'textPositiveScore': instance.textPositiveScore,
      'textSentiment': instance.textSentiment,
      'video': instance.video,
      'isVideo': instance.isVideo,
      'postCommentCount': instance.postCommentCount,
      'postId': instance.postId,
      'uid': instance.uid,
      'userName': instance.userName,
      'userNameLanguageCode': instance.userNameLanguageCode,
      'userNameNegativeScore': instance.userNameNegativeScore,
      'userNamePositiveScore': instance.userNamePositiveScore,
      'userNameSentiment': instance.userNameSentiment,
      'userImageURL': instance.userImageURL,
    };
