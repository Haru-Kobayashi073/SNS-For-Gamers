// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_comment_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostCommentReport _$PostCommentReportFromJson(Map<String, dynamic> json) {
  return _PostCommentReport.fromJson(json);
}

/// @nodoc
mixin _$PostCommentReport {
  String get activeUid => throw _privateConstructorUsedError;
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get others => throw _privateConstructorUsedError; //その他の報告内容
  String get reportContent => throw _privateConstructorUsedError; //メインの報告内容
  String get postCommentCreatorUid => throw _privateConstructorUsedError;
  String get passiveUserName => throw _privateConstructorUsedError;
  dynamic get postCommentDocRef => throw _privateConstructorUsedError;
  String get postCommentId => throw _privateConstructorUsedError;
  String get postcommentReportId => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  String get commentTextLanguageCode => throw _privateConstructorUsedError;
  double get commentTextNegativeScore => throw _privateConstructorUsedError;
  double get commentTextPositiveScore => throw _privateConstructorUsedError;
  String get commentTextSentiment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCommentReportCopyWith<PostCommentReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCommentReportCopyWith<$Res> {
  factory $PostCommentReportCopyWith(
          PostCommentReport value, $Res Function(PostCommentReport) then) =
      _$PostCommentReportCopyWithImpl<$Res, PostCommentReport>;
  @useResult
  $Res call(
      {String activeUid,
      dynamic createdAt,
      String others,
      String reportContent,
      String postCommentCreatorUid,
      String passiveUserName,
      dynamic postCommentDocRef,
      String postCommentId,
      String postcommentReportId,
      String comment,
      String commentTextLanguageCode,
      double commentTextNegativeScore,
      double commentTextPositiveScore,
      String commentTextSentiment});
}

/// @nodoc
class _$PostCommentReportCopyWithImpl<$Res, $Val extends PostCommentReport>
    implements $PostCommentReportCopyWith<$Res> {
  _$PostCommentReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? createdAt = freezed,
    Object? others = null,
    Object? reportContent = null,
    Object? postCommentCreatorUid = null,
    Object? passiveUserName = null,
    Object? postCommentDocRef = freezed,
    Object? postCommentId = null,
    Object? postcommentReportId = null,
    Object? comment = null,
    Object? commentTextLanguageCode = null,
    Object? commentTextNegativeScore = null,
    Object? commentTextPositiveScore = null,
    Object? commentTextSentiment = null,
  }) {
    return _then(_value.copyWith(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      others: null == others
          ? _value.others
          : others // ignore: cast_nullable_to_non_nullable
              as String,
      reportContent: null == reportContent
          ? _value.reportContent
          : reportContent // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentCreatorUid: null == postCommentCreatorUid
          ? _value.postCommentCreatorUid
          : postCommentCreatorUid // ignore: cast_nullable_to_non_nullable
              as String,
      passiveUserName: null == passiveUserName
          ? _value.passiveUserName
          : passiveUserName // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentDocRef: freezed == postCommentDocRef
          ? _value.postCommentDocRef
          : postCommentDocRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postCommentId: null == postCommentId
          ? _value.postCommentId
          : postCommentId // ignore: cast_nullable_to_non_nullable
              as String,
      postcommentReportId: null == postcommentReportId
          ? _value.postcommentReportId
          : postcommentReportId // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      commentTextLanguageCode: null == commentTextLanguageCode
          ? _value.commentTextLanguageCode
          : commentTextLanguageCode // ignore: cast_nullable_to_non_nullable
              as String,
      commentTextNegativeScore: null == commentTextNegativeScore
          ? _value.commentTextNegativeScore
          : commentTextNegativeScore // ignore: cast_nullable_to_non_nullable
              as double,
      commentTextPositiveScore: null == commentTextPositiveScore
          ? _value.commentTextPositiveScore
          : commentTextPositiveScore // ignore: cast_nullable_to_non_nullable
              as double,
      commentTextSentiment: null == commentTextSentiment
          ? _value.commentTextSentiment
          : commentTextSentiment // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostCommentReportCopyWith<$Res>
    implements $PostCommentReportCopyWith<$Res> {
  factory _$$_PostCommentReportCopyWith(_$_PostCommentReport value,
          $Res Function(_$_PostCommentReport) then) =
      __$$_PostCommentReportCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String activeUid,
      dynamic createdAt,
      String others,
      String reportContent,
      String postCommentCreatorUid,
      String passiveUserName,
      dynamic postCommentDocRef,
      String postCommentId,
      String postcommentReportId,
      String comment,
      String commentTextLanguageCode,
      double commentTextNegativeScore,
      double commentTextPositiveScore,
      String commentTextSentiment});
}

/// @nodoc
class __$$_PostCommentReportCopyWithImpl<$Res>
    extends _$PostCommentReportCopyWithImpl<$Res, _$_PostCommentReport>
    implements _$$_PostCommentReportCopyWith<$Res> {
  __$$_PostCommentReportCopyWithImpl(
      _$_PostCommentReport _value, $Res Function(_$_PostCommentReport) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? createdAt = freezed,
    Object? others = null,
    Object? reportContent = null,
    Object? postCommentCreatorUid = null,
    Object? passiveUserName = null,
    Object? postCommentDocRef = freezed,
    Object? postCommentId = null,
    Object? postcommentReportId = null,
    Object? comment = null,
    Object? commentTextLanguageCode = null,
    Object? commentTextNegativeScore = null,
    Object? commentTextPositiveScore = null,
    Object? commentTextSentiment = null,
  }) {
    return _then(_$_PostCommentReport(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      others: null == others
          ? _value.others
          : others // ignore: cast_nullable_to_non_nullable
              as String,
      reportContent: null == reportContent
          ? _value.reportContent
          : reportContent // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentCreatorUid: null == postCommentCreatorUid
          ? _value.postCommentCreatorUid
          : postCommentCreatorUid // ignore: cast_nullable_to_non_nullable
              as String,
      passiveUserName: null == passiveUserName
          ? _value.passiveUserName
          : passiveUserName // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentDocRef: freezed == postCommentDocRef
          ? _value.postCommentDocRef
          : postCommentDocRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postCommentId: null == postCommentId
          ? _value.postCommentId
          : postCommentId // ignore: cast_nullable_to_non_nullable
              as String,
      postcommentReportId: null == postcommentReportId
          ? _value.postcommentReportId
          : postcommentReportId // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      commentTextLanguageCode: null == commentTextLanguageCode
          ? _value.commentTextLanguageCode
          : commentTextLanguageCode // ignore: cast_nullable_to_non_nullable
              as String,
      commentTextNegativeScore: null == commentTextNegativeScore
          ? _value.commentTextNegativeScore
          : commentTextNegativeScore // ignore: cast_nullable_to_non_nullable
              as double,
      commentTextPositiveScore: null == commentTextPositiveScore
          ? _value.commentTextPositiveScore
          : commentTextPositiveScore // ignore: cast_nullable_to_non_nullable
              as double,
      commentTextSentiment: null == commentTextSentiment
          ? _value.commentTextSentiment
          : commentTextSentiment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostCommentReport
    with DiagnosticableTreeMixin
    implements _PostCommentReport {
  const _$_PostCommentReport(
      {required this.activeUid,
      required this.createdAt,
      required this.others,
      required this.reportContent,
      required this.postCommentCreatorUid,
      required this.passiveUserName,
      required this.postCommentDocRef,
      required this.postCommentId,
      required this.postcommentReportId,
      required this.comment,
      required this.commentTextLanguageCode,
      required this.commentTextNegativeScore,
      required this.commentTextPositiveScore,
      required this.commentTextSentiment});

  factory _$_PostCommentReport.fromJson(Map<String, dynamic> json) =>
      _$$_PostCommentReportFromJson(json);

  @override
  final String activeUid;
  @override
  final dynamic createdAt;
  @override
  final String others;
//その他の報告内容
  @override
  final String reportContent;
//メインの報告内容
  @override
  final String postCommentCreatorUid;
  @override
  final String passiveUserName;
  @override
  final dynamic postCommentDocRef;
  @override
  final String postCommentId;
  @override
  final String postcommentReportId;
  @override
  final String comment;
  @override
  final String commentTextLanguageCode;
  @override
  final double commentTextNegativeScore;
  @override
  final double commentTextPositiveScore;
  @override
  final String commentTextSentiment;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PostCommentReport(activeUid: $activeUid, createdAt: $createdAt, others: $others, reportContent: $reportContent, postCommentCreatorUid: $postCommentCreatorUid, passiveUserName: $passiveUserName, postCommentDocRef: $postCommentDocRef, postCommentId: $postCommentId, postcommentReportId: $postcommentReportId, comment: $comment, commentTextLanguageCode: $commentTextLanguageCode, commentTextNegativeScore: $commentTextNegativeScore, commentTextPositiveScore: $commentTextPositiveScore, commentTextSentiment: $commentTextSentiment)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PostCommentReport'))
      ..add(DiagnosticsProperty('activeUid', activeUid))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('others', others))
      ..add(DiagnosticsProperty('reportContent', reportContent))
      ..add(DiagnosticsProperty('postCommentCreatorUid', postCommentCreatorUid))
      ..add(DiagnosticsProperty('passiveUserName', passiveUserName))
      ..add(DiagnosticsProperty('postCommentDocRef', postCommentDocRef))
      ..add(DiagnosticsProperty('postCommentId', postCommentId))
      ..add(DiagnosticsProperty('postcommentReportId', postcommentReportId))
      ..add(DiagnosticsProperty('comment', comment))
      ..add(DiagnosticsProperty(
          'commentTextLanguageCode', commentTextLanguageCode))
      ..add(DiagnosticsProperty(
          'commentTextNegativeScore', commentTextNegativeScore))
      ..add(DiagnosticsProperty(
          'commentTextPositiveScore', commentTextPositiveScore))
      ..add(DiagnosticsProperty('commentTextSentiment', commentTextSentiment));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostCommentReport &&
            (identical(other.activeUid, activeUid) ||
                other.activeUid == activeUid) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.others, others) || other.others == others) &&
            (identical(other.reportContent, reportContent) ||
                other.reportContent == reportContent) &&
            (identical(other.postCommentCreatorUid, postCommentCreatorUid) ||
                other.postCommentCreatorUid == postCommentCreatorUid) &&
            (identical(other.passiveUserName, passiveUserName) ||
                other.passiveUserName == passiveUserName) &&
            const DeepCollectionEquality()
                .equals(other.postCommentDocRef, postCommentDocRef) &&
            (identical(other.postCommentId, postCommentId) ||
                other.postCommentId == postCommentId) &&
            (identical(other.postcommentReportId, postcommentReportId) ||
                other.postcommentReportId == postcommentReportId) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(
                    other.commentTextLanguageCode, commentTextLanguageCode) ||
                other.commentTextLanguageCode == commentTextLanguageCode) &&
            (identical(
                    other.commentTextNegativeScore, commentTextNegativeScore) ||
                other.commentTextNegativeScore == commentTextNegativeScore) &&
            (identical(
                    other.commentTextPositiveScore, commentTextPositiveScore) ||
                other.commentTextPositiveScore == commentTextPositiveScore) &&
            (identical(other.commentTextSentiment, commentTextSentiment) ||
                other.commentTextSentiment == commentTextSentiment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      activeUid,
      const DeepCollectionEquality().hash(createdAt),
      others,
      reportContent,
      postCommentCreatorUid,
      passiveUserName,
      const DeepCollectionEquality().hash(postCommentDocRef),
      postCommentId,
      postcommentReportId,
      comment,
      commentTextLanguageCode,
      commentTextNegativeScore,
      commentTextPositiveScore,
      commentTextSentiment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostCommentReportCopyWith<_$_PostCommentReport> get copyWith =>
      __$$_PostCommentReportCopyWithImpl<_$_PostCommentReport>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostCommentReportToJson(
      this,
    );
  }
}

