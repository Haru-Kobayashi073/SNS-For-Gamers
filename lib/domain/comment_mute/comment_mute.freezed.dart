// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment_mute.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommentMute _$CommentMuteFromJson(Map<String, dynamic> json) {
  return _CommentMute.fromJson(json);
}

/// @nodoc
mixin _$CommentMute {
  String get activeUid => throw _privateConstructorUsedError;
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get postCommentId => throw _privateConstructorUsedError;
  dynamic get postCommentRef => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentMuteCopyWith<CommentMute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentMuteCopyWith<$Res> {
  factory $CommentMuteCopyWith(
          CommentMute value, $Res Function(CommentMute) then) =
      _$CommentMuteCopyWithImpl<$Res, CommentMute>;
  @useResult
  $Res call(
      {String activeUid,
      dynamic createdAt,
      String postCommentId,
      dynamic postCommentRef});
}

/// @nodoc
class _$CommentMuteCopyWithImpl<$Res, $Val extends CommentMute>
    implements $CommentMuteCopyWith<$Res> {
  _$CommentMuteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? createdAt = null,
    Object? postCommentId = null,
    Object? postCommentRef = null,
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
      postCommentId: null == postCommentId
          ? _value.postCommentId
          : postCommentId // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentRef: null == postCommentRef
          ? _value.postCommentRef
          : postCommentRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommentMuteCopyWith<$Res>
    implements $CommentMuteCopyWith<$Res> {
  factory _$$_CommentMuteCopyWith(
          _$_CommentMute value, $Res Function(_$_CommentMute) then) =
      __$$_CommentMuteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String activeUid,
      dynamic createdAt,
      String postCommentId,
      dynamic postCommentRef});
}

/// @nodoc
class __$$_CommentMuteCopyWithImpl<$Res>
    extends _$CommentMuteCopyWithImpl<$Res, _$_CommentMute>
    implements _$$_CommentMuteCopyWith<$Res> {
  __$$_CommentMuteCopyWithImpl(
      _$_CommentMute _value, $Res Function(_$_CommentMute) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? createdAt = null,
    Object? postCommentId = null,
    Object? postCommentRef = null,
  }) {
    return _then(_$_CommentMute(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postCommentId: null == postCommentId
          ? _value.postCommentId
          : postCommentId // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentRef: null == postCommentRef
          ? _value.postCommentRef
          : postCommentRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommentMute with DiagnosticableTreeMixin implements _CommentMute {
  const _$_CommentMute(
      {required this.activeUid,
      required this.createdAt,
      required this.postCommentId,
      required this.postCommentRef});

  factory _$_CommentMute.fromJson(Map<String, dynamic> json) =>
      _$$_CommentMuteFromJson(json);

  @override
  final String activeUid;
  @override
  final dynamic createdAt;
  @override
  final String postCommentId;
  @override
  final dynamic postCommentRef;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CommentMute(activeUid: $activeUid, createdAt: $createdAt, postCommentId: $postCommentId, postCommentRef: $postCommentRef)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CommentMute'))
      ..add(DiagnosticsProperty('activeUid', activeUid))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('postCommentId', postCommentId))
      ..add(DiagnosticsProperty('postCommentRef', postCommentRef));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentMute &&
            (identical(other.activeUid, activeUid) ||
                other.activeUid == activeUid) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.postCommentId, postCommentId) ||
                other.postCommentId == postCommentId) &&
            const DeepCollectionEquality()
                .equals(other.postCommentRef, postCommentRef));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      activeUid,
      const DeepCollectionEquality().hash(createdAt),
      postCommentId,
      const DeepCollectionEquality().hash(postCommentRef));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentMuteCopyWith<_$_CommentMute> get copyWith =>
      __$$_CommentMuteCopyWithImpl<_$_CommentMute>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentMuteToJson(
      this,
    );
  }
}

abstract class _CommentMute implements CommentMute {
  const factory _CommentMute(
      {required final String activeUid,
      required final dynamic createdAt,
      required final String postCommentId,
      required final dynamic postCommentRef}) = _$_CommentMute;

  factory _CommentMute.fromJson(Map<String, dynamic> json) =
      _$_CommentMute.fromJson;

  @override
  String get activeUid;
  @override
  dynamic get createdAt;
  @override
  String get postCommentId;
  @override
  dynamic get postCommentRef;
  @override
  @JsonKey(ignore: true)
  _$$_CommentMuteCopyWith<_$_CommentMute> get copyWith =>
      throw _privateConstructorUsedError;
}
