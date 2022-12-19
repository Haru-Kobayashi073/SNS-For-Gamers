import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'timeline.freezed.dart';
part 'timeline.g.dart';

@freezed
abstract class Timeline with _$Timeline {
  //DBに保存するcreated_atやIdが必要。
  //自分がフォローしたことの印
  const factory Timeline
({
    required dynamic createdAt,
    //フォロワーが投稿を読み込んだか
    required bool isRead,
    required String postCreatorUid,
    required String postId,
    
  }) =  _Timeline;

  factory Timeline
.fromJson(Map<String, dynamic> json) =>
      _$TimelineFromJson(json);
}
