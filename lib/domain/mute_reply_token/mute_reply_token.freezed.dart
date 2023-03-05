// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mute_reply_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MuteReplyToken _$MuteReplyTokenFromJson(Map<String, dynamic> json) {
  return _MuteReplyToken.fromJson(json);
}

/// @nodoc
mixin _$MuteReplyToken {
  String get activeUid => throw _privateConstructorUsedError;
  String get postCommentReplyId => throw _privateConstructorUsedError;
  dynamic get postCommentReplyRef => throw _privateConstructorUsedError;
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get tokenId => throw _privateConstructorUsedError;
  String get tokenType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MuteReplyTokenCopyWith<MuteReplyToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MuteReplyTokenCopyWith<$Res> {
  factory $MuteReplyTokenCopyWith(
          MuteReplyToken value, $Res Function(MuteReplyToken) then) =
      _$MuteReplyTokenCopyWithImpl<$Res, MuteReplyToken>;
  @useResult
  $Res call(
      {String activeUid,
      String postCommentReplyId,
      dynamic postCommentReplyRef,
      dynamic createdAt,
      String tokenId,
      String tokenType});
}

/// @nodoc
class _$MuteReplyTokenCopyWithImpl<$Res, $Val extends MuteReplyToken>
    implements $MuteReplyTokenCopyWith<$Res> {
  _$MuteReplyTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? postCommentReplyId = null,
    Object? postCommentReplyRef = freezed,
    Object? createdAt = freezed,
    Object? tokenId = null,
    Object? tokenType = null,
  }) {
    return _then(_value.copyWith(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentReplyId: null == postCommentReplyId
          ? _value.postCommentReplyId
          : postCommentReplyId // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentReplyRef: freezed == postCommentReplyRef
          ? _value.postCommentReplyRef
          : postCommentReplyRef // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_MuteReplyTokenCopyWith<$Res>
    implements $MuteReplyTokenCopyWith<$Res> {
  factory _$$_MuteReplyTokenCopyWith(
          _$_MuteReplyToken value, $Res Function(_$_MuteReplyToken) then) =
      __$$_MuteReplyTokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String activeUid,
      String postCommentReplyId,
      dynamic postCommentReplyRef,
      dynamic createdAt,
      String tokenId,
      String tokenType});
}

/// @nodoc
class __$$_MuteReplyTokenCopyWithImpl<$Res>
    extends _$MuteReplyTokenCopyWithImpl<$Res, _$_MuteReplyToken>
    implements _$$_MuteReplyTokenCopyWith<$Res> {
  __$$_MuteReplyTokenCopyWithImpl(
      _$_MuteReplyToken _value, $Res Function(_$_MuteReplyToken) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? postCommentReplyId = null,
    Object? postCommentReplyRef = freezed,
    Object? createdAt = freezed,
    Object? tokenId = null,
    Object? tokenType = null,
  }) {
    return _then(_$_MuteReplyToken(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentReplyId: null == postCommentReplyId
          ? _value.postCommentReplyId
          : postCommentReplyId // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentReplyRef: freezed == postCommentReplyRef
          ? _value.postCommentReplyRef
          : postCommentReplyRef // ignore: cast_nullable_to_non_nullable
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
class _$_MuteReplyToken
    with DiagnosticableTreeMixin
    implements _MuteReplyToken {
  const _$_MuteReplyToken(
      {required this.activeUid,
      required this.postCommentReplyId,
      required this.postCommentReplyRef,
      required this.createdAt,
      required this.tokenId,
      required this.tokenType});

  factory _$_MuteReplyToken.fromJson(Map<String, dynamic> json) =>
      _$$_MuteReplyTokenFromJson(json);

  @override
  final String activeUid;
  @override
  final String postCommentReplyId;
  @override
  final dynamic postCommentReplyRef;
  @override
  final dynamic createdAt;
  @override
  final String tokenId;
  @override
  final String tokenType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MuteReplyToken(activeUid: $activeUid, postCommentReplyId: $postCommentReplyId, postCommentReplyRef: $postCommentReplyRef, createdAt: $createdAt, tokenId: $tokenId, tokenType: $tokenType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MuteReplyToken'))
      ..add(DiagnosticsProperty('activeUid', activeUid))
      ..add(DiagnosticsProperty('postCommentReplyId', postCommentReplyId))
      ..add(DiagnosticsProperty('postCommentReplyRef', postCommentReplyRef))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('tokenId', tokenId))
      ..add(DiagnosticsProperty('tokenType', tokenType));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MuteReplyToken &&
            (identical(other.activeUid, activeUid) ||
                other.activeUid == activeUid) &&
            (identical(other.postCommentReplyId, postCommentReplyId) ||
                other.postCommentReplyId == postCommentReplyId) &&
            const DeepCollectionEquality()
                .equals(other.postCommentReplyRef, postCommentReplyRef) &&
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
      postCommentReplyId,
      const DeepCollectionEquality().hash(postCommentReplyRef),
      const DeepCollectionEquality().hash(createdAt),
      tokenId,
      tokenType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MuteReplyTokenCopyWith<_$_MuteReplyToken> get copyWith =>
      __$$_MuteReplyTokenCopyWithImpl<_$_MuteReplyToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MuteReplyTokenToJson(
      this,
    );
  }
}

abstract class _MuteReplyToken implements MuteReplyToken {
  const factory _MuteReplyToken(
      {required final String activeUid,
      required final String postCommentReplyId,
      required final dynamic postCommentReplyRef,
      required final dynamic createdAt,
      required final String tokenId,
      required final String tokenType}) = _$_MuteReplyToken;

  factory _MuteReplyToken.fromJson(Map<String, dynamic> json) =
      _$_MuteReplyToken.fromJson;

  @override
  String get activeUid;
  @override
  String get postCommentReplyId;
  @override
  dynamic get postCommentReplyRef;
  @override
  dynamic get createdAt;
  @override
  String get tokenId;
  @override
  String get tokenType;
  @override
  @JsonKey(ignore: true)
  _$$_MuteReplyTokenCopyWith<_$_MuteReplyToken> get copyWith =>
      throw _privateConstructorUsedError;
}
