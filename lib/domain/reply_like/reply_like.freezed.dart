// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reply_like.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReplyLike _$ReplyLikeFromJson(Map<String, dynamic> json) {
  return _ReplyLike.fromJson(json);
}

/// @nodoc
mixin _$ReplyLike {
  String get activeUid => throw _privateConstructorUsedError;
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get postCommentReplyCreatorUid => throw _privateConstructorUsedError;
  dynamic get postCommentReplyRef => throw _privateConstructorUsedError;
  String get postCommentReplyId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReplyLikeCopyWith<ReplyLike> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReplyLikeCopyWith<$Res> {
  factory $ReplyLikeCopyWith(ReplyLike value, $Res Function(ReplyLike) then) =
      _$ReplyLikeCopyWithImpl<$Res, ReplyLike>;
  @useResult
  $Res call(
      {String activeUid,
      dynamic createdAt,
      String postCommentReplyCreatorUid,
      dynamic postCommentReplyRef,
      String postCommentReplyId});
}

/// @nodoc
class _$ReplyLikeCopyWithImpl<$Res, $Val extends ReplyLike>
    implements $ReplyLikeCopyWith<$Res> {
  _$ReplyLikeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? createdAt = freezed,
    Object? postCommentReplyCreatorUid = null,
    Object? postCommentReplyRef = freezed,
    Object? postCommentReplyId = null,
  }) {
    return _then(_value.copyWith(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postCommentReplyCreatorUid: null == postCommentReplyCreatorUid
          ? _value.postCommentReplyCreatorUid
          : postCommentReplyCreatorUid // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentReplyRef: freezed == postCommentReplyRef
          ? _value.postCommentReplyRef
          : postCommentReplyRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postCommentReplyId: null == postCommentReplyId
          ? _value.postCommentReplyId
          : postCommentReplyId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReplyLikeCopyWith<$Res> implements $ReplyLikeCopyWith<$Res> {
  factory _$$_ReplyLikeCopyWith(
          _$_ReplyLike value, $Res Function(_$_ReplyLike) then) =
      __$$_ReplyLikeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String activeUid,
      dynamic createdAt,
      String postCommentReplyCreatorUid,
      dynamic postCommentReplyRef,
      String postCommentReplyId});
}

/// @nodoc
class __$$_ReplyLikeCopyWithImpl<$Res>
    extends _$ReplyLikeCopyWithImpl<$Res, _$_ReplyLike>
    implements _$$_ReplyLikeCopyWith<$Res> {
  __$$_ReplyLikeCopyWithImpl(
      _$_ReplyLike _value, $Res Function(_$_ReplyLike) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? createdAt = freezed,
    Object? postCommentReplyCreatorUid = null,
    Object? postCommentReplyRef = freezed,
    Object? postCommentReplyId = null,
  }) {
    return _then(_$_ReplyLike(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postCommentReplyCreatorUid: null == postCommentReplyCreatorUid
          ? _value.postCommentReplyCreatorUid
          : postCommentReplyCreatorUid // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentReplyRef: freezed == postCommentReplyRef
          ? _value.postCommentReplyRef
          : postCommentReplyRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postCommentReplyId: null == postCommentReplyId
          ? _value.postCommentReplyId
          : postCommentReplyId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReplyLike with DiagnosticableTreeMixin implements _ReplyLike {
  const _$_ReplyLike(
      {required this.activeUid,
      required this.createdAt,
      required this.postCommentReplyCreatorUid,
      required this.postCommentReplyRef,
      required this.postCommentReplyId});

  factory _$_ReplyLike.fromJson(Map<String, dynamic> json) =>
      _$$_ReplyLikeFromJson(json);

  @override
  final String activeUid;
  @override
  final dynamic createdAt;
  @override
  final String postCommentReplyCreatorUid;
  @override
  final dynamic postCommentReplyRef;
  @override
  final String postCommentReplyId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReplyLike(activeUid: $activeUid, createdAt: $createdAt, postCommentReplyCreatorUid: $postCommentReplyCreatorUid, postCommentReplyRef: $postCommentReplyRef, postCommentReplyId: $postCommentReplyId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReplyLike'))
      ..add(DiagnosticsProperty('activeUid', activeUid))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty(
          'postCommentReplyCreatorUid', postCommentReplyCreatorUid))
      ..add(DiagnosticsProperty('postCommentReplyRef', postCommentReplyRef))
      ..add(DiagnosticsProperty('postCommentReplyId', postCommentReplyId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReplyLike &&
            (identical(other.activeUid, activeUid) ||
                other.activeUid == activeUid) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.postCommentReplyCreatorUid,
                    postCommentReplyCreatorUid) ||
                other.postCommentReplyCreatorUid ==
                    postCommentReplyCreatorUid) &&
            const DeepCollectionEquality()
                .equals(other.postCommentReplyRef, postCommentReplyRef) &&
            (identical(other.postCommentReplyId, postCommentReplyId) ||
                other.postCommentReplyId == postCommentReplyId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      activeUid,
      const DeepCollectionEquality().hash(createdAt),
      postCommentReplyCreatorUid,
      const DeepCollectionEquality().hash(postCommentReplyRef),
      postCommentReplyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReplyLikeCopyWith<_$_ReplyLike> get copyWith =>
      __$$_ReplyLikeCopyWithImpl<_$_ReplyLike>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReplyLikeToJson(
      this,
    );
  }
}

abstract class _ReplyLike implements ReplyLike {
  const factory _ReplyLike(
      {required final String activeUid,
      required final dynamic createdAt,
      required final String postCommentReplyCreatorUid,
      required final dynamic postCommentReplyRef,
      required final String postCommentReplyId}) = _$_ReplyLike;

  factory _ReplyLike.fromJson(Map<String, dynamic> json) =
      _$_ReplyLike.fromJson;

  @override
  String get activeUid;
  @override
  dynamic get createdAt;
  @override
  String get postCommentReplyCreatorUid;
  @override
  dynamic get postCommentReplyRef;
  @override
  String get postCommentReplyId;
  @override
  @JsonKey(ignore: true)
  _$$_ReplyLikeCopyWith<_$_ReplyLike> get copyWith =>
      throw _privateConstructorUsedError;
}
