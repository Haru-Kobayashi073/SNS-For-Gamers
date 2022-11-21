//flutter
import 'package:flutter/material.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/models/main_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.mainModel}) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(mainModel.firestoreUser.userName,
          style: TextStyle(fontSize: 40),
          ),
        ),
      ],
    );
  }
}
