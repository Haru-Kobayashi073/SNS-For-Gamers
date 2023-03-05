// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mute_user_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MuteUserToken _$MuteUserTokenFromJson(Map<String, dynamic> json) {
  return _MuteUserToken.fromJson(json);
}

/// @nodoc
mixin _$MuteUserToken {
  String get activeUid => throw _privateConstructorUsedError;
  String get passiveUid => throw _privateConstructorUsedError;
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get tokenId => throw _privateConstructorUsedError;
  String get tokenType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MuteUserTokenCopyWith<MuteUserToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MuteUserTokenCopyWith<$Res> {
  factory $MuteUserTokenCopyWith(
          MuteUserToken value, $Res Function(MuteUserToken) then) =
      _$MuteUserTokenCopyWithImpl<$Res, MuteUserToken>;
  @useResult
  $Res call(
      {String activeUid,
      String passiveUid,
      dynamic createdAt,
      String tokenId,
      String tokenType});
}

/// @nodoc
class _$MuteUserTokenCopyWithImpl<$Res, $Val extends MuteUserToken>
    implements $MuteUserTokenCopyWith<$Res> {
  _$MuteUserTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? passiveUid = null,
    Object? createdAt = freezed,
    Object? tokenId = null,
    Object? tokenType = null,
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
abstract class _$$_MuteUserTokenCopyWith<$Res>
    implements $MuteUserTokenCopyWith<$Res> {
  factory _$$_MuteUserTokenCopyWith(
          _$_MuteUserToken value, $Res Function(_$_MuteUserToken) then) =
      __$$_MuteUserTokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String activeUid,
      String passiveUid,
      dynamic createdAt,
      String tokenId,
      String tokenType});
}

/// @nodoc
class __$$_MuteUserTokenCopyWithImpl<$Res>
    extends _$MuteUserTokenCopyWithImpl<$Res, _$_MuteUserToken>
    implements _$$_MuteUserTokenCopyWith<$Res> {
  __$$_MuteUserTokenCopyWithImpl(
      _$_MuteUserToken _value, $Res Function(_$_MuteUserToken) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? passiveUid = null,
    Object? createdAt = freezed,
    Object? tokenId = null,
    Object? tokenType = null,
  }) {
    return _then(_$_MuteUserToken(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$_MuteUserToken with DiagnosticableTreeMixin implements _MuteUserToken {
  const _$_MuteUserToken(
      {required this.activeUid,
      required this.passiveUid,
      required this.createdAt,
      required this.tokenId,
      required this.tokenType});

  factory _$_MuteUserToken.fromJson(Map<String, dynamic> json) =>
      _$$_MuteUserTokenFromJson(json);

  @override
  final String activeUid;
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
    return 'MuteUserToken(activeUid: $activeUid, passiveUid: $passiveUid, createdAt: $createdAt, tokenId: $tokenId, tokenType: $tokenType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MuteUserToken'))
      ..add(DiagnosticsProperty('activeUid', activeUid))
      ..add(DiagnosticsProperty('passiveUid', passiveUid))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('tokenId', tokenId))
      ..add(DiagnosticsProperty('tokenType', tokenType));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MuteUserToken &&
            (identical(other.activeUid, activeUid) ||
                other.activeUid == activeUid) &&
            (identical(other.passiveUid, passiveUid) ||
                other.passiveUid == passiveUid) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, activeUid, passiveUid,
      const DeepCollectionEquality().hash(createdAt), tokenId, tokenType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MuteUserTokenCopyWith<_$_MuteUserToken> get copyWith =>
      __$$_MuteUserTokenCopyWithImpl<_$_MuteUserToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MuteUserTokenToJson(
      this,
    );
  }
}

abstract class _MuteUserToken implements MuteUserToken {
  const factory _MuteUserToken(
      {required final String activeUid,
      required final String passiveUid,
      required final dynamic createdAt,
      required final String tokenId,
      required final String tokenType}) = _$_MuteUserToken;

  factory _MuteUserToken.fromJson(Map<String, dynamic> json) =
      _$_MuteUserToken.fromJson;

  @override
  String get activeUid;
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
  _$$_MuteUserTokenCopyWith<_$_MuteUserToken> get copyWith =>
      throw _privateConstructorUsedError;
}
