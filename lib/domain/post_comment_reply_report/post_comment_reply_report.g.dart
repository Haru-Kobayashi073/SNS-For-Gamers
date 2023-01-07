// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comment_reply_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostCommentReplyReport _$$_PostCommentReplyReportFromJson(
        Map<String, dynamic> json) =>
    _$_PostCommentReplyReport(
      activeUid: json['activeUid'] as String,
      createdAt: json['createdAt'],
      others: json['others'] as String,
      reportContent: json['reportContent'] as String,
      postCommentReplyCreatorUid: json['postCommentReplyCreatorUid'] as String,
      passiveUserName: json['passiveUserName'] as String,
      postCommentReplyDocRef: json['postCommentReplyDocRef'],
      postCommentReplyId: json['postCommentReplyId'] as String,
      postCommentReplyReportId: json['postCommentReplyReportId'] as String,
      reply: json['reply'] as String,
      replyTextLanguageCode: json['replyTextLanguageCode'] as String,
      replyTextNegativeScore:
          (json['replyTextNegativeScore'] as num).toDouble(),
      replyTextPositiveScore:
          (json['replyTextPositiveScore'] as num).toDouble(),
      replyTextSentiment: json['replyTextSentiment'] as String,
    );

Map<String, dynamic> _$$_PostCommentReplyReportToJson(
        _$_PostCommentReplyReport instance) =>
    <String, dynamic>{
      'activeUid': instance.activeUid,
      'createdAt': instance.createdAt,
      'others': instance.others,
      'reportContent': instance.reportContent,
      'postCommentReplyCreatorUid': instance.postCommentReplyCreatorUid,
      'passiveUserName': instance.passiveUserName,
      'postCommentReplyDocRef': instance.postCommentReplyDocRef,
      'postCommentReplyId': instance.postCommentReplyId,
      'postCommentReplyReportId': instance.postCommentReplyReportId,
      'reply': instance.reply,
      'replyTextLanguageCode': instance.replyTextLanguageCode,
      'replyTextNegativeScore': instance.replyTextNegativeScore,
      'replyTextPositiveScore': instance.replyTextPositiveScore,
      'replyTextSentiment': instance.replyTextSentiment,
    };
