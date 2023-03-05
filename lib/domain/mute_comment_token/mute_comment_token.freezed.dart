// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mute_comment_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MuteCommentToken _$MuteCommentTokenFromJson(Map<String, dynamic> json) {
  return _MuteCommentToken.fromJson(json);
}

/// @nodoc
mixin _$MuteCommentToken {
  String get activeUid => throw _privateConstructorUsedError;
  String get postCommentId => throw _privateConstructorUsedError;
  dynamic get postCommentRef => throw _privateConstructorUsedError;
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get tokenId => throw _privateConstructorUsedError;
  String get tokenType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MuteCommentTokenCopyWith<MuteCommentToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MuteCommentTokenCopyWith<$Res> {
  factory $MuteCommentTokenCopyWith(
          MuteCommentToken value, $Res Function(MuteCommentToken) then) =
      _$MuteCommentTokenCopyWithImpl<$Res, MuteCommentToken>;
  @useResult
  $Res call(
      {String activeUid,
      String postCommentId,
      dynamic postCommentRef,
      dynamic createdAt,
      String tokenId,
      String tokenType});
}

/// @nodoc
class _$MuteCommentTokenCopyWithImpl<$Res, $Val extends MuteCommentToken>
    implements $MuteCommentTokenCopyWith<$Res> {
  _$MuteCommentTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? postCommentId = null,
    Object? postCommentRef = freezed,
    Object? createdAt = freezed,
    Object? tokenId = null,
    Object? tokenType = null,
  }) {
    return _then(_value.copyWith(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentId: null == postCommentId
          ? _value.postCommentId
          : postCommentId // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentRef: freezed == postCommentRef
          ? _value.postCommentRef
          : postCommentRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      tokenId: null == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MuteCommentTokenCopyWith<$Res>
    implements $MuteCommentTokenCopyWith<$Res> {
  factory _$$_MuteCommentTokenCopyWith(
          _$_MuteCommentToken value, $Res Function(_$_MuteCommentToken) then) =
      __$$_MuteCommentTokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String activeUid,
      String postCommentId,
      dynamic postCommentRef,
      dynamic createdAt,
      String tokenId,
      String tokenType});
}

/// @nodoc
class __$$_MuteCommentTokenCopyWithImpl<$Res>
    extends _$MuteCommentTokenCopyWithImpl<$Res, _$_MuteCommentToken>
    implements _$$_MuteCommentTokenCopyWith<$Res> {
  __$$_MuteCommentTokenCopyWithImpl(
      _$_MuteCommentToken _value, $Res Function(_$_MuteCommentToken) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? postCommentId = null,
    Object? postCommentRef = freezed,
    Object? createdAt = freezed,
    Object? tokenId = null,
    Object? tokenType = null,
  }) {
    return _then(_$_MuteCommentToken(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentId: null == postCommentId
          ? _value.postCommentId
          : postCommentId // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentRef: freezed == postCommentRef
          ? _value.postCommentRef
          : postCommentRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      tokenId: null == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MuteCommentToken
    with DiagnosticableTreeMixin
    implements _MuteCommentToken {
  const _$_MuteCommentToken(
      {required this.activeUid,
      required this.postCommentId,
      required this.postCommentRef,
      required this.createdAt,
      required this.tokenId,
      required this.tokenType});

  factory _$_MuteCommentToken.fromJson(Map<String, dynamic> json) =>
      _$$_MuteCommentTokenFromJson(json);

  @override
  final String activeUid;
  @override
  final String postCommentId;
  @override
  final dynamic postCommentRef;
  @override
  final dynamic createdAt;
  @override
  final String tokenId;
  @override
  final String tokenType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MuteCommentToken(activeUid: $activeUid, postCommentId: $postCommentId, postCommentRef: $postCommentRef, createdAt: $createdAt, tokenId: $tokenId, tokenType: $tokenType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MuteCommentToken'))
      ..add(DiagnosticsProperty('activeUid', activeUid))
      ..add(DiagnosticsProperty('postCommentId', postCommentId))
      ..add(DiagnosticsProperty('postCommentRef', postCommentRef))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('tokenId', tokenId))
      ..add(DiagnosticsProperty('tokenType', tokenType));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MuteCommentToken &&
            (identical(other.activeUid, activeUid) ||
                other.activeUid == activeUid) &&
            (identical(other.postCommentId, postCommentId) ||
                other.postCommentId == postCommentId) &&
            const DeepCollectionEquality()
                .equals(other.postCommentRef, postCommentRef) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      activeUid,
      postCommentId,
      const DeepCollectionEquality().hash(postCommentRef),
      const DeepCollectionEquality().hash(createdAt),
      tokenId,
      tokenType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MuteCommentTokenCopyWith<_$_MuteCommentToken> get copyWith =>
      __$$_MuteCommentTokenCopyWithImpl<_$_MuteCommentToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MuteCommentTokenToJson(
      this,
    );
  }
}

abstract class _MuteCommentToken implements MuteCommentToken {
  const factory _MuteCommentToken(
      {required final String activeUid,
      required final String postCommentId,
      required final dynamic postCommentRef,
      required final dynamic createdAt,
      required final String tokenId,
      required final String tokenType}) = _$_MuteCommentToken;

  factory _MuteCommentToken.fromJson(Map<String, dynamic> json) =
      _$_MuteCommentToken.fromJson;

  @override
  String get activeUid;
  @override
  String get postCommentId;
  @override
  dynamic get postCommentRef;
  @override
  dynamic get createdAt;
  @override
  String get tokenId;
  @override
  String get tokenType;
  @override
  @JsonKey(ignore: true)
  _$$_MuteCommentTokenCopyWith<_$_MuteCommentToken> get copyWith =>
      throw _privateConstructorUsedError;
}
