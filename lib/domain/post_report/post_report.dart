import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'post_report.freezed.dart';
part 'post_report.g.dart';
//jsonのデータがクラスになるファイルを生成

//投稿がいいねされたことの印
@freezed
abstract class PostReport with _$PostReport {
  //constは一定という意味
  const factory PostReport({
    required String activeUid,
    required dynamic createdAt,
    required String others,//その他の報告内容
    required String reportContent,//メインの報告内容
    required String postCreatorUid,required String passiveUserName,
    required dynamic postDocRef,
    required String postId,
    required String postReportId,
    required String text,
    required String postTextLanguageCode,
    required double postTextNegativeScore,
    required double postTextPositiveScore,
    required String postTextSentiment,
  }) = _PostReport;

  factory PostReport.fromJson(Map<String, dynamic> json) =>
      _$PostReportFromJson(json);
}
