// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      updatedAt: json['updatedAt'],
      createdAt: json['createdAt'],
      hashTags:
          (json['hashTags'] as List<dynamic>).map((e) => e as String).toList(),
      imageURL: json['imageURL'] as String,
      likeCount: json['likeCount'] as int,
      text: json['text'] as String,
      postId: json['postId'] as String,
      uid: json['uid'] as String,
      userName: json['userName'] as String,
      userImageURL: json['userImageURL'] as String,
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
      'hashTags': instance.hashTags,
      'imageURL': instance.imageURL,
      'likeCount': instance.likeCount,
      'text': instance.text,
      'postId': instance.postId,
      'uid': instance.uid,
      'userName': instance.userName,
      'userImageURL': instance.userImageURL,
    };
