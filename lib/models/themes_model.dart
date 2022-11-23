//flutter
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sns_vol2/constants/strings.dart';
//テーマの設定をアプリ起動時にリセットされないように保存するもの

final themeProvider = ChangeNotifierProvider((ref) => ThemeModel());

class ThemeModel extends ChangeNotifier {
  late SharedPreferences preferences;
  bool isDarkTheme = true;

  ThemeModel() {
    init();
  }

  Future<void> init() async {
    //端末に保存されているフラグなどを全て取得
    preferences = await SharedPreferences.getInstance();
    final x = preferences.getBool(isDarkThemePrefsKey);
    if (x != null) {
      //null = 一度もスイッチを触られていない状態,何もしなくていい
      isDarkTheme = x;
      notifyListeners();
    }
  }

  Future<void> setIsDarkTheme({required bool value}) async {
    isDarkTheme = value;
    await preferences.setBool(isDarkThemePrefsKey, value);
    notifyListeners();
  }
}
