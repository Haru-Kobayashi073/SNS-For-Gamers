// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_mute.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserMute _$UserMuteFromJson(Map<String, dynamic> json) {
  return _UserMute.fromJson(json);
}

/// @nodoc
mixin _$UserMute {
  String get activeUid => throw _privateConstructorUsedError;
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get passiveUid => throw _privateConstructorUsedError;
  dynamic get passiveUserRef => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserMuteCopyWith<UserMute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserMuteCopyWith<$Res> {
  factory $UserMuteCopyWith(UserMute value, $Res Function(UserMute) then) =
      _$UserMuteCopyWithImpl<$Res, UserMute>;
  @useResult
  $Res call(
      {String activeUid,
      dynamic createdAt,
      String passiveUid,
      dynamic passiveUserRef});
}

/// @nodoc
class _$UserMuteCopyWithImpl<$Res, $Val extends UserMute>
    implements $UserMuteCopyWith<$Res> {
  _$UserMuteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? createdAt = null,
    Object? passiveUid = null,
    Object? passiveUserRef = null,
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
      passiveUid: null == passiveUid
          ? _value.passiveUid
          : passiveUid // ignore: cast_nullable_to_non_nullable
              as String,
      passiveUserRef: null == passiveUserRef
          ? _value.passiveUserRef
          : passiveUserRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserMuteCopyWith<$Res> implements $UserMuteCopyWith<$Res> {
  factory _$$_UserMuteCopyWith(
          _$_UserMute value, $Res Function(_$_UserMute) then) =
      __$$_UserMuteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String activeUid,
      dynamic createdAt,
      String passiveUid,
      dynamic passiveUserRef});
}

/// @nodoc
class __$$_UserMuteCopyWithImpl<$Res>
    extends _$UserMuteCopyWithImpl<$Res, _$_UserMute>
    implements _$$_UserMuteCopyWith<$Res> {
  __$$_UserMuteCopyWithImpl(
      _$_UserMute _value, $Res Function(_$_UserMute) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? createdAt = null,
    Object? passiveUid = null,
    Object? passiveUserRef = null,
  }) {
    return _then(_$_UserMute(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      passiveUid: null == passiveUid
          ? _value.passiveUid
          : passiveUid // ignore: cast_nullable_to_non_nullable
              as String,
      passiveUserRef: null == passiveUserRef
          ? _value.passiveUserRef
          : passiveUserRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserMute with DiagnosticableTreeMixin implements _UserMute {
  const _$_UserMute(
      {required this.activeUid,
      required this.createdAt,
      required this.passiveUid,
      required this.passiveUserRef});

  factory _$_UserMute.fromJson(Map<String, dynamic> json) =>
      _$$_UserMuteFromJson(json);

  @override
  final String activeUid;
  @override
  final dynamic createdAt;
  @override
  final String passiveUid;
  @override
  final dynamic passiveUserRef;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserMute(activeUid: $activeUid, createdAt: $createdAt, passiveUid: $passiveUid, passiveUserRef: $passiveUserRef)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserMute'))
      ..add(DiagnosticsProperty('activeUid', activeUid))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('passiveUid', passiveUid))
      ..add(DiagnosticsProperty('passiveUserRef', passiveUserRef));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserMute &&
            (identical(other.activeUid, activeUid) ||
                other.activeUid == activeUid) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.passiveUid, passiveUid) ||
                other.passiveUid == passiveUid) &&
            const DeepCollectionEquality()
                .equals(other.passiveUserRef, passiveUserRef));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      activeUid,
      const DeepCollectionEquality().hash(createdAt),
      passiveUid,
      const DeepCollectionEquality().hash(passiveUserRef));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserMuteCopyWith<_$_UserMute> get copyWith =>
      __$$_UserMuteCopyWithImpl<_$_UserMute>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserMuteToJson(
      this,
    );
  }
}

abstract class _UserMute implements UserMute {
  const factory _UserMute(
      {required final String activeUid,
      required final dynamic createdAt,
      required final String passiveUid,
      required final dynamic passiveUserRef}) = _$_UserMute;

  factory _UserMute.fromJson(Map<String, dynamic> json) = _$_UserMute.fromJson;

  @override
  String get activeUid;
  @override
  dynamic get createdAt;
  @override
  String get passiveUid;
  @override
  dynamic get passiveUserRef;
  @override
  @JsonKey(ignore: true)
  _$$_UserMuteCopyWith<_$_UserMute> get copyWith =>
      throw _privateConstructorUsedError;
}
