// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mute_post_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MutePostToken _$MutePostTokenFromJson(Map<String, dynamic> json) {
  return _MutePostToken.fromJson(json);
}

/// @nodoc
mixin _$MutePostToken {
  String get activeUid => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  dynamic get postRef => throw _privateConstructorUsedError;
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get tokenId => throw _privateConstructorUsedError;
  String get tokenType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MutePostTokenCopyWith<MutePostToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MutePostTokenCopyWith<$Res> {
  factory $MutePostTokenCopyWith(
          MutePostToken value, $Res Function(MutePostToken) then) =
      _$MutePostTokenCopyWithImpl<$Res, MutePostToken>;
  @useResult
  $Res call(
      {String activeUid,
      String postId,
      dynamic postRef,
      dynamic createdAt,
      String tokenId,
      String tokenType});
}

/// @nodoc
class _$MutePostTokenCopyWithImpl<$Res, $Val extends MutePostToken>
    implements $MutePostTokenCopyWith<$Res> {
  _$MutePostTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? postId = null,
    Object? postRef = freezed,
    Object? createdAt = freezed,
    Object? tokenId = null,
    Object? tokenType = null,
  }) {
    return _then(_value.copyWith(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      postRef: freezed == postRef
          ? _value.postRef
          : postRef // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_MutePostTokenCopyWith<$Res>
    implements $MutePostTokenCopyWith<$Res> {
  factory _$$_MutePostTokenCopyWith(
          _$_MutePostToken value, $Res Function(_$_MutePostToken) then) =
      __$$_MutePostTokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String activeUid,
      String postId,
      dynamic postRef,
      dynamic createdAt,
      String tokenId,
      String tokenType});
}

/// @nodoc
class __$$_MutePostTokenCopyWithImpl<$Res>
    extends _$MutePostTokenCopyWithImpl<$Res, _$_MutePostToken>
    implements _$$_MutePostTokenCopyWith<$Res> {
  __$$_MutePostTokenCopyWithImpl(
      _$_MutePostToken _value, $Res Function(_$_MutePostToken) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? postId = null,
    Object? postRef = freezed,
    Object? createdAt = freezed,
    Object? tokenId = null,
    Object? tokenType = null,
  }) {
    return _then(_$_MutePostToken(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      postRef: freezed == postRef
          ? _value.postRef
          : postRef // ignore: cast_nullable_to_non_nullable
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
class _$_MutePostToken with DiagnosticableTreeMixin implements _MutePostToken {
  const _$_MutePostToken(
      {required this.activeUid,
      required this.postId,
      required this.postRef,
      required this.createdAt,
      required this.tokenId,
      required this.tokenType});

  factory _$_MutePostToken.fromJson(Map<String, dynamic> json) =>
      _$$_MutePostTokenFromJson(json);

  @override
  final String activeUid;
  @override
  final String postId;
  @override
  final dynamic postRef;
  @override
  final dynamic createdAt;
  @override
  final String tokenId;
  @override
  final String tokenType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MutePostToken(activeUid: $activeUid, postId: $postId, postRef: $postRef, createdAt: $createdAt, tokenId: $tokenId, tokenType: $tokenType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MutePostToken'))
      ..add(DiagnosticsProperty('activeUid', activeUid))
      ..add(DiagnosticsProperty('postId', postId))
      ..add(DiagnosticsProperty('postRef', postRef))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('tokenId', tokenId))
      ..add(DiagnosticsProperty('tokenType', tokenType));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MutePostToken &&
            (identical(other.activeUid, activeUid) ||
                other.activeUid == activeUid) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            const DeepCollectionEquality().equals(other.postRef, postRef) &&
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
      postId,
      const DeepCollectionEquality().hash(postRef),
      const DeepCollectionEquality().hash(createdAt),
      tokenId,
      tokenType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MutePostTokenCopyWith<_$_MutePostToken> get copyWith =>
      __$$_MutePostTokenCopyWithImpl<_$_MutePostToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MutePostTokenToJson(
      this,
    );
  }
}

abstract class _MutePostToken implements MutePostToken {
  const factory _MutePostToken(
      {required final String activeUid,
      required final String postId,
      required final dynamic postRef,
      required final dynamic createdAt,
      required final String tokenId,
      required final String tokenType}) = _$_MutePostToken;

  factory _MutePostToken.fromJson(Map<String, dynamic> json) =
      _$_MutePostToken.fromJson;

  @override
  String get activeUid;
  @override
  String get postId;
  @override
  dynamic get postRef;
  @override
  dynamic get createdAt;
  @override
  String get tokenId;
  @override
  String get tokenType;
  @override
  @JsonKey(ignore: true)
  _$$_MutePostTokenCopyWith<_$_MutePostToken> get copyWith =>
      throw _privateConstructorUsedError;
}
