// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Article _$$_ArticleFromJson(Map<String, dynamic> json) => _$_Article(
      id: json['id'] as String,
      comments_count: json['comments_count'] as int,
      likes_count: json['likes_count'] as int,
      private: json['private'] as bool,
      reactions_count: json['reactions_count'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      user: json['user'],
    );

Map<String, dynamic> _$$_ArticleToJson(_$_Article instance) =>
    <String, dynamic>{
      'id': instance.id,
      'comments_count': instance.comments_count,
      'likes_count': instance.likes_count,
      'private': instance.private,
      'reactions_count': instance.reactions_count,
      'title': instance.title,
      'url': instance.url,
      'user': instance.user,
    };
