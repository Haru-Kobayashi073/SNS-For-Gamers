import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sns_vol2/constants/enums.dart';
import 'package:sns_vol2/constants/others.dart';
import 'package:sns_vol2/domain/mute_post_token/mute_post_token.dart';
import 'package:sns_vol2/domain/mute_user_token/mute_user_token.dart';

Future<List<List<String>>> returnMuteUidsAndMutePostIds() async {
  // リストの１つ目の要素にmuteUids、２つ目にmute PostIdsを含める
  List<List<String>> result = [];
  //firebase auth のユーザーをリターンしている
  final User? user = returnAuthUser();
  final tokenQshot = await FirebaseFirestore.instance
      .collection('users')
      .doc(user!.uid)
      .collection('tokens')
      .get();
  final tokenDocs = tokenQshot.docs;
  //for文を回し、一回一回にnullをreturnして、toList;でListにしているつまり、List<null>
  //難しいけど正解
  final List<String> muteUids = tokenDocs
      .where((element) => element['tokenType'] == muteUserTokenTypeString)
      .map((e) => MuteUserToken.fromJson(e.data()).passiveUid)
      .toList();

  final List<String> mutePostIds = tokenDocs
      .where((element) => element['tokenType'] == mutePostTokenTypeString)
      .map((e) => MutePostToken.fromJson(e.data()).postId)
      .toList();

  //わかりやすい正解
  // List<String> muteUids = [];
  // for (final tokenDoc in tokenDocs) {
  //   if (tokenDoc['tokenType'] == muteUserTokenTypeString) {
  //     final MuteUserToken muteUserToken =
  //         MuteUserToken.fromJson(tokenDoc.data());
  //     muteUids.add(muteUserToken.passiveUid);
  //   }
  // }

  return [muteUids, mutePostIds];
}

List<String> returnSearchWords({required String searchTerm}) {
  //一文字ずつに分割
  List<String> afterSplit = searchTerm.split("");
  //firebaseで検索に使用できないフィールドを削除
  const List<String> notUseOnField = [".", "[", "]", "*", "`"];
  afterSplit.removeWhere((element) => notUseOnField.contains(element));
  String result = "";
  for (final String element in afterSplit) {
    final x = element.toLowerCase();
    result += x;
  }
  final int length = result.length;
  List<String> searchWords = [];
  const nGramIndex = 2;
  if (length < nGramIndex) {
    searchWords.add(result);
  } else {
    int termIndex = 0;
    for (int i = 0; i < length - nGramIndex + 1; i++) {
      final String word = result.substring(termIndex, termIndex + nGramIndex);
      searchWords.add(word);
      termIndex++;
    }
  }
  return searchWords;
}
