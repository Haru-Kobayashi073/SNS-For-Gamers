// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reply.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Reply _$ReplyFromJson(Map<String, dynamic> json) {
  return _Reply.fromJson(json);
}

/// @nodoc
mixin _$Reply {
  dynamic get createdAt => throw _privateConstructorUsedError;
  dynamic get updatedAt =>
      throw _privateConstructorUsedError; //Freezedではパッケージの型が使えない＝FirestoreのTimestampなど。
//dynamicで代用するが、エラーを吐いてくれない型だから、特殊な場面以外は非推奨
  String get reply => throw _privateConstructorUsedError;
  String get replyLanguageCode => throw _privateConstructorUsedError;
  double get replyNegativeScore => throw _privateConstructorUsedError;
  double get replyPositiveScore => throw _privateConstructorUsedError;
  String get replySentiment => throw _privateConstructorUsedError;
  dynamic get postRef => throw _privateConstructorUsedError;
  dynamic get postCommentRef => throw _privateConstructorUsedError;
  String get postCommentReplyId => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;
  int get reportCount => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get userNameLanguageCode => throw _privateConstructorUsedError;
  double get userNameNegativeScore => throw _privateConstructorUsedError;
  double get userNamePositiveScore => throw _privateConstructorUsedError;
  String get userNameSentiment => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get userImageURL => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReplyCopyWith<Reply> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReplyCopyWith<$Res> {
  factory $ReplyCopyWith(Reply value, $Res Function(Reply) then) =
      _$ReplyCopyWithImpl<$Res, Reply>;
  @useResult
  $Res call(
      {dynamic createdAt,
      dynamic updatedAt,
      String reply,
      String replyLanguageCode,
      double replyNegativeScore,
      double replyPositiveScore,
      String replySentiment,
      dynamic postRef,
      dynamic postCommentRef,
      String postCommentReplyId,
      int likeCount,
      int reportCount,
      String userName,
      String userNameLanguageCode,
      double userNameNegativeScore,
      double userNamePositiveScore,
      String userNameSentiment,
      String uid,
      String userImageURL});
}

/// @nodoc
class _$ReplyCopyWithImpl<$Res, $Val extends Reply>
    implements $ReplyCopyWith<$Res> {
  _$ReplyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? reply = null,
    Object? replyLanguageCode = null,
    Object? replyNegativeScore = null,
    Object? replyPositiveScore = null,
    Object? replySentiment = null,
    Object? postRef = freezed,
    Object? postCommentRef = freezed,
    Object? postCommentReplyId = null,
    Object? likeCount = null,
    Object? reportCount = null,
    Object? userName = null,
    Object? userNameLanguageCode = null,
    Object? userNameNegativeScore = null,
    Object? userNamePositiveScore = null,
    Object? userNameSentiment = null,
    Object? uid = null,
    Object? userImageURL = null,
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
      reply: null == reply
          ? _value.reply
          : reply // ignore: cast_nullable_to_non_nullable
              as String,
      replyLanguageCode: null == replyLanguageCode
          ? _value.replyLanguageCode
          : replyLanguageCode // ignore: cast_nullable_to_non_nullable
              as String,
      replyNegativeScore: null == replyNegativeScore
          ? _value.replyNegativeScore
          : replyNegativeScore // ignore: cast_nullable_to_non_nullable
              as double,
      replyPositiveScore: null == replyPositiveScore
          ? _value.replyPositiveScore
          : replyPositiveScore // ignore: cast_nullable_to_non_nullable
              as double,
      replySentiment: null == replySentiment
          ? _value.replySentiment
          : replySentiment // ignore: cast_nullable_to_non_nullable
              as String,
      postRef: freezed == postRef
          ? _value.postRef
          : postRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postCommentRef: freezed == postCommentRef
          ? _value.postCommentRef
          : postCommentRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postCommentReplyId: null == postCommentReplyId
          ? _value.postCommentReplyId
          : postCommentReplyId // ignore: cast_nullable_to_non_nullable
              as String,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      reportCount: null == reportCount
          ? _value.reportCount
          : reportCount // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userNameLanguageCode: null == userNameLanguageCode
          ? _value.userNameLanguageCode
          : userNameLanguageCode // ignore: cast_nullable_to_non_nullable
              as String,
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
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      userImageURL: null == userImageURL
          ? _value.userImageURL
          : userImageURL // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReplyCopyWith<$Res> implements $ReplyCopyWith<$Res> {
  factory _$$_ReplyCopyWith(_$_Reply value, $Res Function(_$_Reply) then) =
      __$$_ReplyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic createdAt,
      dynamic updatedAt,
      String reply,
      String replyLanguageCode,
      double replyNegativeScore,
      double replyPositiveScore,
      String replySentiment,
      dynamic postRef,
      dynamic postCommentRef,
      String postCommentReplyId,
      int likeCount,
      int reportCount,
      String userName,
      String userNameLanguageCode,
      double userNameNegativeScore,
      double userNamePositiveScore,
      String userNameSentiment,
      String uid,
      String userImageURL});
}

