// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  dynamic get createdAt => throw _privateConstructorUsedError;
  dynamic get updatedAt =>
      throw _privateConstructorUsedError; //Freezedではパッケージの型が使えない＝FirestoreのTimestampなど。
//dynamicで代用するが、エラーを吐いてくれない型だから、特殊な場面以外は非推奨
  dynamic get postRef => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;
  String get postCommentId => throw _privateConstructorUsedError;
  int get postCommentReplyCount => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get userImageURL => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res, Comment>;
  @useResult
  $Res call(
      {dynamic createdAt,
      dynamic updatedAt,
      dynamic postRef,
      String comment,
      int likeCount,
      String postCommentId,
      int postCommentReplyCount,
      String userName,
      String uid,
      String userImageURL});
}

/// @nodoc
class _$CommentCopyWithImpl<$Res, $Val extends Comment>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? postRef = null,
    Object? comment = null,
    Object? likeCount = null,
    Object? postCommentId = null,
    Object? postCommentReplyCount = null,
    Object? userName = null,
    Object? uid = null,
    Object? userImageURL = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postRef: null == postRef
          ? _value.postRef
          : postRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      postCommentId: null == postCommentId
          ? _value.postCommentId
          : postCommentId // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentReplyCount: null == postCommentReplyCount
          ? _value.postCommentReplyCount
          : postCommentReplyCount // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      userImageURL: null == userImageURL
          ? _value.userImageURL
          : userImageURL // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$_CommentCopyWith(
          _$_Comment value, $Res Function(_$_Comment) then) =
      __$$_CommentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic createdAt,
      dynamic updatedAt,
      dynamic postRef,
      String comment,
      int likeCount,
      String postCommentId,
      int postCommentReplyCount,
      String userName,
      String uid,
      String userImageURL});
}

/// @nodoc
class __$$_CommentCopyWithImpl<$Res>
    extends _$CommentCopyWithImpl<$Res, _$_Comment>
    implements _$$_CommentCopyWith<$Res> {
  __$$_CommentCopyWithImpl(_$_Comment _value, $Res Function(_$_Comment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? postRef = null,
    Object? comment = null,
    Object? likeCount = null,
    Object? postCommentId = null,
    Object? postCommentReplyCount = null,
    Object? userName = null,
    Object? uid = null,
    Object? userImageURL = null,
  }) {
    return _then(_$_Comment(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postRef: null == postRef
          ? _value.postRef
          : postRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      postCommentId: null == postCommentId
          ? _value.postCommentId
          : postCommentId // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentReplyCount: null == postCommentReplyCount
          ? _value.postCommentReplyCount
          : postCommentReplyCount // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      userImageURL: null == userImageURL
          ? _value.userImageURL
          : userImageURL // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Comment with DiagnosticableTreeMixin implements _Comment {
  const _$_Comment(
      {required this.createdAt,
      required this.updatedAt,
      required this.postRef,
      required this.comment,
      required this.likeCount,
      required this.postCommentId,
      required this.postCommentReplyCount,
      required this.userName,
      required this.uid,
      required this.userImageURL});

  factory _$_Comment.fromJson(Map<String, dynamic> json) =>
      _$$_CommentFromJson(json);

  @override
  final dynamic createdAt;
  @override
  final dynamic updatedAt;
//Freezedではパッケージの型が使えない＝FirestoreのTimestampなど。
//dynamicで代用するが、エラーを吐いてくれない型だから、特殊な場面以外は非推奨
  @override
  final dynamic postRef;
  @override
  final String comment;
  @override
  final int likeCount;
  @override
  final String postCommentId;
  @override
  final int postCommentReplyCount;
  @override
  final String userName;
  @override
  final String uid;
  @override
  final String userImageURL;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Comment(createdAt: $createdAt, updatedAt: $updatedAt, postRef: $postRef, comment: $comment, likeCount: $likeCount, postCommentId: $postCommentId, postCommentReplyCount: $postCommentReplyCount, userName: $userName, uid: $uid, userImageURL: $userImageURL)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Comment'))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('postRef', postRef))
      ..add(DiagnosticsProperty('comment', comment))
      ..add(DiagnosticsProperty('likeCount', likeCount))
      ..add(DiagnosticsProperty('postCommentId', postCommentId))
      ..add(DiagnosticsProperty('postCommentReplyCount', postCommentReplyCount))
      ..add(DiagnosticsProperty('userName', userName))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('userImageURL', userImageURL));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Comment &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.postRef, postRef) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.postCommentId, postCommentId) ||
                other.postCommentId == postCommentId) &&
            (identical(other.postCommentReplyCount, postCommentReplyCount) ||
                other.postCommentReplyCount == postCommentReplyCount) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.userImageURL, userImageURL) ||
                other.userImageURL == userImageURL));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(postRef),
      comment,
      likeCount,
      postCommentId,
      postCommentReplyCount,
      userName,
      uid,
      userImageURL);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      __$$_CommentCopyWithImpl<_$_Comment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentToJson(
      this,
    );
  }
}

abstract class _Comment implements Comment {
  const factory _Comment(
      {required final dynamic createdAt,
      required final dynamic updatedAt,
      required final dynamic postRef,
      required final String comment,
      required final int likeCount,
      required final String postCommentId,
      required final int postCommentReplyCount,
      required final String userName,
      required final String uid,
      required final String userImageURL}) = _$_Comment;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$_Comment.fromJson;

  @override
  dynamic get createdAt;
  @override
  dynamic get updatedAt;
  @override //Freezedではパッケージの型が使えない＝FirestoreのTimestampなど。
//dynamicで代用するが、エラーを吐いてくれない型だから、特殊な場面以外は非推奨
  dynamic get postRef;
  @override
  String get comment;
  @override
  int get likeCount;
  @override
  String get postCommentId;
  @override
  int get postCommentReplyCount;
  @override
  String get userName;
  @override
  String get uid;
  @override
  String get userImageURL;
  @override
  @JsonKey(ignore: true)
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      throw _privateConstructorUsedError;
}
