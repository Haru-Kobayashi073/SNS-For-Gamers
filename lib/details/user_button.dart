//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//constants
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/constants/routes.dart' as routes;
import 'package:sns_vol2/constants/colors.dart' as colors;
//details
import 'package:sns_vol2/details/rounded_button.dart';
//domain
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
//models
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/passive_user_profile_model.dart';

class UserButton extends ConsumerWidget {
  const UserButton(
      {super.key,
      required this.mainModel,
      required this.passiveUser,
      required this.onPressed});
  final MainModel mainModel;
  final FirestoreUser passiveUser;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PassiveUserProfileModel passiveUserProfileModel =
        ref.watch(passiveUserProfileProvider);
    final String passiveUid = passiveUser.uid;
    final maxWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        mainModel.currentUserDoc.id == passiveUid
            ? //自分か本人か
            SizedBox(
                width: maxWidth * 0.25,
                child: ClipRRect(
                    child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.green,
                    side:
                        const BorderSide(width: 2, color: colors.greenishWhite),
                  ),
                  onPressed: () => routes.toEditProfilePage(
                      context: context, mainModel: mainModel),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: Text(
                      editProfileText,
                      style: TextStyle(color: colors.greenishWhite),
                    ),
                  ),
                )))
            : mainModel.followingUids.contains(passiveUser.uid)
                ? RoundedButton(
                    onPressed: () => passiveUserProfileModel.unfollow(
                        mainModel: mainModel, passiveUser: passiveUser),
                    widthRate: 0.5,
                    color: colors.greenishWhite,
                    text: 'フォローを外す',
                    textColor: colors.green,
                  )
                : RoundedButton(
                    onPressed: () => passiveUserProfileModel.follow(
                        mainModel: mainModel, passiveUser: passiveUser),
                    widthRate: 0.5,
                    color: colors.greenishWhite,
                    text: 'フォロー',
                    textColor: colors.green,
                  ),
        IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.sort,
              color: colors.white,
            ))
      ],
    );
  }
}