/// @nodoc
class __$$_ReplyCopyWithImpl<$Res> extends _$ReplyCopyWithImpl<$Res, _$_Reply>
    implements _$$_ReplyCopyWith<$Res> {
  __$$_ReplyCopyWithImpl(_$_Reply _value, $Res Function(_$_Reply) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? reply = null,
    Object? replyLanguageCode = null,
    Object? replyNegativeScore = null,
    Object? replyPositiveScore = null,
    Object? replySentiment = null,
    Object? postRef = freezed,
    Object? postCommentRef = freezed,
    Object? postCommentReplyId = null,
    Object? likeCount = null,
    Object? reportCount = null,
    Object? userName = null,
    Object? userNameLanguageCode = null,
    Object? userNameNegativeScore = null,
    Object? userNamePositiveScore = null,
    Object? userNameSentiment = null,
    Object? uid = null,
    Object? userImageURL = null,
  }) {
    return _then(_$_Reply(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      reply: null == reply
          ? _value.reply
          : reply // ignore: cast_nullable_to_non_nullable
              as String,
      replyLanguageCode: null == replyLanguageCode
          ? _value.replyLanguageCode
          : replyLanguageCode // ignore: cast_nullable_to_non_nullable
              as String,
      replyNegativeScore: null == replyNegativeScore
          ? _value.replyNegativeScore
          : replyNegativeScore // ignore: cast_nullable_to_non_nullable
              as double,
      replyPositiveScore: null == replyPositiveScore
          ? _value.replyPositiveScore
          : replyPositiveScore // ignore: cast_nullable_to_non_nullable
              as double,
      replySentiment: null == replySentiment
          ? _value.replySentiment
          : replySentiment // ignore: cast_nullable_to_non_nullable
              as String,
      postRef: freezed == postRef
          ? _value.postRef
          : postRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postCommentRef: freezed == postCommentRef
          ? _value.postCommentRef
          : postCommentRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postCommentReplyId: null == postCommentReplyId
          ? _value.postCommentReplyId
          : postCommentReplyId // ignore: cast_nullable_to_non_nullable
              as String,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      reportCount: null == reportCount
          ? _value.reportCount
          : reportCount // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userNameLanguageCode: null == userNameLanguageCode
          ? _value.userNameLanguageCode
          : userNameLanguageCode // ignore: cast_nullable_to_non_nullable
              as String,
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
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      userImageURL: null == userImageURL
          ? _value.userImageURL
          : userImageURL // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Reply with DiagnosticableTreeMixin implements _Reply {
  const _$_Reply(
      {required this.createdAt,
      required this.updatedAt,
      required this.reply,
      required this.replyLanguageCode,
      required this.replyNegativeScore,
      required this.replyPositiveScore,
      required this.replySentiment,
      required this.postRef,
      required this.postCommentRef,
      required this.postCommentReplyId,
      required this.likeCount,
      required this.reportCount,
      required this.userName,
      required this.userNameLanguageCode,
      required this.userNameNegativeScore,
      required this.userNamePositiveScore,
      required this.userNameSentiment,
      required this.uid,
      required this.userImageURL});

  factory _$_Reply.fromJson(Map<String, dynamic> json) =>
      _$$_ReplyFromJson(json);

  @override
  final dynamic createdAt;
  @override
  final dynamic updatedAt;
//Freezedではパッケージの型が使えない＝FirestoreのTimestampなど。
//dynamicで代用するが、エラーを吐いてくれない型だから、特殊な場面以外は非推奨
  @override
  final String reply;
  @override
  final String replyLanguageCode;
  @override
  final double replyNegativeScore;
  @override
  final double replyPositiveScore;
  @override
  final String replySentiment;
  @override
  final dynamic postRef;
  @override
  final dynamic postCommentRef;
  @override
  final String postCommentReplyId;
  @override
  final int likeCount;
  @override
  final int reportCount;
  @override
  final String userName;
  @override
  final String userNameLanguageCode;
  @override
  final double userNameNegativeScore;
  @override
  final double userNamePositiveScore;
  @override
  final String userNameSentiment;
  @override
  final String uid;
  @override
  final String userImageURL;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Reply(createdAt: $createdAt, updatedAt: $updatedAt, reply: $reply, replyLanguageCode: $replyLanguageCode, replyNegativeScore: $replyNegativeScore, replyPositiveScore: $replyPositiveScore, replySentiment: $replySentiment, postRef: $postRef, postCommentRef: $postCommentRef, postCommentReplyId: $postCommentReplyId, likeCount: $likeCount, reportCount: $reportCount, userName: $userName, userNameLanguageCode: $userNameLanguageCode, userNameNegativeScore: $userNameNegativeScore, userNamePositiveScore: $userNamePositiveScore, userNameSentiment: $userNameSentiment, uid: $uid, userImageURL: $userImageURL)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Reply'))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('reply', reply))
      ..add(DiagnosticsProperty('replyLanguageCode', replyLanguageCode))
      ..add(DiagnosticsProperty('replyNegativeScore', replyNegativeScore))
      ..add(DiagnosticsProperty('replyPositiveScore', replyPositiveScore))
      ..add(DiagnosticsProperty('replySentiment', replySentiment))
      ..add(DiagnosticsProperty('postRef', postRef))
      ..add(DiagnosticsProperty('postCommentRef', postCommentRef))
      ..add(DiagnosticsProperty('postCommentReplyId', postCommentReplyId))
      ..add(DiagnosticsProperty('likeCount', likeCount))
      ..add(DiagnosticsProperty('reportCount', reportCount))
      ..add(DiagnosticsProperty('userName', userName))
      ..add(DiagnosticsProperty('userNameLanguageCode', userNameLanguageCode))
      ..add(DiagnosticsProperty('userNameNegativeScore', userNameNegativeScore))
      ..add(DiagnosticsProperty('userNamePositiveScore', userNamePositiveScore))
      ..add(DiagnosticsProperty('userNameSentiment', userNameSentiment))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('userImageURL', userImageURL));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Reply &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            (identical(other.reply, reply) || other.reply == reply) &&
            (identical(other.replyLanguageCode, replyLanguageCode) ||
                other.replyLanguageCode == replyLanguageCode) &&
            (identical(other.replyNegativeScore, replyNegativeScore) ||
                other.replyNegativeScore == replyNegativeScore) &&
            (identical(other.replyPositiveScore, replyPositiveScore) ||
                other.replyPositiveScore == replyPositiveScore) &&
            (identical(other.replySentiment, replySentiment) ||
                other.replySentiment == replySentiment) &&
            const DeepCollectionEquality().equals(other.postRef, postRef) &&
            const DeepCollectionEquality()
                .equals(other.postCommentRef, postCommentRef) &&
            (identical(other.postCommentReplyId, postCommentReplyId) ||
                other.postCommentReplyId == postCommentReplyId) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.reportCount, reportCount) ||
                other.reportCount == reportCount) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userNameLanguageCode, userNameLanguageCode) ||
                other.userNameLanguageCode == userNameLanguageCode) &&
            (identical(other.userNameNegativeScore, userNameNegativeScore) ||
                other.userNameNegativeScore == userNameNegativeScore) &&
            (identical(other.userNamePositiveScore, userNamePositiveScore) ||
                other.userNamePositiveScore == userNamePositiveScore) &&
            (identical(other.userNameSentiment, userNameSentiment) ||
                other.userNameSentiment == userNameSentiment) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.userImageURL, userImageURL) ||
                other.userImageURL == userImageURL));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(createdAt),
        const DeepCollectionEquality().hash(updatedAt),
        reply,
        replyLanguageCode,
        replyNegativeScore,
        replyPositiveScore,
        replySentiment,
        const DeepCollectionEquality().hash(postRef),
        const DeepCollectionEquality().hash(postCommentRef),
        postCommentReplyId,
        likeCount,
        reportCount,
        userName,
        userNameLanguageCode,
        userNameNegativeScore,
        userNamePositiveScore,
        userNameSentiment,
        uid,
        userImageURL
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReplyCopyWith<_$_Reply> get copyWith =>
      __$$_ReplyCopyWithImpl<_$_Reply>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReplyToJson(
      this,
    );
  }
}

