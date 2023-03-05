// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qiita_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QiitaUser _$QiitaUserFromJson(Map<String, dynamic> json) {
  return _QiitaUser.fromJson(json);
}

/// @nodoc
mixin _$QiitaUser {
  String get description => throw _privateConstructorUsedError;
  int get followees_count => throw _privateConstructorUsedError;
  int get followers_count => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  int get items_count => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get permanent_id => throw _privateConstructorUsedError;
  String get profile_image_url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QiitaUserCopyWith<QiitaUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QiitaUserCopyWith<$Res> {
  factory $QiitaUserCopyWith(QiitaUser value, $Res Function(QiitaUser) then) =
      _$QiitaUserCopyWithImpl<$Res, QiitaUser>;
  @useResult
  $Res call(
      {String description,
      int followees_count,
      int followers_count,
      String id,
      int items_count,
      String name,
      int permanent_id,
      String profile_image_url});
}

/// @nodoc
class _$QiitaUserCopyWithImpl<$Res, $Val extends QiitaUser>
    implements $QiitaUserCopyWith<$Res> {
  _$QiitaUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? followees_count = null,
    Object? followers_count = null,
    Object? id = null,
    Object? items_count = null,
    Object? name = null,
    Object? permanent_id = null,
    Object? profile_image_url = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      followees_count: null == followees_count
          ? _value.followees_count
          : followees_count // ignore: cast_nullable_to_non_nullable
              as int,
      followers_count: null == followers_count
          ? _value.followers_count
          : followers_count // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      items_count: null == items_count
          ? _value.items_count
          : items_count // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      permanent_id: null == permanent_id
          ? _value.permanent_id
          : permanent_id // ignore: cast_nullable_to_non_nullable
              as int,
      profile_image_url: null == profile_image_url
          ? _value.profile_image_url
          : profile_image_url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QiitaUserCopyWith<$Res> implements $QiitaUserCopyWith<$Res> {
  factory _$$_QiitaUserCopyWith(
          _$_QiitaUser value, $Res Function(_$_QiitaUser) then) =
      __$$_QiitaUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String description,
      int followees_count,
      int followers_count,
      String id,
      int items_count,
      String name,
      int permanent_id,
      String profile_image_url});
}

/// @nodoc
class __$$_QiitaUserCopyWithImpl<$Res>
    extends _$QiitaUserCopyWithImpl<$Res, _$_QiitaUser>
    implements _$$_QiitaUserCopyWith<$Res> {
  __$$_QiitaUserCopyWithImpl(
      _$_QiitaUser _value, $Res Function(_$_QiitaUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? followees_count = null,
    Object? followers_count = null,
    Object? id = null,
    Object? items_count = null,
    Object? name = null,
    Object? permanent_id = null,
    Object? profile_image_url = null,
  }) {
    return _then(_$_QiitaUser(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      followees_count: null == followees_count
          ? _value.followees_count
          : followees_count // ignore: cast_nullable_to_non_nullable
              as int,
      followers_count: null == followers_count
          ? _value.followers_count
          : followers_count // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      items_count: null == items_count
          ? _value.items_count
          : items_count // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      permanent_id: null == permanent_id
          ? _value.permanent_id
          : permanent_id // ignore: cast_nullable_to_non_nullable
              as int,
      profile_image_url: null == profile_image_url
          ? _value.profile_image_url
          : profile_image_url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QiitaUser with DiagnosticableTreeMixin implements _QiitaUser {
  const _$_QiitaUser(
      {required this.description,
      required this.followees_count,
      required this.followers_count,
      required this.id,
      required this.items_count,
      required this.name,
      required this.permanent_id,
      required this.profile_image_url});

  factory _$_QiitaUser.fromJson(Map<String, dynamic> json) =>
      _$$_QiitaUserFromJson(json);

  @override
  final String description;
  @override
  final int followees_count;
  @override
  final int followers_count;
  @override
  final String id;
  @override
  final int items_count;
  @override
  final String name;
  @override
  final int permanent_id;
  @override
  final String profile_image_url;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QiitaUser(description: $description, followees_count: $followees_count, followers_count: $followers_count, id: $id, items_count: $items_count, name: $name, permanent_id: $permanent_id, profile_image_url: $profile_image_url)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QiitaUser'))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('followees_count', followees_count))
      ..add(DiagnosticsProperty('followers_count', followers_count))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('items_count', items_count))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('permanent_id', permanent_id))
      ..add(DiagnosticsProperty('profile_image_url', profile_image_url));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QiitaUser &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.followees_count, followees_count) ||
                other.followees_count == followees_count) &&
            (identical(other.followers_count, followers_count) ||
                other.followers_count == followers_count) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.items_count, items_count) ||
                other.items_count == items_count) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.permanent_id, permanent_id) ||
                other.permanent_id == permanent_id) &&
            (identical(other.profile_image_url, profile_image_url) ||
                other.profile_image_url == profile_image_url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, description, followees_count,
      followers_count, id, items_count, name, permanent_id, profile_image_url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QiitaUserCopyWith<_$_QiitaUser> get copyWith =>
      __$$_QiitaUserCopyWithImpl<_$_QiitaUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QiitaUserToJson(
      this,
    );
  }
}

abstract class _QiitaUser implements QiitaUser {
  const factory _QiitaUser(
      {required final String description,
      required final int followees_count,
      required final int followers_count,
      required final String id,
      required final int items_count,
      required final String name,
      required final int permanent_id,
      required final String profile_image_url}) = _$_QiitaUser;

  factory _QiitaUser.fromJson(Map<String, dynamic> json) =
      _$_QiitaUser.fromJson;

  @override
  String get description;
  @override
  int get followees_count;
  @override
  int get followers_count;
  @override
  String get id;
  @override
  int get items_count;
  @override
  String get name;
  @override
  int get permanent_id;
  @override
  String get profile_image_url;
  @override
  @JsonKey(ignore: true)
  _$$_QiitaUserCopyWith<_$_QiitaUser> get copyWith =>
      throw _privateConstructorUsedError;
}
