import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
abstract class Post with _$Post {
  //DBに保存するcreated_atやIdが必要。
  //自分がフォローしたことの印
  const factory Post
({
    required dynamic updatedAt,
    required dynamic createdAt,
    required List<String> hashTags,
    required String imageURL,
    required int likeCount,
    required int muteCount,
    required int reportCount,
    required String text,
    required String textLanguageCode,
    required double textNegativeScore,
    required double textPositiveScore,
    required String textSentiment,
    required dynamic video,
    required int postCommentCount,
    required String postId,
    required String uid,
    required String userName,
    required String userNameLanguageCode,
    required double userNameNegativeScore,
    required double userNamePositiveScore,
    required String userNameSentiment,
    required String userImageURL,
  }) =  _Post;

  factory Post
.fromJson(Map<String, dynamic> json) =>
      _$PostFromJson(json);
}