abstract class _Reply implements Reply {
  const factory _Reply(
      {required final dynamic createdAt,
      required final dynamic updatedAt,
      required final String reply,
      required final String replyLanguageCode,
      required final double replyNegativeScore,
      required final double replyPositiveScore,
      required final String replySentiment,
      required final dynamic postRef,
      required final dynamic postCommentRef,
      required final String postCommentReplyId,
      required final int likeCount,
      required final int reportCount,
      required final String userName,
      required final String userNameLanguageCode,
      required final double userNameNegativeScore,
      required final double userNamePositiveScore,
      required final String userNameSentiment,
      required final String uid,
      required final String userImageURL}) = _$_Reply;

  factory _Reply.fromJson(Map<String, dynamic> json) = _$_Reply.fromJson;

  @override
  dynamic get createdAt;
  @override
  dynamic get updatedAt;
  @override //Freezedではパッケージの型が使えない＝FirestoreのTimestampなど。
//dynamicで代用するが、エラーを吐いてくれない型だから、特殊な場面以外は非推奨
  String get reply;
  @override
  String get replyLanguageCode;
  @override
  double get replyNegativeScore;
  @override
  double get replyPositiveScore;
  @override
  String get replySentiment;
  @override
  dynamic get postRef;
  @override
  dynamic get postCommentRef;
  @override
  String get postCommentReplyId;
  @override
  int get likeCount;
  @override
  int get reportCount;
  @override
  String get userName;
  @override
  String get userNameLanguageCode;
  @override
  double get userNameNegativeScore;
  @override
  double get userNamePositiveScore;
  @override
  String get userNameSentiment;
  @override
  String get uid;
  @override
  String get userImageURL;
  @override
  @JsonKey(ignore: true)
  _$$_ReplyCopyWith<_$_Reply> get copyWith =>
      throw _privateConstructorUsedError;
}
