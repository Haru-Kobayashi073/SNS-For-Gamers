//flutter
import 'package:flutter/material.dart';
//constants
import 'package:sns_vol2/constants/colors.dart' as colors;

class SearchWidget extends StatelessWidget {
  const SearchWidget(
      {super.key, required this.onChanged, required this.child});
  final void Function(String)? onChanged;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.green,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            width: 400,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 1.0,
                    blurRadius: 10.0,
                    offset: Offset(5, 5),
                  ),
                ],
                color: colors.cardBackColor,
                borderRadius: BorderRadius.circular(8.0)),
            child: TextFormField(
                decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hoverColor: colors.white,
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    prefixStyle: TextStyle(color: colors.green),
                    border: OutlineInputBorder(),
                    hintText: "Search..."),
                onChanged: onChanged),
          ),
          Flexible(child: child),
        ],
      ),
    );
  }
}