abstract class _PostCommentReport implements PostCommentReport {
  const factory _PostCommentReport(
      {required final String activeUid,
      required final dynamic createdAt,
      required final String others,
      required final String reportContent,
      required final String postCommentCreatorUid,
      required final String passiveUserName,
      required final dynamic postCommentDocRef,
      required final String postCommentId,
      required final String postcommentReportId,
      required final String comment,
      required final String commentTextLanguageCode,
      required final double commentTextNegativeScore,
      required final double commentTextPositiveScore,
      required final String commentTextSentiment}) = _$_PostCommentReport;

  factory _PostCommentReport.fromJson(Map<String, dynamic> json) =
      _$_PostCommentReport.fromJson;

  @override
  String get activeUid;
  @override
  dynamic get createdAt;
  @override
  String get others;
  @override //その他の報告内容
  String get reportContent;
  @override //メインの報告内容
  String get postCommentCreatorUid;
  @override
  String get passiveUserName;
  @override
  dynamic get postCommentDocRef;
  @override
  String get postCommentId;
  @override
  String get postcommentReportId;
  @override
  String get comment;
  @override
  String get commentTextLanguageCode;
  @override
  double get commentTextNegativeScore;
  @override
  double get commentTextPositiveScore;
  @override
  String get commentTextSentiment;
  @override
  @JsonKey(ignore: true)
  _$$_PostCommentReportCopyWith<_$_PostCommentReport> get copyWith =>
      throw _privateConstructorUsedError;
}
