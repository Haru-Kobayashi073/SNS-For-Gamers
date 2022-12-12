//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/rounded_button.dart';
import 'package:sns_vol2/details/user_image.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/models/edit_profile_model.dart';
import 'package:sns_vol2/models/main/profile_model.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/constants/routes.dart' as routes;

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key, required this.mainModel}) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final ProfileModel profileModel = ref.watch(profileProvider);
    final EditProfileModel editProfileModel = ref.watch(editProfileProvider);
    final FirestoreUser firestoreUser = mainModel.firestoreUser;
    final int followerCount = firestoreUser.followerCount;
    final maxWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [
      editProfileModel.croppedFile == null
          ? Container(
              alignment: Alignment.center,
              child: UserImage(
                length: 80,
                userImageURL: mainModel.firestoreUser.userImageURL,
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(300.0),
              child: Container(
                  width: maxWidth * 0.25,
                  height: maxWidth * 0.25,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    shape: BoxShape.circle,
                  ),
                  child: Image.file(editProfileModel.croppedFile!)),
            ),
      Text(
        firestoreUser.userName,
        style: TextStyle(fontSize: 24),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'フォロー中: ' + firestoreUser.followingCount.toString(),
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            'フォロワー: ' + firestoreUser.followerCount.toString(),
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      RoundedButton(
          onPressed: () =>
              routes.toEditProfilePage(context: context, mainModel: mainModel),
          widthRate: 0.6,
          color: Colors.grey,
          text: editProfileText)
    ]);
  }
}
