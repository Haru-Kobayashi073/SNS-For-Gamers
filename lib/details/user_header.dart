//flutter
import 'package:flutter/material.dart';
//constants
import 'package:sns_vol2/constants/colors.dart' as colors;
//details
import 'package:sns_vol2/details/user_button.dart';
import 'package:sns_vol2/details/user_image.dart';
//domain
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
//models
import 'package:sns_vol2/models/main_model.dart';

class UserHeader extends StatelessWidget {
  const UserHeader(
      {super.key,
      required this.mainModel,
      required this.firestoreUser,
      required this.onPressed});
  final MainModel mainModel;
  final FirestoreUser firestoreUser;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: maxHeight * 0.25,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: UserImage(
                        length: 80,
                        userImageURL: firestoreUser.userImageURL,
                      ),
                    ),
                  ),
                  Text(
                    firestoreUser.userName,
                    style: const TextStyle(fontSize: 24, color: colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: maxHeight * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              firestoreUser.followingCount.toString(),
                              style: const TextStyle(
                                  fontSize: 20, color: colors.white),
                            ),
                            const Text(
                              'following',
                              style:
                                  TextStyle(fontSize: 16, color: colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Text(
                              firestoreUser.followerCount.toString(),
                              style: const TextStyle(
                                  fontSize: 20, color: colors.white),
                            ),
                            const Text(
                              'follower',
                              style:
                                  TextStyle(fontSize: 16, color: colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  UserButton(
                      mainModel: mainModel,
                      passiveUser: firestoreUser,
                      onPressed: onPressed),
                ],
              ),
            ],
          ),
          Flexible(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
              // ignore: unnecessary_null_comparison
              child: firestoreUser.introduction == null
                  ? const Text(
                      "No introduction",
                      style: TextStyle(color: colors.white, fontSize: 16),
                    )
                  : Text(
                      firestoreUser.introduction,
                      style: const TextStyle(color: colors.white, fontSize: 16),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
