//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//package
import 'package:riverpod/riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/rounded_button.dart';
import 'package:sns_vol2/details/user_image.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/passive_user_profile_model.dart';

class PassiveUserProfilePage extends ConsumerWidget {
  const PassiveUserProfilePage(
      {Key? key, required this.passiveUser, required this.mainModel})
      : super(key: key);
  final FirestoreUser passiveUser;
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PassiveUserProfileModel passiveUserProfileModel =
        ref.watch(passiveUserProfileProvider);
    // final FirestoreUser firestoreUser = mainModel.firestoreUser;
    final bool isFollowing = mainModel.followingUids.contains(passiveUser.uid);
    final int followerCount = passiveUser.followerCount;
    final int plusOneFollwerCount = passiveUser.followerCount + 1;

    return Scaffold(
      appBar: AppBar(
        title: Text(passiveUserProfileTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UserImage(length: 100, userImageURL: passiveUser.userImageURL),
          Center(child: Text(passiveUser.uid)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'フォロー中: ' + passiveUser.followingCount.toString(),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(width: 30,),
              Text(
                isFollowing
                    ? 'フォロワー: ' + plusOneFollwerCount.toString()
                    : 'フォロワー: ' + followerCount.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          isFollowing
              ? RoundedButton(
                  onPressed: () => passiveUserProfileModel.unfollow(
                      mainModel: mainModel, passiveUser: passiveUser),
                  widthRate: 0.5,
                  color: Colors.black,
                  text: 'フォローを外す',
                  textColor: Colors.white,
                  )
              : RoundedButton(
                  onPressed: () => passiveUserProfileModel.follow(
                      mainModel: mainModel, passiveUser: passiveUser),
                  widthRate: 0.5,
                  color: Colors.black,
                  text: 'フォロー',
                  textColor: Colors.white,)
        ],
      ),
    );
  }
}
