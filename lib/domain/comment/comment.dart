import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';
//jsonのデータがクラスになるファイルを生成

@freezed
abstract class Comment with _$Comment {
  //constは一定という意味
  const factory Comment({
    required dynamic createdAt,
    required dynamic updatedAt,
    //Freezedではパッケージの型が使えない＝FirestoreのTimestampなど。
    //dynamicで代用するが、エラーを吐いてくれない型だから、特殊な場面以外は非推奨
    required dynamic postRef,
    required String comment,
    required int likeCount,
    required String postCommentId,
    required int postCommentReplyCount,
    required String userName,
    required String uid,
    required String userImageURL,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
