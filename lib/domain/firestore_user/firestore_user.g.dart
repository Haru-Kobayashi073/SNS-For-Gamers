// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FirestoreUser _$$_FirestoreUserFromJson(Map<String, dynamic> json) =>
    _$_FirestoreUser(
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      followerCount: json['followerCount'] as int,
      followingCount: json['followingCount'] as int,
      muteCount: json['muteCount'] as int,
      postCount: json['postCount'] as int,
      userNameNegativeScore: (json['userNameNegativeScore'] as num).toDouble(),
      userNamePositiveScore: (json['userNamePositiveScore'] as num).toDouble(),
      userNameSentiment: json['userNameSentiment'] as String,
      userNameLanguageCode: json['userNameLanguageCode'] as String,
      isAdmin: json['isAdmin'] as bool,
      searchToken: json['searchToken'] as Map<String, dynamic>,
      userName: json['userName'] as String,
      userImageURL: json['userImageURL'] as String,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$_FirestoreUserToJson(_$_FirestoreUser instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'followerCount': instance.followerCount,
      'followingCount': instance.followingCount,
      'muteCount': instance.muteCount,
      'postCount': instance.postCount,
      'userNameNegativeScore': instance.userNameNegativeScore,
      'userNamePositiveScore': instance.userNamePositiveScore,
      'userNameSentiment': instance.userNameSentiment,
      'userNameLanguageCode': instance.userNameLanguageCode,
      'isAdmin': instance.isAdmin,
      'searchToken': instance.searchToken,
      'userName': instance.userName,
      'userImageURL': instance.userImageURL,
      'uid': instance.uid,
    };
