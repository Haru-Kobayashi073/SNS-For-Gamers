// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comment_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostCommentReport _$$_PostCommentReportFromJson(Map<String, dynamic> json) =>
    _$_PostCommentReport(
      activeUid: json['activeUid'] as String,
      createdAt: json['createdAt'],
      others: json['others'] as String,
      reportContent: json['reportContent'] as String,
      postCommentCreatorUid: json['postCommentCreatorUid'] as String,
      passiveUserName: json['passiveUserName'] as String,
      postCommentDocRef: json['postCommentDocRef'],
      postCommentId: json['postCommentId'] as String,
      postcommentReportId: json['postcommentReportId'] as String,
      comment: json['comment'] as String,
      commentTextLanguageCode: json['commentTextLanguageCode'] as String,
      commentTextNegativeScore:
          (json['commentTextNegativeScore'] as num).toDouble(),
      commentTextPositiveScore:
          (json['commentTextPositiveScore'] as num).toDouble(),
      commentTextSentiment: json['commentTextSentiment'] as String,
    );

Map<String, dynamic> _$$_PostCommentReportToJson(
        _$_PostCommentReport instance) =>
    <String, dynamic>{
      'activeUid': instance.activeUid,
      'createdAt': instance.createdAt,
      'others': instance.others,
      'reportContent': instance.reportContent,
      'postCommentCreatorUid': instance.postCommentCreatorUid,
      'passiveUserName': instance.passiveUserName,
      'postCommentDocRef': instance.postCommentDocRef,
      'postCommentId': instance.postCommentId,
      'postcommentReportId': instance.postcommentReportId,
      'comment': instance.comment,
      'commentTextLanguageCode': instance.commentTextLanguageCode,
      'commentTextNegativeScore': instance.commentTextNegativeScore,
      'commentTextPositiveScore': instance.commentTextPositiveScore,
      'commentTextSentiment': instance.commentTextSentiment,
    };
