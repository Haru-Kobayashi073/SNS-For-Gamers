import 'package:flutter/material.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;
import 'package:sns_vol2/details/user_button.dart';
import 'package:sns_vol2/details/user_image.dart';
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/models/main_model.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key, required this.mainModel, required this.firestoreUser});
  final MainModel mainModel;
  final FirestoreUser firestoreUser;

  @override
  Widget build(BuildContext context) {
    // final EditProfileModel editProfileModel =

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(children: [
        // editProfileModel.croppedFile == null?
        Container(
          alignment: Alignment.center,
          child: UserImage(
            length: 80,
            userImageURL: firestoreUser.userImageURL,
          ),
        ),
        // : ClipRRect(
        //     borderRadius: BorderRadius.circular(300.0),
        //     child: Container(
        //         width: maxWidth * 0.25,
        //         height: maxWidth * 0.25,
        //         decoration: BoxDecoration(
        //           border: Border.all(color: Colors.grey),
        //           shape: BoxShape.circle,
        //         ),
        //         child: Image.file(editProfileModel.croppedFile!)),
        //   ),
        Text(
          firestoreUser.userName,
          style: const TextStyle(fontSize: 24, color: colors.profileTextColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'フォロー中: ' + firestoreUser.followingCount.toString(),
              style:
                  const TextStyle(fontSize: 16, color: colors.profileTextColor),
            ),
            const SizedBox(
              width: 30,
            ),
            Text(
              'フォロワー: ' + firestoreUser.followerCount.toString(),
              style:
                  const TextStyle(fontSize: 16, color: colors.profileTextColor),
            ),
          ],
        ),
        UserButton(mainModel: mainModel, passiveUser: firestoreUser)
      ]),
    );
  }
}
