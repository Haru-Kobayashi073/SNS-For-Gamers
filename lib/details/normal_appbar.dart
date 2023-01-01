import 'package:flutter/material.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;
import 'package:sns_vol2/details/drawer_container.dart';
import 'package:sns_vol2/details/sns_drawer.dart';
import 'package:sns_vol2/models/main/normal_appbar_model.dart';
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/models/themes_model.dart';

class NormalAppBar extends StatelessWidget with PreferredSizeWidget {
  const NormalAppBar({
    super.key,
    required this.title,
    // required this.boolValue,
    required this.mainModel,
  });
  final String title;
  // final bool boolValue;
  final MainModel mainModel;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: colors.appBarBackColor,
      title: Text(
        title,
        style: const TextStyle(color: colors.appBarTextColor),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// class NormalAppBar extends StatefulWidget implements PreferredSizeWidget {
//   const NormalAppBar({super.key, required this.title, required this.boolValue
//       // required this.normalAppBarModel
//       });
//   final String title;
//   final bool boolValue;

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
//   @override
//   State<NormalAppBar> createState() => _NormalAppBarState();
// }

// class _NormalAppBarState extends State<NormalAppBar> {
//   void showDrawers() {
//     print('tapped on show drawer!');
//     setState(() {
//       showDrawer = !showDrawer;
//     });
//   }

//   bool showDrawer = false;

//   @override
//   Widget build(BuildContext context) {
//     final bool drawersBoolSet = widget.boolValue;
//     return Stack(children: [
//       Scaffold(
//         // drawer: showDrawer == true ? Drawer(child: SNSDrawer(mainModel: mainModel, themeModel: themeModel),),
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(100),
//           child: AppBar(
//               iconTheme: const IconThemeData(color: colors.appBarTextColor),
//               elevation: 0,
//               backgroundColor: colors.appBarBackColor,
//               title: Text(
//                 widget.title,
//                 style: const TextStyle(color: colors.appBarTextColor),
//               ),
//               // leading: drawersBoolSet == true
//               //     ? IconButton(
//               //         onPressed: () => showDrawers(),
//               //         icon: const Icon(Icons.notes_rounded),
//               //         iconSize: 30,
//               //       )
//               //     : IconButton(
//               //         onPressed: () => Navigator.pop(context),
//               //         icon: const Icon(Icons.arrow_back_ios))
//                       ),
//         ),
//       ),
//       // if (showDrawer)
//       //   DrawerWidget(
//       //     closeFunction: showDrawers,
//       //   ),
//     ]);
//   }
// }
