// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'steam_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SteamApi _$SteamApiFromJson(Map<String, dynamic> json) {
  return _SteamApi.fromJson(json);
}

/// @nodoc
mixin _$SteamApi {
  String get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SteamApiCopyWith<SteamApi> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SteamApiCopyWith<$Res> {
  factory $SteamApiCopyWith(SteamApi value, $Res Function(SteamApi) then) =
      _$SteamApiCopyWithImpl<$Res, SteamApi>;
  @useResult
  $Res call({String title, String url, String contents});
}

/// @nodoc
class _$SteamApiCopyWithImpl<$Res, $Val extends SteamApi>
    implements $SteamApiCopyWith<$Res> {
  _$SteamApiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? url = null,
    Object? contents = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SteamApiCopyWith<$Res> implements $SteamApiCopyWith<$Res> {
  factory _$$_SteamApiCopyWith(
          _$_SteamApi value, $Res Function(_$_SteamApi) then) =
      __$$_SteamApiCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String url, String contents});
}

/// @nodoc
class __$$_SteamApiCopyWithImpl<$Res>
    extends _$SteamApiCopyWithImpl<$Res, _$_SteamApi>
    implements _$$_SteamApiCopyWith<$Res> {
  __$$_SteamApiCopyWithImpl(
      _$_SteamApi _value, $Res Function(_$_SteamApi) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? url = null,
    Object? contents = null,
  }) {
    return _then(_$_SteamApi(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SteamApi with DiagnosticableTreeMixin implements _SteamApi {
  const _$_SteamApi(
      {required this.title, required this.url, required this.contents});

  factory _$_SteamApi.fromJson(Map<String, dynamic> json) =>
      _$$_SteamApiFromJson(json);

  @override
  final String title;
  @override
  final String url;
  @override
  final String contents;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SteamApi(title: $title, url: $url, contents: $contents)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SteamApi'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('contents', contents));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SteamApi &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.contents, contents) ||
                other.contents == contents));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, url, contents);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SteamApiCopyWith<_$_SteamApi> get copyWith =>
      __$$_SteamApiCopyWithImpl<_$_SteamApi>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SteamApiToJson(
      this,
    );
  }
}

abstract class _SteamApi implements SteamApi {
  const factory _SteamApi(
      {required final String title,
      required final String url,
      required final String contents}) = _$_SteamApi;

  factory _SteamApi.fromJson(Map<String, dynamic> json) = _$_SteamApi.fromJson;

  @override
  String get title;
  @override
  String get url;
  @override
  String get contents;
  @override
  @JsonKey(ignore: true)
  _$$_SteamApiCopyWith<_$_SteamApi> get copyWith =>
      throw _privateConstructorUsedError;
}
