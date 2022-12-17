import 'package:flutter/material.dart';
import 'package:sns_vol2/models/mute_users_model.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;

class CardPopupMenuButton extends StatelessWidget {
  const CardPopupMenuButton(
      {super.key, required this.muteUserModel, required this.onSelected, required this.text});
  final MuteUsersModel muteUserModel;
  final void Function(String)? onSelected;
  final String text;
  // final  selectedValue

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      icon: const Icon(
        Icons.more_horiz,
        color: colors.cardTextPrimaryColor,
      ),
      // color: colors.cardTextPrimaryColor,
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: '0',
          child: Text(text),
        ),
      ],
    );
  }
}
