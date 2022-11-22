//flutter
import 'package:flutter/material.dart';
import 'package:sns_vol2/details/circle_image.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    Key? key, 
    required this.length, 
    required this.userImageURL})
      : super(key: key);
  final double length;
  final String userImageURL;

  @override
  Widget build(BuildContext context) {
    return userImageURL.isEmpty
        ? Container(
            width: length,
            height: length,
            decoration: BoxDecoration(
                shape: BoxShape.circle, border: Border.all(color: Colors.grey)),
            child: Icon(
              Icons.person,
              size: length * 0.75,
            ),
          )
        : CircleImage(length: length, image: NetworkImage(userImageURL));
  }
}
