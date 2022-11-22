//flutter
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = ChangeNotifierProvider((ref) => ThemeModel());

class ThemeModel extends ChangeNotifier {
  bool isDarkTheme = true;

  void setIsDarkTheme({required bool value}) {
    isDarkTheme = value;
    notifyListeners();
  }
}
