import 'package:flutter/material.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;

class NormalAppBar extends StatelessWidget with PreferredSizeWidget {
  const NormalAppBar({
    super.key,
    required this.title
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: colors.green,
      title: Text(
        title,
        style: const TextStyle(color: colors.white),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}