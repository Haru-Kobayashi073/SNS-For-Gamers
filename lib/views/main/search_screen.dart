//flutter
import 'package:flutter/material.dart';
import 'package:sns_vol2/constants/strings.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(searchText),
    );
  }
}