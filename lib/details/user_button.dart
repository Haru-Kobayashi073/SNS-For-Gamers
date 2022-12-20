import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/rounded_button.dart';
import 'package:sns_vol2/constants/routes.dart' as routes;
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/passive_user_profile_model.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;

class UserButton extends ConsumerWidget {
  const UserButton(
      {super.key, required this.mainModel, required this.passiveUser});
  final MainModel mainModel;
  final FirestoreUser passiveUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PassiveUserProfileModel passiveUserProfileModel =
        ref.watch(passiveUserProfileProvider);
    final String passiveUid = passiveUser.uid;

    return mainModel.currentUserDoc.id == passiveUid
        ? //自分か本人か
        // IconButton(onPressed: () => routes.toEditProfilePage(
        //         context: context, mainModel: mainModel), icon: const Icon(Icons.edit))
        RoundedButton(
            onPressed: () => routes.toEditProfilePage(
                context: context, mainModel: mainModel),
            widthRate: 0.25,
            color: colors.profileSomeButtonBackColor,
            text: editProfileText,
            textColor: colors.profileSomeButtonTextColor,
          )
        : mainModel.followingUids.contains(passiveUser.uid)
            ? RoundedButton(
                onPressed: () => passiveUserProfileModel.unfollow(
                    mainModel: mainModel, passiveUser: passiveUser),
                widthRate: 0.5,
                color: colors.profileSomeButtonBackColor,
                text: 'フォローを外す',
                textColor: colors.profileSomeButtonTextColor,
              )
            : RoundedButton(
                onPressed: () => passiveUserProfileModel.follow(
                    mainModel: mainModel, passiveUser: passiveUser),
                widthRate: 0.5,
                color: colors.profileSomeButtonBackColor,
                text: 'フォロー',
                textColor: colors.profileSomeButtonTextColor,
              );
  }
}
