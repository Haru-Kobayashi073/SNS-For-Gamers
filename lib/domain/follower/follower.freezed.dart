// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follower.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Follower _$FollowerFromJson(Map<String, dynamic> json) {
  return _Follower.fromJson(json);
}

/// @nodoc
mixin _$Follower {
  String get followedUid => throw _privateConstructorUsedError;
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get followerUid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowerCopyWith<Follower> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowerCopyWith<$Res> {
  factory $FollowerCopyWith(Follower value, $Res Function(Follower) then) =
      _$FollowerCopyWithImpl<$Res, Follower>;
  @useResult
  $Res call({String followedUid, dynamic createdAt, String followerUid});
}

/// @nodoc
class _$FollowerCopyWithImpl<$Res, $Val extends Follower>
    implements $FollowerCopyWith<$Res> {
  _$FollowerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followedUid = null,
    Object? createdAt = freezed,
    Object? followerUid = null,
  }) {
    return _then(_value.copyWith(
      followedUid: null == followedUid
          ? _value.followedUid
          : followedUid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      followerUid: null == followerUid
          ? _value.followerUid
          : followerUid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FollowerCopyWith<$Res> implements $FollowerCopyWith<$Res> {
  factory _$$_FollowerCopyWith(
          _$_Follower value, $Res Function(_$_Follower) then) =
      __$$_FollowerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String followedUid, dynamic createdAt, String followerUid});
}

/// @nodoc
class __$$_FollowerCopyWithImpl<$Res>
    extends _$FollowerCopyWithImpl<$Res, _$_Follower>
    implements _$$_FollowerCopyWith<$Res> {
  __$$_FollowerCopyWithImpl(
      _$_Follower _value, $Res Function(_$_Follower) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followedUid = null,
    Object? createdAt = freezed,
    Object? followerUid = null,
  }) {
    return _then(_$_Follower(
      followedUid: null == followedUid
          ? _value.followedUid
          : followedUid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      followerUid: null == followerUid
          ? _value.followerUid
          : followerUid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Follower with DiagnosticableTreeMixin implements _Follower {
  const _$_Follower(
      {required this.followedUid,
      required this.createdAt,
      required this.followerUid});

  factory _$_Follower.fromJson(Map<String, dynamic> json) =>
      _$$_FollowerFromJson(json);

  @override
  final String followedUid;
  @override
  final dynamic createdAt;
  @override
  final String followerUid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Follower(followedUid: $followedUid, createdAt: $createdAt, followerUid: $followerUid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Follower'))
      ..add(DiagnosticsProperty('followedUid', followedUid))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('followerUid', followerUid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Follower &&
            (identical(other.followedUid, followedUid) ||
                other.followedUid == followedUid) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.followerUid, followerUid) ||
                other.followerUid == followerUid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, followedUid,
      const DeepCollectionEquality().hash(createdAt), followerUid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FollowerCopyWith<_$_Follower> get copyWith =>
      __$$_FollowerCopyWithImpl<_$_Follower>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FollowerToJson(
      this,
    );
  }
}

abstract class _Follower implements Follower {
  const factory _Follower(
      {required final String followedUid,
      required final dynamic createdAt,
      required final String followerUid}) = _$_Follower;

  factory _Follower.fromJson(Map<String, dynamic> json) = _$_Follower.fromJson;

  @override
  String get followedUid;
  @override
  dynamic get createdAt;
  @override
  String get followerUid;
  @override
  @JsonKey(ignore: true)
  _$$_FollowerCopyWith<_$_Follower> get copyWith =>
      throw _privateConstructorUsedError;
}
