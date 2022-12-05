// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment_like.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommentLike _$CommentLikeFromJson(Map<String, dynamic> json) {
  return _CommentLike.fromJson(json);
}

/// @nodoc
mixin _$CommentLike {
  String get activeUid => throw _privateConstructorUsedError;
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get postCommentCreatorUid => throw _privateConstructorUsedError;
  dynamic get postCommentRef => throw _privateConstructorUsedError;
  String get postCommentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentLikeCopyWith<CommentLike> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentLikeCopyWith<$Res> {
  factory $CommentLikeCopyWith(
          CommentLike value, $Res Function(CommentLike) then) =
      _$CommentLikeCopyWithImpl<$Res, CommentLike>;
  @useResult
  $Res call(
      {String activeUid,
      dynamic createdAt,
      String postCommentCreatorUid,
      dynamic postCommentRef,
      String postCommentId});
}

/// @nodoc
class _$CommentLikeCopyWithImpl<$Res, $Val extends CommentLike>
    implements $CommentLikeCopyWith<$Res> {
  _$CommentLikeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? createdAt = null,
    Object? postCommentCreatorUid = null,
    Object? postCommentRef = null,
    Object? postCommentId = null,
  }) {
    return _then(_value.copyWith(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postCommentCreatorUid: null == postCommentCreatorUid
          ? _value.postCommentCreatorUid
          : postCommentCreatorUid // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentRef: null == postCommentRef
          ? _value.postCommentRef
          : postCommentRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postCommentId: null == postCommentId
          ? _value.postCommentId
          : postCommentId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommentLikeCopyWith<$Res>
    implements $CommentLikeCopyWith<$Res> {
  factory _$$_CommentLikeCopyWith(
          _$_CommentLike value, $Res Function(_$_CommentLike) then) =
      __$$_CommentLikeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String activeUid,
      dynamic createdAt,
      String postCommentCreatorUid,
      dynamic postCommentRef,
      String postCommentId});
}

/// @nodoc
class __$$_CommentLikeCopyWithImpl<$Res>
    extends _$CommentLikeCopyWithImpl<$Res, _$_CommentLike>
    implements _$$_CommentLikeCopyWith<$Res> {
  __$$_CommentLikeCopyWithImpl(
      _$_CommentLike _value, $Res Function(_$_CommentLike) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? createdAt = null,
    Object? postCommentCreatorUid = null,
    Object? postCommentRef = null,
    Object? postCommentId = null,
  }) {
    return _then(_$_CommentLike(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postCommentCreatorUid: null == postCommentCreatorUid
          ? _value.postCommentCreatorUid
          : postCommentCreatorUid // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentRef: null == postCommentRef
          ? _value.postCommentRef
          : postCommentRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postCommentId: null == postCommentId
          ? _value.postCommentId
          : postCommentId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommentLike with DiagnosticableTreeMixin implements _CommentLike {
  const _$_CommentLike(
      {required this.activeUid,
      required this.createdAt,
      required this.postCommentCreatorUid,
      required this.postCommentRef,
      required this.postCommentId});

  factory _$_CommentLike.fromJson(Map<String, dynamic> json) =>
      _$$_CommentLikeFromJson(json);

  @override
  final String activeUid;
  @override
  final dynamic createdAt;
  @override
  final String postCommentCreatorUid;
  @override
  final dynamic postCommentRef;
  @override
  final String postCommentId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CommentLike(activeUid: $activeUid, createdAt: $createdAt, postCommentCreatorUid: $postCommentCreatorUid, postCommentRef: $postCommentRef, postCommentId: $postCommentId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CommentLike'))
      ..add(DiagnosticsProperty('activeUid', activeUid))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('postCommentCreatorUid', postCommentCreatorUid))
      ..add(DiagnosticsProperty('postCommentRef', postCommentRef))
      ..add(DiagnosticsProperty('postCommentId', postCommentId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentLike &&
            (identical(other.activeUid, activeUid) ||
                other.activeUid == activeUid) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.postCommentCreatorUid, postCommentCreatorUid) ||
                other.postCommentCreatorUid == postCommentCreatorUid) &&
            const DeepCollectionEquality()
                .equals(other.postCommentRef, postCommentRef) &&
            (identical(other.postCommentId, postCommentId) ||
                other.postCommentId == postCommentId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      activeUid,
      const DeepCollectionEquality().hash(createdAt),
      postCommentCreatorUid,
      const DeepCollectionEquality().hash(postCommentRef),
      postCommentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentLikeCopyWith<_$_CommentLike> get copyWith =>
      __$$_CommentLikeCopyWithImpl<_$_CommentLike>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentLikeToJson(
      this,
    );
  }
}

abstract class _CommentLike implements CommentLike {
  const factory _CommentLike(
      {required final String activeUid,
      required final dynamic createdAt,
      required final String postCommentCreatorUid,
      required final dynamic postCommentRef,
      required final String postCommentId}) = _$_CommentLike;

  factory _CommentLike.fromJson(Map<String, dynamic> json) =
      _$_CommentLike.fromJson;

  @override
  String get activeUid;
  @override
  dynamic get createdAt;
  @override
  String get postCommentCreatorUid;
  @override
  dynamic get postCommentRef;
  @override
  String get postCommentId;
  @override
  @JsonKey(ignore: true)
  _$$_CommentLikeCopyWith<_$_CommentLike> get copyWith =>
      throw _privateConstructorUsedError;
}
