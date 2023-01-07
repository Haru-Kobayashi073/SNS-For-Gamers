// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostReport _$$_PostReportFromJson(Map<String, dynamic> json) =>
    _$_PostReport(
      activeUid: json['activeUid'] as String,
      createdAt: json['createdAt'],
      others: json['others'] as String,
      reportContent: json['reportContent'] as String,
      postCreatorUid: json['postCreatorUid'] as String,
      passiveUserName: json['passiveUserName'] as String,
      postDocRef: json['postDocRef'],
      postId: json['postId'] as String,
      postReportId: json['postReportId'] as String,
      text: json['text'] as String,
      postTextLanguageCode: json['postTextLanguageCode'] as String,
      postTextNegativeScore: (json['postTextNegativeScore'] as num).toDouble(),
      postTextPositiveScore: (json['postTextPositiveScore'] as num).toDouble(),
      postTextSentiment: json['postTextSentiment'] as String,
    );

Map<String, dynamic> _$$_PostReportToJson(_$_PostReport instance) =>
    <String, dynamic>{
      'activeUid': instance.activeUid,
      'createdAt': instance.createdAt,
      'others': instance.others,
      'reportContent': instance.reportContent,
      'postCreatorUid': instance.postCreatorUid,
      'passiveUserName': instance.passiveUserName,
      'postDocRef': instance.postDocRef,
      'postId': instance.postId,
      'postReportId': instance.postReportId,
      'text': instance.text,
      'postTextLanguageCode': instance.postTextLanguageCode,
      'postTextNegativeScore': instance.postTextNegativeScore,
      'postTextPositiveScore': instance.postTextPositiveScore,
      'postTextSentiment': instance.postTextSentiment,
    };
