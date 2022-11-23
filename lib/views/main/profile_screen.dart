//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/rounded_button.dart';
import 'package:sns_vol2/details/user_image.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/models/main/profile_model.dart';
import 'package:sns_vol2/models/main_model.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key, required this.mainModel}) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProfileModel profileModel = ref.watch(profileProvider);
    final FirestoreUser firestoreUser = mainModel.firestoreUser;
    final int follwerCount = firestoreUser.followerCount;
    final int plusOneFollwerCount = firestoreUser.followerCount + 1;
    final bool isFollowing =
        mainModel.followingUids.contains(firestoreUser.uid);

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      profileModel.croppedFile == null
          ? Container(
              alignment: Alignment.center,
              child: UserImage(
                length: 100,
                userImageURL: mainModel.firestoreUser.userImageURL,
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(300.0),
              child: Image.file(profileModel.croppedFile!),
            ),
      // : CircleAvatar(
      //   radius: 160,
      //   child: Image.file(
      //     profileModel.croppedFile!)),
      Text(
        'フォロー中: ' + firestoreUser.followingCount.toString(),
        style: TextStyle(fontSize: 24),
      ),
      Text(
        isFollowing
            ? 'フォロワー: ' + plusOneFollwerCount.toString()
            : 'フォロワー: ' + follwerCount.toString(),
        style: TextStyle(fontSize: 24),
      ),
      RoundedButton(
          onPressed: () async => await profileModel.uploadUserImage(
              currentUserDoc: mainModel.currentUserDoc),
          widthRate: 0.5,
          color: Colors.blue,
          text: uploadText),
      SizedBox(
        height: 30,
      ),
      isFollowing
          ? RoundedButton(
              onPressed: () => profileModel.unfollow(
                  mainModel: mainModel, passiveFirestoreUser: firestoreUser),
              widthRate: 0.5,
              color: Colors.blue,
              text: 'フォローを外す')
          : RoundedButton(
              onPressed: () => profileModel.follow(
                  mainModel: mainModel, passiveFirestoreUser: firestoreUser),
              widthRate: 0.5,
              color: Colors.blue,
              text: 'フォロー')
    ]);
  }
}
