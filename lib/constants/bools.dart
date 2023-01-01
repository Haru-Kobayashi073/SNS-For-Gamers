import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sns_vol2/domain/comment/comment.dart';
import 'package:sns_vol2/domain/reply/reply.dart';

bool isValidUser(
        {required List<String> muteUids, required Map<String, dynamic> map}) =>
    !muteUids.contains(map['uid']);

bool isValidPost(
        {required List<String> mutePostIds,
        required Map<String, dynamic> map}) =>
    !mutePostIds.contains(map["postId"]);

bool isValidComment(
        {required List<String> muteCommentIds, required Comment comment}) =>
    !muteCommentIds.contains(comment.postCommentId);

//ミュートしているreplyIdたちにReplyのidが含まれていなければ正しいリプライ
bool isValidReply({required List<String> muteReplyIds, required Reply reply}) =>
    !muteReplyIds.contains(reply.postCommentReplyId);
