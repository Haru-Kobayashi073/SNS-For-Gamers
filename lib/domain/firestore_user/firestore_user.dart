import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'firestore_user.freezed.dart';
part 'firestore_user.g.dart';
//jsonのデータがクラスになるファイルを生成

@freezed
abstract class FirestoreUser with _$FirestoreUser {
  //constは一定という意味
  const factory FirestoreUser({
    required dynamic createdAt,
    required dynamic updatedAt,
    //Freezedではパッケージの型が使えない＝FirestoreのTimestampなど。
    //dynamicで代用するが、エラーを吐いてくれない型だから、特殊な場面以外は非推奨

    required int followerCount,
    required int followingCount,
    required int muteCount,
    required int postCount,
    required double userNameNegativeScore,
    required double userNamePositiveScore,
    required String userNameSentiment,
    required String userNameLanguageCode,

    required bool isAdmin,
    required Map<String,dynamic> searchToken,

    required String userName,
    required String userImageURL,
    required String uid,
  }) = _FirestoreUser;

  factory FirestoreUser.fromJson(Map<String, dynamic> json) =>
      _$FirestoreUserFromJson(json);
}
