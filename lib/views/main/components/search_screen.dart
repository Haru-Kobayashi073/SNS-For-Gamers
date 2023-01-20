import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;

class SearchScreen extends StatelessWidget {
  const SearchScreen(
      {super.key, required this.onQueryChanged, required this.child
      });
  final void Function(String)? onQueryChanged;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      backgroundColor: colors.searchBarBackColor,
      onQueryChanged: onQueryChanged,
      clearQueryOnClose: true,
      // body: IndexedStack(
      //   children: [
      //     FloatingSearchBarScrollNotifier(
      //       child: child
      //     ),
      //   ],
      // ),
      body: FloatingSearchBarScrollNotifier(
        child: child
      ),
      builder: (context, transition) {
        return Container();
      },
    );
  }
}
