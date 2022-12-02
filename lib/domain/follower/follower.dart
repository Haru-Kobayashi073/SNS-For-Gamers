import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'follower.freezed.dart';
part 'follower.g.dart';

@freezed
abstract class Follower with _$Follower {
  //DBに保存するcreated_atやIdが必要。
  //自分がフォローしたことの印
  const factory Follower
({
    required String followedUid,
    required dynamic createdAt,
    required String followerUid,
    
  }) =  _Follower;

  factory Follower
.fromJson(Map<String, dynamic> json) =>
      _$FollowerFromJson(json);
}
