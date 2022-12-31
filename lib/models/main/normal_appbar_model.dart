//flutter
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

final normalAppBarProvider = ChangeNotifierProvider((ref) => NormalAppBarModel());

class NormalAppBarModel extends ChangeNotifier {
  bool showDrawer = false;

  void showDrawers() {
    print('tapped on show drawer!');
    showDrawer = !showDrawer;
    notifyListeners();
  }
}
