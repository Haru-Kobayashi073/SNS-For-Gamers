//主にユーザーにアップデートさせたい要素を含ませる

import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_update_log.freezed.dart';
part 'user_update_log.g.dart';
//jsonのデータがクラスになるファイルを生成

@freezed
abstract class UserUpdateLog with _$UserUpdateLog {
  //constは一定という意味
  const factory UserUpdateLog({
    //Logの順番がわからなくなるので妥協してupdatedAtは入れる
    //userのupdateには使用させない
    required dynamic logCreatedAt,
    required String userName,
    required String userImageURL,
    //どのユーザーをupdateするか判別するのに必要
    required dynamic userRef,
    required String uid,
  }) = _UserUpdateLog;

  factory UserUpdateLog.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateLogFromJson(json);
}
