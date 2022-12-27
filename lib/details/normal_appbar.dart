import 'package:flutter/material.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;

class NormalAppBar extends StatelessWidget with PreferredSizeWidget{
  const NormalAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: colors.appBarTextColor),
      elevation: 0,
      backgroundColor: colors.appBarBackColor,
      title: Text(
        title,
        style: const TextStyle(color: colors.appBarTextColor),
      ),
      // leading: IconButton(
        //     onPressed: () => scaffoldKey.currentState!.openDrawer(),
        //     icon: const Icon(Icons.notes_rounded),
        //     iconSize: 30,
        //     ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
