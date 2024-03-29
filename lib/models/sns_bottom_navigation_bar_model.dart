//flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//constants
import 'package:sns_vol2/constants/ints.dart';

final snsBottomNavigationBarProvider =
    ChangeNotifierProvider((ref) => SNSBottomNavigationBarModel());
class SNSBottomNavigationBarModel extends ChangeNotifier {
  int currentIndex = 0;
  late PageController pageController;

  SNSBottomNavigationBarModel() {
    init();
  }

  void init() {
    pageController = PageController(initialPage: currentIndex);
    //ボトムナビの左からのある番数に紐づいたアイコンのページを表示するようにするコントローラー
    notifyListeners();
  }

  void onPageChanged({required int index}) {
    currentIndex = index;
    notifyListeners();
  }

  void onTabTapped({required int index}) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: pageAnimationDuration),
        curve: Curves.ease);
  }

  void setPageController() {
    pageController = PageController(initialPage: currentIndex);
    notifyListeners();
  }
}
