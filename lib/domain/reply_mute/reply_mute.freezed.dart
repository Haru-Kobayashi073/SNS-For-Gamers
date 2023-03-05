// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reply_mute.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReplyMute _$ReplyMuteFromJson(Map<String, dynamic> json) {
  return _ReplyMute.fromJson(json);
}

/// @nodoc
mixin _$ReplyMute {
  String get activeUid => throw _privateConstructorUsedError;
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get postCommentReplyId => throw _privateConstructorUsedError;
  dynamic get postCommentReplyRef => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReplyMuteCopyWith<ReplyMute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReplyMuteCopyWith<$Res> {
  factory $ReplyMuteCopyWith(ReplyMute value, $Res Function(ReplyMute) then) =
      _$ReplyMuteCopyWithImpl<$Res, ReplyMute>;
  @useResult
  $Res call(
      {String activeUid,
      dynamic createdAt,
      String postCommentReplyId,
      dynamic postCommentReplyRef});
}

/// @nodoc
class _$ReplyMuteCopyWithImpl<$Res, $Val extends ReplyMute>
    implements $ReplyMuteCopyWith<$Res> {
  _$ReplyMuteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? createdAt = freezed,
    Object? postCommentReplyId = null,
    Object? postCommentReplyRef = freezed,
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
      postCommentReplyId: null == postCommentReplyId
          ? _value.postCommentReplyId
          : postCommentReplyId // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentReplyRef: freezed == postCommentReplyRef
          ? _value.postCommentReplyRef
          : postCommentReplyRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReplyMuteCopyWith<$Res> implements $ReplyMuteCopyWith<$Res> {
  factory _$$_ReplyMuteCopyWith(
          _$_ReplyMute value, $Res Function(_$_ReplyMute) then) =
      __$$_ReplyMuteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String activeUid,
      dynamic createdAt,
      String postCommentReplyId,
      dynamic postCommentReplyRef});
}

/// @nodoc
class __$$_ReplyMuteCopyWithImpl<$Res>
    extends _$ReplyMuteCopyWithImpl<$Res, _$_ReplyMute>
    implements _$$_ReplyMuteCopyWith<$Res> {
  __$$_ReplyMuteCopyWithImpl(
      _$_ReplyMute _value, $Res Function(_$_ReplyMute) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? createdAt = freezed,
    Object? postCommentReplyId = null,
    Object? postCommentReplyRef = freezed,
  }) {
    return _then(_$_ReplyMute(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postCommentReplyId: null == postCommentReplyId
          ? _value.postCommentReplyId
          : postCommentReplyId // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentReplyRef: freezed == postCommentReplyRef
          ? _value.postCommentReplyRef
          : postCommentReplyRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReplyMute with DiagnosticableTreeMixin implements _ReplyMute {
  const _$_ReplyMute(
      {required this.activeUid,
      required this.createdAt,
      required this.postCommentReplyId,
      required this.postCommentReplyRef});

  factory _$_ReplyMute.fromJson(Map<String, dynamic> json) =>
      _$$_ReplyMuteFromJson(json);

  @override
  final String activeUid;
  @override
  final dynamic createdAt;
  @override
  final String postCommentReplyId;
  @override
  final dynamic postCommentReplyRef;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReplyMute(activeUid: $activeUid, createdAt: $createdAt, postCommentReplyId: $postCommentReplyId, postCommentReplyRef: $postCommentReplyRef)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReplyMute'))
      ..add(DiagnosticsProperty('activeUid', activeUid))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('postCommentReplyId', postCommentReplyId))
      ..add(DiagnosticsProperty('postCommentReplyRef', postCommentReplyRef));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReplyMute &&
            (identical(other.activeUid, activeUid) ||
                other.activeUid == activeUid) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.postCommentReplyId, postCommentReplyId) ||
                other.postCommentReplyId == postCommentReplyId) &&
            const DeepCollectionEquality()
                .equals(other.postCommentReplyRef, postCommentReplyRef));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      activeUid,
      const DeepCollectionEquality().hash(createdAt),
      postCommentReplyId,
      const DeepCollectionEquality().hash(postCommentReplyRef));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReplyMuteCopyWith<_$_ReplyMute> get copyWith =>
      __$$_ReplyMuteCopyWithImpl<_$_ReplyMute>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReplyMuteToJson(
      this,
    );
  }
}

abstract class _ReplyMute implements ReplyMute {
  const factory _ReplyMute(
      {required final String activeUid,
      required final dynamic createdAt,
      required final String postCommentReplyId,
      required final dynamic postCommentReplyRef}) = _$_ReplyMute;

  factory _ReplyMute.fromJson(Map<String, dynamic> json) =
      _$_ReplyMute.fromJson;

  @override
  String get activeUid;
  @override
  dynamic get createdAt;
  @override
  String get postCommentReplyId;
  @override
  dynamic get postCommentReplyRef;
  @override
  @JsonKey(ignore: true)
  _$$_ReplyMuteCopyWith<_$_ReplyMute> get copyWith =>
      throw _privateConstructorUsedError;
}
