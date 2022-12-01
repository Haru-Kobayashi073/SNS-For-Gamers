// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'like_post_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LikePostToken _$LikePostTokenFromJson(Map<String, dynamic> json) {
  return _LikePostToken.fromJson(json);
}

/// @nodoc
mixin _$LikePostToken {
  String get activeUid => throw _privateConstructorUsedError;
  String get passiveUid => throw _privateConstructorUsedError;
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  String get tokenId => throw _privateConstructorUsedError;
  dynamic get postRef => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LikePostTokenCopyWith<LikePostToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikePostTokenCopyWith<$Res> {
  factory $LikePostTokenCopyWith(
          LikePostToken value, $Res Function(LikePostToken) then) =
      _$LikePostTokenCopyWithImpl<$Res, LikePostToken>;
  @useResult
  $Res call(
      {String activeUid,
      String passiveUid,
      dynamic createdAt,
      String postId,
      String tokenId,
      dynamic postRef});
}

/// @nodoc
class _$LikePostTokenCopyWithImpl<$Res, $Val extends LikePostToken>
    implements $LikePostTokenCopyWith<$Res> {
  _$LikePostTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? passiveUid = null,
    Object? createdAt = null,
    Object? postId = null,
    Object? tokenId = null,
    Object? postRef = null,
  }) {
    return _then(_value.copyWith(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      passiveUid: null == passiveUid
          ? _value.passiveUid
          : passiveUid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      tokenId: null == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String,
      postRef: null == postRef
          ? _value.postRef
          : postRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LikePostTokenCopyWith<$Res>
    implements $LikePostTokenCopyWith<$Res> {
  factory _$$_LikePostTokenCopyWith(
          _$_LikePostToken value, $Res Function(_$_LikePostToken) then) =
      __$$_LikePostTokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String activeUid,
      String passiveUid,
      dynamic createdAt,
      String postId,
      String tokenId,
      dynamic postRef});
}

/// @nodoc
class __$$_LikePostTokenCopyWithImpl<$Res>
    extends _$LikePostTokenCopyWithImpl<$Res, _$_LikePostToken>
    implements _$$_LikePostTokenCopyWith<$Res> {
  __$$_LikePostTokenCopyWithImpl(
      _$_LikePostToken _value, $Res Function(_$_LikePostToken) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? passiveUid = null,
    Object? createdAt = null,
    Object? postId = null,
    Object? tokenId = null,
    Object? postRef = null,
  }) {
    return _then(_$_LikePostToken(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      passiveUid: null == passiveUid
          ? _value.passiveUid
          : passiveUid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      tokenId: null == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String,
      postRef: null == postRef
          ? _value.postRef
          : postRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LikePostToken with DiagnosticableTreeMixin implements _LikePostToken {
  const _$_LikePostToken(
      {required this.activeUid,
      required this.passiveUid,
      required this.createdAt,
      required this.postId,
      required this.tokenId,
      required this.postRef});

  factory _$_LikePostToken.fromJson(Map<String, dynamic> json) =>
      _$$_LikePostTokenFromJson(json);

  @override
  final String activeUid;
  @override
  final String passiveUid;
  @override
  final dynamic createdAt;
  @override
  final String postId;
  @override
  final String tokenId;
  @override
  final dynamic postRef;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LikePostToken(activeUid: $activeUid, passiveUid: $passiveUid, createdAt: $createdAt, postId: $postId, tokenId: $tokenId, postRef: $postRef)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LikePostToken'))
      ..add(DiagnosticsProperty('activeUid', activeUid))
      ..add(DiagnosticsProperty('passiveUid', passiveUid))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('postId', postId))
      ..add(DiagnosticsProperty('tokenId', tokenId))
      ..add(DiagnosticsProperty('postRef', postRef));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LikePostToken &&
            (identical(other.activeUid, activeUid) ||
                other.activeUid == activeUid) &&
            (identical(other.passiveUid, passiveUid) ||
                other.passiveUid == passiveUid) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId) &&
            const DeepCollectionEquality().equals(other.postRef, postRef));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      activeUid,
      passiveUid,
      const DeepCollectionEquality().hash(createdAt),
      postId,
      tokenId,
      const DeepCollectionEquality().hash(postRef));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LikePostTokenCopyWith<_$_LikePostToken> get copyWith =>
      __$$_LikePostTokenCopyWithImpl<_$_LikePostToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LikePostTokenToJson(
      this,
    );
  }
}

abstract class _LikePostToken implements LikePostToken {
  const factory _LikePostToken(
      {required final String activeUid,
      required final String passiveUid,
      required final dynamic createdAt,
      required final String postId,
      required final String tokenId,
      required final dynamic postRef}) = _$_LikePostToken;

  factory _LikePostToken.fromJson(Map<String, dynamic> json) =
      _$_LikePostToken.fromJson;

  @override
  String get activeUid;
  @override
  String get passiveUid;
  @override
  dynamic get createdAt;
  @override
  String get postId;
  @override
  String get tokenId;
  @override
  dynamic get postRef;
  @override
  @JsonKey(ignore: true)
  _$$_LikePostTokenCopyWith<_$_LikePostToken> get copyWith =>
      throw _privateConstructorUsedError;
}
