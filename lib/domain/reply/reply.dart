import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'reply.freezed.dart';
part 'reply.g.dart';
//jsonのデータがクラスになるファイルを生成

@freezed
abstract class Reply with _$Reply {
  //constは一定という意味
  const factory Reply({
    required dynamic createdAt,
    required dynamic updatedAt,
    //Freezedではパッケージの型が使えない＝FirestoreのTimestampなど。
    //dynamicで代用するが、エラーを吐いてくれない型だから、特殊な場面以外は非推奨
    required String reply,
    required dynamic postRef,
    required dynamic postCommentRef,
    required String postCommentReplyId,
    required int likeCount,
    // required int postCommentReplyCount,
    required String userName,
    //resource.data.uid
    required String uid,
    required String userImageURL,
  }) = _Reply;

  factory Reply.fromJson(Map<String, dynamic> json) =>
      _$ReplyFromJson(json);
}
