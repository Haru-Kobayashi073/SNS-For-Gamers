//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/bottom_navigation_bar_elements.dart';
import 'package:sns_vol2/models/sns_bottom_navigation_bar_model.dart';

class SNSBottomNavigationBar extends StatelessWidget {
  const SNSBottomNavigationBar(
      {Key? key, required this.snsBottomNavigationBarModel})
      : super(key: key);

  final SNSBottomNavigationBarModel snsBottomNavigationBarModel;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF388D5D),
      items: bottomNavigationBarElements,
      currentIndex: snsBottomNavigationBarModel.currentIndex,
      onTap: ((index) => snsBottomNavigationBarModel.onTabTapped(index: index)),
    );
  }
}
