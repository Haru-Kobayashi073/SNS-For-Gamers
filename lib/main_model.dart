//flutter
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainProvider = ChangeNotifierProvider(
  (ref) => MainModel(),
);

//ChangeNotifier = 値の変更を知らせる
class MainModel extends ChangeNotifier {
  int counter = 0;

  void incrementCounter() {
      counter++;
      notifyListeners();
  }
}
