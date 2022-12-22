// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return _Article.fromJson(json);
}

/// @nodoc
mixin _$Article {
  String get id => throw _privateConstructorUsedError;
  int get comments_count => throw _privateConstructorUsedError;
  int get likes_count => throw _privateConstructorUsedError;
  bool get private => throw _privateConstructorUsedError;
  int get reactions_count => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  dynamic get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleCopyWith<Article> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleCopyWith<$Res> {
  factory $ArticleCopyWith(Article value, $Res Function(Article) then) =
      _$ArticleCopyWithImpl<$Res, Article>;
  @useResult
  $Res call(
      {String id,
      int comments_count,
      int likes_count,
      bool private,
      int reactions_count,
      String title,
      String url,
      dynamic user});
}

/// @nodoc
class _$ArticleCopyWithImpl<$Res, $Val extends Article>
    implements $ArticleCopyWith<$Res> {
  _$ArticleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? comments_count = null,
    Object? likes_count = null,
    Object? private = null,
    Object? reactions_count = null,
    Object? title = null,
    Object? url = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      comments_count: null == comments_count
          ? _value.comments_count
          : comments_count // ignore: cast_nullable_to_non_nullable
              as int,
      likes_count: null == likes_count
          ? _value.likes_count
          : likes_count // ignore: cast_nullable_to_non_nullable
              as int,
      private: null == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as bool,
      reactions_count: null == reactions_count
          ? _value.reactions_count
          : reactions_count // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ArticleCopyWith<$Res> implements $ArticleCopyWith<$Res> {
  factory _$$_ArticleCopyWith(
          _$_Article value, $Res Function(_$_Article) then) =
      __$$_ArticleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int comments_count,
      int likes_count,
      bool private,
      int reactions_count,
      String title,
      String url,
      dynamic user});
}

/// @nodoc
class __$$_ArticleCopyWithImpl<$Res>
    extends _$ArticleCopyWithImpl<$Res, _$_Article>
    implements _$$_ArticleCopyWith<$Res> {
  __$$_ArticleCopyWithImpl(_$_Article _value, $Res Function(_$_Article) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? comments_count = null,
    Object? likes_count = null,
    Object? private = null,
    Object? reactions_count = null,
    Object? title = null,
    Object? url = null,
    Object? user = null,
  }) {
    return _then(_$_Article(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      comments_count: null == comments_count
          ? _value.comments_count
          : comments_count // ignore: cast_nullable_to_non_nullable
              as int,
      likes_count: null == likes_count
          ? _value.likes_count
          : likes_count // ignore: cast_nullable_to_non_nullable
              as int,
      private: null == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as bool,
      reactions_count: null == reactions_count
          ? _value.reactions_count
          : reactions_count // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Article with DiagnosticableTreeMixin implements _Article {
  const _$_Article(
      {required this.id,
      required this.comments_count,
      required this.likes_count,
      required this.private,
      required this.reactions_count,
      required this.title,
      required this.url,
      required this.user});

  factory _$_Article.fromJson(Map<String, dynamic> json) =>
      _$$_ArticleFromJson(json);

  @override
  final String id;
  @override
  final int comments_count;
  @override
  final int likes_count;
  @override
  final bool private;
  @override
  final int reactions_count;
  @override
  final String title;
  @override
  final String url;
  @override
  final dynamic user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Article(id: $id, comments_count: $comments_count, likes_count: $likes_count, private: $private, reactions_count: $reactions_count, title: $title, url: $url, user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Article'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('comments_count', comments_count))
      ..add(DiagnosticsProperty('likes_count', likes_count))
      ..add(DiagnosticsProperty('private', private))
      ..add(DiagnosticsProperty('reactions_count', reactions_count))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Article &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.comments_count, comments_count) ||
                other.comments_count == comments_count) &&
            (identical(other.likes_count, likes_count) ||
                other.likes_count == likes_count) &&
            (identical(other.private, private) || other.private == private) &&
            (identical(other.reactions_count, reactions_count) ||
                other.reactions_count == reactions_count) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      comments_count,
      likes_count,
      private,
      reactions_count,
      title,
      url,
      const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArticleCopyWith<_$_Article> get copyWith =>
      __$$_ArticleCopyWithImpl<_$_Article>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArticleToJson(
      this,
    );
  }
}

abstract class _Article implements Article {
  const factory _Article(
      {required final String id,
      required final int comments_count,
      required final int likes_count,
      required final bool private,
      required final int reactions_count,
      required final String title,
      required final String url,
      required final dynamic user}) = _$_Article;

  factory _Article.fromJson(Map<String, dynamic> json) = _$_Article.fromJson;

  @override
  String get id;
  @override
  int get comments_count;
  @override
  int get likes_count;
  @override
  bool get private;
  @override
  int get reactions_count;
  @override
  String get title;
  @override
  String get url;
  @override
  dynamic get user;
  @override
  @JsonKey(ignore: true)
  _$$_ArticleCopyWith<_$_Article> get copyWith =>
      throw _privateConstructorUsedError;
}
