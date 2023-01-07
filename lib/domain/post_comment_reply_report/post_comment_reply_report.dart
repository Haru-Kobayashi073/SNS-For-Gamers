import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'post_comment_reply_report.freezed.dart';
part 'post_comment_reply_report.g.dart';
//jsonのデータがクラスになるファイルを生成

//投稿がいいねされたことの印
@freezed
abstract class PostCommentReplyReport with _$PostCommentReplyReport {
  //constは一定という意味
  const factory PostCommentReplyReport({
    required String activeUid,
    required dynamic createdAt,
    required String others,//その他の報告内容
    required String reportContent,//メインの報告内容
    required String postCommentReplyCreatorUid,required String passiveUserName,
    required dynamic postCommentReplyDocRef,
    required String postCommentReplyId,
    required String postCommentReplyReportId,
    required String reply,
    required String replyTextLanguageCode,
    required double replyTextNegativeScore,
    required double replyTextPositiveScore,
    required String replyTextSentiment,
  }) = _PostCommentReplyReport;

  factory PostCommentReplyReport.fromJson(Map<String, dynamic> json) =>
      _$PostCommentReplyReportFromJson(json);
}
