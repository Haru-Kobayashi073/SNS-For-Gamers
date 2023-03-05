// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firestore_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FirestoreUser _$FirestoreUserFromJson(Map<String, dynamic> json) {
  return _FirestoreUser.fromJson(json);
}

/// @nodoc
mixin _$FirestoreUser {
  dynamic get createdAt => throw _privateConstructorUsedError;
  dynamic get updatedAt =>
      throw _privateConstructorUsedError; //Freezedではパッケージの型が使えない＝FirestoreのTimestampなど。
//dynamicで代用するが、エラーを吐いてくれない型だから、特殊な場面以外は非推奨
  int get followerCount => throw _privateConstructorUsedError;
  int get followingCount => throw _privateConstructorUsedError;
  int get muteCount => throw _privateConstructorUsedError;
  int get postCount => throw _privateConstructorUsedError;
  double get userNameNegativeScore => throw _privateConstructorUsedError;
  double get userNamePositiveScore => throw _privateConstructorUsedError;
  String get userNameSentiment => throw _privateConstructorUsedError;
  String get userNameLanguageCode => throw _privateConstructorUsedError;
  String get introduction => throw _privateConstructorUsedError;
  bool get isAdmin => throw _privateConstructorUsedError;
  Map<String, dynamic> get searchToken => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get userImageURL => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirestoreUserCopyWith<FirestoreUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirestoreUserCopyWith<$Res> {
  factory $FirestoreUserCopyWith(
          FirestoreUser value, $Res Function(FirestoreUser) then) =
      _$FirestoreUserCopyWithImpl<$Res, FirestoreUser>;
  @useResult
  $Res call(
      {dynamic createdAt,
      dynamic updatedAt,
      int followerCount,
      int followingCount,
      int muteCount,
      int postCount,
      double userNameNegativeScore,
      double userNamePositiveScore,
      String userNameSentiment,
      String userNameLanguageCode,
      String introduction,
      bool isAdmin,
      Map<String, dynamic> searchToken,
      String userName,
      String userImageURL,
      String uid});
}

/// @nodoc
class _$FirestoreUserCopyWithImpl<$Res, $Val extends FirestoreUser>
    implements $FirestoreUserCopyWith<$Res> {
  _$FirestoreUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? followerCount = null,
    Object? followingCount = null,
    Object? muteCount = null,
    Object? postCount = null,
    Object? userNameNegativeScore = null,
    Object? userNamePositiveScore = null,
    Object? userNameSentiment = null,
    Object? userNameLanguageCode = null,
    Object? introduction = null,
    Object? isAdmin = null,
    Object? searchToken = null,
    Object? userName = null,
    Object? userImageURL = null,
    Object? uid = null,
  }) {
    return _then(_value.copyWith(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      followerCount: null == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingCount: null == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      muteCount: null == muteCount
          ? _value.muteCount
          : muteCount // ignore: cast_nullable_to_non_nullable
              as int,
      postCount: null == postCount
          ? _value.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as int,
      userNameNegativeScore: null == userNameNegativeScore
          ? _value.userNameNegativeScore
          : userNameNegativeScore // ignore: cast_nullable_to_non_nullable
              as double,
      userNamePositiveScore: null == userNamePositiveScore
          ? _value.userNamePositiveScore
          : userNamePositiveScore // ignore: cast_nullable_to_non_nullable
              as double,
      userNameSentiment: null == userNameSentiment
          ? _value.userNameSentiment
          : userNameSentiment // ignore: cast_nullable_to_non_nullable
              as String,
      userNameLanguageCode: null == userNameLanguageCode
          ? _value.userNameLanguageCode
          : userNameLanguageCode // ignore: cast_nullable_to_non_nullable
              as String,
      introduction: null == introduction
          ? _value.introduction
          : introduction // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      searchToken: null == searchToken
          ? _value.searchToken
          : searchToken // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userImageURL: null == userImageURL
          ? _value.userImageURL
          : userImageURL // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FirestoreUserCopyWith<$Res>
    implements $FirestoreUserCopyWith<$Res> {
  factory _$$_FirestoreUserCopyWith(
          _$_FirestoreUser value, $Res Function(_$_FirestoreUser) then) =
      __$$_FirestoreUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic createdAt,
      dynamic updatedAt,
      int followerCount,
      int followingCount,
      int muteCount,
      int postCount,
      double userNameNegativeScore,
      double userNamePositiveScore,
      String userNameSentiment,
      String userNameLanguageCode,
      String introduction,
      bool isAdmin,
      Map<String, dynamic> searchToken,
      String userName,
      String userImageURL,
      String uid});
}

/// @nodoc
class __$$_FirestoreUserCopyWithImpl<$Res>
    extends _$FirestoreUserCopyWithImpl<$Res, _$_FirestoreUser>
    implements _$$_FirestoreUserCopyWith<$Res> {
  __$$_FirestoreUserCopyWithImpl(
      _$_FirestoreUser _value, $Res Function(_$_FirestoreUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? followerCount = null,
    Object? followingCount = null,
    Object? muteCount = null,
    Object? postCount = null,
    Object? userNameNegativeScore = null,
    Object? userNamePositiveScore = null,
    Object? userNameSentiment = null,
    Object? userNameLanguageCode = null,
    Object? introduction = null,
    Object? isAdmin = null,
    Object? searchToken = null,
    Object? userName = null,
    Object? userImageURL = null,
    Object? uid = null,
  }) {
    return _then(_$_FirestoreUser(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      followerCount: null == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingCount: null == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      muteCount: null == muteCount
          ? _value.muteCount
          : muteCount // ignore: cast_nullable_to_non_nullable
              as int,
      postCount: null == postCount
          ? _value.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as int,
      userNameNegativeScore: null == userNameNegativeScore
          ? _value.userNameNegativeScore
          : userNameNegativeScore // ignore: cast_nullable_to_non_nullable
              as double,
      userNamePositiveScore: null == userNamePositiveScore
          ? _value.userNamePositiveScore
          : userNamePositiveScore // ignore: cast_nullable_to_non_nullable
              as double,
      userNameSentiment: null == userNameSentiment
          ? _value.userNameSentiment
          : userNameSentiment // ignore: cast_nullable_to_non_nullable
              as String,
      userNameLanguageCode: null == userNameLanguageCode
          ? _value.userNameLanguageCode
          : userNameLanguageCode // ignore: cast_nullable_to_non_nullable
              as String,
      introduction: null == introduction
          ? _value.introduction
          : introduction // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      searchToken: null == searchToken
          ? _value._searchToken
          : searchToken // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userImageURL: null == userImageURL
          ? _value.userImageURL
          : userImageURL // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FirestoreUser with DiagnosticableTreeMixin implements _FirestoreUser {
  const _$_FirestoreUser(
      {required this.createdAt,
      required this.updatedAt,
      required this.followerCount,
      required this.followingCount,
      required this.muteCount,
      required this.postCount,
      required this.userNameNegativeScore,
      required this.userNamePositiveScore,
      required this.userNameSentiment,
      required this.userNameLanguageCode,
      required this.introduction,
      required this.isAdmin,
      required final Map<String, dynamic> searchToken,
      required this.userName,
      required this.userImageURL,
      required this.uid})
      : _searchToken = searchToken;

  factory _$_FirestoreUser.fromJson(Map<String, dynamic> json) =>
      _$$_FirestoreUserFromJson(json);

  @override
  final dynamic createdAt;
  @override
  final dynamic updatedAt;
//Freezedではパッケージの型が使えない＝FirestoreのTimestampなど。
//dynamicで代用するが、エラーを吐いてくれない型だから、特殊な場面以外は非推奨
  @override
  final int followerCount;
  @override
  final int followingCount;
  @override
  final int muteCount;
  @override
  final int postCount;
  @override
  final double userNameNegativeScore;
  @override
  final double userNamePositiveScore;
  @override
  final String userNameSentiment;
  @override
  final String userNameLanguageCode;
  @override
  final String introduction;
  @override
  final bool isAdmin;
  final Map<String, dynamic> _searchToken;
  @override
  Map<String, dynamic> get searchToken {
    if (_searchToken is EqualUnmodifiableMapView) return _searchToken;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_searchToken);
  }

  @override
  final String userName;
  @override
  final String userImageURL;
  @override
  final String uid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FirestoreUser(createdAt: $createdAt, updatedAt: $updatedAt, followerCount: $followerCount, followingCount: $followingCount, muteCount: $muteCount, postCount: $postCount, userNameNegativeScore: $userNameNegativeScore, userNamePositiveScore: $userNamePositiveScore, userNameSentiment: $userNameSentiment, userNameLanguageCode: $userNameLanguageCode, introduction: $introduction, isAdmin: $isAdmin, searchToken: $searchToken, userName: $userName, userImageURL: $userImageURL, uid: $uid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FirestoreUser'))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('followerCount', followerCount))
      ..add(DiagnosticsProperty('followingCount', followingCount))
      ..add(DiagnosticsProperty('muteCount', muteCount))
      ..add(DiagnosticsProperty('postCount', postCount))
      ..add(DiagnosticsProperty('userNameNegativeScore', userNameNegativeScore))
      ..add(DiagnosticsProperty('userNamePositiveScore', userNamePositiveScore))
      ..add(DiagnosticsProperty('userNameSentiment', userNameSentiment))
      ..add(DiagnosticsProperty('userNameLanguageCode', userNameLanguageCode))
      ..add(DiagnosticsProperty('introduction', introduction))
      ..add(DiagnosticsProperty('isAdmin', isAdmin))
      ..add(DiagnosticsProperty('searchToken', searchToken))
      ..add(DiagnosticsProperty('userName', userName))
      ..add(DiagnosticsProperty('userImageURL', userImageURL))
      ..add(DiagnosticsProperty('uid', uid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FirestoreUser &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount) &&
            (identical(other.muteCount, muteCount) ||
                other.muteCount == muteCount) &&
            (identical(other.postCount, postCount) ||
                other.postCount == postCount) &&
            (identical(other.userNameNegativeScore, userNameNegativeScore) ||
                other.userNameNegativeScore == userNameNegativeScore) &&
            (identical(other.userNamePositiveScore, userNamePositiveScore) ||
                other.userNamePositiveScore == userNamePositiveScore) &&
            (identical(other.userNameSentiment, userNameSentiment) ||
                other.userNameSentiment == userNameSentiment) &&
            (identical(other.userNameLanguageCode, userNameLanguageCode) ||
                other.userNameLanguageCode == userNameLanguageCode) &&
            (identical(other.introduction, introduction) ||
                other.introduction == introduction) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin) &&
            const DeepCollectionEquality()
                .equals(other._searchToken, _searchToken) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userImageURL, userImageURL) ||
                other.userImageURL == userImageURL) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      followerCount,
      followingCount,
      muteCount,
      postCount,
      userNameNegativeScore,
      userNamePositiveScore,
      userNameSentiment,
      userNameLanguageCode,
      introduction,
      isAdmin,
      const DeepCollectionEquality().hash(_searchToken),
      userName,
      userImageURL,
      uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FirestoreUserCopyWith<_$_FirestoreUser> get copyWith =>
      __$$_FirestoreUserCopyWithImpl<_$_FirestoreUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FirestoreUserToJson(
      this,
    );
  }
}

abstract class _FirestoreUser implements FirestoreUser {
  const factory _FirestoreUser(
      {required final dynamic createdAt,
      required final dynamic updatedAt,
      required final int followerCount,
      required final int followingCount,
      required final int muteCount,
      required final int postCount,
      required final double userNameNegativeScore,
      required final double userNamePositiveScore,
      required final String userNameSentiment,
      required final String userNameLanguageCode,
      required final String introduction,
      required final bool isAdmin,
      required final Map<String, dynamic> searchToken,
      required final String userName,
      required final String userImageURL,
      required final String uid}) = _$_FirestoreUser;

  factory _FirestoreUser.fromJson(Map<String, dynamic> json) =
      _$_FirestoreUser.fromJson;

  @override
  dynamic get createdAt;
  @override
  dynamic get updatedAt;
  @override //Freezedではパッケージの型が使えない＝FirestoreのTimestampなど。
//dynamicで代用するが、エラーを吐いてくれない型だから、特殊な場面以外は非推奨
  int get followerCount;
  @override
  int get followingCount;
  @override
  int get muteCount;
  @override
  int get postCount;
  @override
  double get userNameNegativeScore;
  @override
  double get userNamePositiveScore;
  @override
  String get userNameSentiment;
  @override
  String get userNameLanguageCode;
  @override
  String get introduction;
  @override
  bool get isAdmin;
  @override
  Map<String, dynamic> get searchToken;
  @override
  String get userName;
  @override
  String get userImageURL;
  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$$_FirestoreUserCopyWith<_$_FirestoreUser> get copyWith =>
      throw _privateConstructorUsedError;
}
