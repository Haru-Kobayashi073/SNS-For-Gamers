//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/bottom_navigation_bar_elements.dart';
import 'package:sns_vol2/models/sns_bottom_navigation_bar_model.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;

class SNSBottomNavigationBar extends StatelessWidget {
  const SNSBottomNavigationBar(
      {Key? key, required this.snsBottomNavigationBarModel})
      : super(key: key);

  final SNSBottomNavigationBarModel snsBottomNavigationBarModel;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: colors.bottomNaviBarTextColor,
      unselectedIconTheme: const IconThemeData(color: colors.bottomNaviUnselectedColor),
      unselectedItemColor: colors.bottomNaviUnselectedColor,
      backgroundColor: colors.bottomNaviBarBackColor,
      elevation: 0,
      items: bottomNavigationBarElements,
      currentIndex: snsBottomNavigationBarModel.currentIndex,
      onTap: ((index) => snsBottomNavigationBarModel.onTabTapped(index: index)),
      // onTap: ((index) => snsBottomNavigationBarModel.onPageChanged(index: index)),
    );
    // return BottomAppBar(
    //   color: colors.bottomNaviBarBackColor,
    //   shape: CircularNotchedRectangle(),
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         // SizedBox(width: 1,),
    //         bottomAppBarElements[0],
    //         bottomAppBarElements[1],
    //         SizedBox(width: 10,),
    //         bottomAppBarElements[2],
    //         bottomAppBarElements[3],
    //         // SizedBox(width: 1,),
    //       ],
    //     ),
    //   ),
    // );
  }
}
