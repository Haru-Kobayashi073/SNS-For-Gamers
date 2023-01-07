import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'post_comment_report.freezed.dart';
part 'post_comment_report.g.dart';
//jsonのデータがクラスになるファイルを生成

//投稿がいいねされたことの印
@freezed
abstract class PostCommentReport with _$PostCommentReport {
  //constは一定という意味
  const factory PostCommentReport({
    required String activeUid,
    required dynamic createdAt,
    required String others,//その他の報告内容
    required String reportContent,//メインの報告内容
    required String postCommentCreatorUid,required String passiveUserName,
    required dynamic postCommentDocRef,
    required String postCommentId,
    required String postcommentReportId,
    required String comment,
    required String commentTextLanguageCode,
    required double commentTextNegativeScore,
    required double commentTextPositiveScore,
    required String commentTextSentiment,
  }) = _PostCommentReport;

  factory PostCommentReport.fromJson(Map<String, dynamic> json) =>
      _$PostCommentReportFromJson(json);
}
