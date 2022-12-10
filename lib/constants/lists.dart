import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sns_vol2/constants/enums.dart';
import 'package:sns_vol2/constants/others.dart';
import 'package:sns_vol2/domain/mute_user_token/mute_user_token.dart';

Future<List<String>> returnMuteUids() async {
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
  // List<String> muteUids = tokenDocs
  //     .where((element) => element['tokenType'] == muteUserTokenTypeString)
  //     .map((e) => MuteUserToken.fromJson(e.data()).passiveUid)
  //     .toList();

  //わかりやすい正解
  List<String> muteUids = [];
  for (final tokenDoc in tokenDocs) {
    if (tokenDoc['tokenType'] == muteUserTokenTypeString) {
      final MuteUserToken muteUserToken =
          MuteUserToken.fromJson(tokenDoc.data());
      muteUids.add(muteUserToken.passiveUid);
    }
  }

  return muteUids;
}
