//flutter
import 'package:flutter/material.dart';
import 'package:sns_vol2/constants/strings.dart';

final List<BottomNavigationBarItem> bottomNavigationBarElements = [
  const BottomNavigationBarItem(icon: Icon(Icons.home),
  label: homeText
  ),
  const BottomNavigationBarItem(icon: Icon(Icons.search),
  label: searchText
  ),
  const BottomNavigationBarItem(icon: Icon(Icons.article),
  label: articleText
  ),
  const BottomNavigationBarItem(icon: Icon(Icons.person),
  label: profileText
  ),
];

final List<Icon> bottomAppBarElements = [
  const Icon(Icons.home),
  const Icon(Icons.search),
  const Icon(Icons.article),
  const Icon(Icons.person),
];
