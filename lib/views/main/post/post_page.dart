//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;
import 'package:sns_vol2/details/rounded_button.dart';
import 'package:sns_vol2/models/main_model.dart';
//package

class PostPage extends ConsumerWidget {
  const PostPage({super.key, required this.mainModel});
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;
    final firestoreUser = mainModel.firestoreUser;

    return Scaffold(
      backgroundColor: colors.backScreenColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.appBarBackColor,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: maxWidth * 0.9,
              height: maxHeight * 0.8,
              decoration: BoxDecoration(
                  color: colors.cardBackColor,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                
              ),
            ),
            SizedBox(
              height: maxHeight * 0.05,
            )
          ],
        ),
      ),
    );
  }
}
