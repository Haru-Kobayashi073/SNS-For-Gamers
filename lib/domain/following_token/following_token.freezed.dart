// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FollowingToken _$FollowingTokenFromJson(Map<String, dynamic> json) {
  return _FollowingToken.fromJson(json);
}

/// @nodoc
mixin _$FollowingToken {
  String get passiveUid => throw _privateConstructorUsedError;
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get tokenId => throw _privateConstructorUsedError;
  String get tokenType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowingTokenCopyWith<FollowingToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingTokenCopyWith<$Res> {
  factory $FollowingTokenCopyWith(
          FollowingToken value, $Res Function(FollowingToken) then) =
      _$FollowingTokenCopyWithImpl<$Res, FollowingToken>;
  @useResult
  $Res call(
      {String passiveUid, dynamic createdAt, String tokenId, String tokenType});
}

/// @nodoc
class _$FollowingTokenCopyWithImpl<$Res, $Val extends FollowingToken>
    implements $FollowingTokenCopyWith<$Res> {
  _$FollowingTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passiveUid = null,
    Object? createdAt = freezed,
    Object? tokenId = null,
    Object? tokenType = null,
  }) {
    return _then(_value.copyWith(
      passiveUid: null == passiveUid
          ? _value.passiveUid
          : passiveUid // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_FollowingTokenCopyWith<$Res>
    implements $FollowingTokenCopyWith<$Res> {
  factory _$$_FollowingTokenCopyWith(
          _$_FollowingToken value, $Res Function(_$_FollowingToken) then) =
      __$$_FollowingTokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String passiveUid, dynamic createdAt, String tokenId, String tokenType});
}

/// @nodoc
class __$$_FollowingTokenCopyWithImpl<$Res>
    extends _$FollowingTokenCopyWithImpl<$Res, _$_FollowingToken>
    implements _$$_FollowingTokenCopyWith<$Res> {
  __$$_FollowingTokenCopyWithImpl(
      _$_FollowingToken _value, $Res Function(_$_FollowingToken) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passiveUid = null,
    Object? createdAt = freezed,
    Object? tokenId = null,
    Object? tokenType = null,
  }) {
    return _then(_$_FollowingToken(
      passiveUid: null == passiveUid
          ? _value.passiveUid
          : passiveUid // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$_FollowingToken
    with DiagnosticableTreeMixin
    implements _FollowingToken {
  const _$_FollowingToken(
      {required this.passiveUid,
      required this.createdAt,
      required this.tokenId,
      required this.tokenType});

  factory _$_FollowingToken.fromJson(Map<String, dynamic> json) =>
      _$$_FollowingTokenFromJson(json);

  @override
  final String passiveUid;
  @override
  final dynamic createdAt;
  @override
  final String tokenId;
  @override
  final String tokenType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FollowingToken(passiveUid: $passiveUid, createdAt: $createdAt, tokenId: $tokenId, tokenType: $tokenType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FollowingToken'))
      ..add(DiagnosticsProperty('passiveUid', passiveUid))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('tokenId', tokenId))
      ..add(DiagnosticsProperty('tokenType', tokenType));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FollowingToken &&
            (identical(other.passiveUid, passiveUid) ||
                other.passiveUid == passiveUid) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, passiveUid,
      const DeepCollectionEquality().hash(createdAt), tokenId, tokenType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FollowingTokenCopyWith<_$_FollowingToken> get copyWith =>
      __$$_FollowingTokenCopyWithImpl<_$_FollowingToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FollowingTokenToJson(
      this,
    );
  }
}

abstract class _FollowingToken implements FollowingToken {
  const factory _FollowingToken(
      {required final String passiveUid,
      required final dynamic createdAt,
      required final String tokenId,
      required final String tokenType}) = _$_FollowingToken;

  factory _FollowingToken.fromJson(Map<String, dynamic> json) =
      _$_FollowingToken.fromJson;

  @override
  String get passiveUid;
  @override
  dynamic get createdAt;
  @override
  String get tokenId;
  @override
  String get tokenType;
  @override
  @JsonKey(ignore: true)
  _$$_FollowingTokenCopyWith<_$_FollowingToken> get copyWith =>
      throw _privateConstructorUsedError;
}
