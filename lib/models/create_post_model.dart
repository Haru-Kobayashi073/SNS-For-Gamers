//flutter
import 'package:flutter/material.dart';
//packages
import 'package:flash/flash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_vol2/constants/strings.dart';

final createPostModelProvider =
    ChangeNotifierProvider((ref) => CreatePostModel());

class CreatePostModel extends ChangeNotifier {
  final TextEditingController textEditingController = TextEditingController();
  String text = '';

  void showPostDialog({required BuildContext context}) {
    context.showFlashBar(
      persistent: true,
      content: Form(
        child: TextFormField(
          controller: textEditingController,
          style: const TextStyle(fontWeight: FontWeight.bold),
          onChanged: (value) => text = value,
          maxLength: 10,
        ),
      ),
      title: const Text(createPostText),
      primaryActionBuilder: (context, controller, _) {
        return InkWell(
          child: Icon(Icons.send),
          onTap: () async {
            if (textEditingController.text.isEmpty) {
              //メインの動作
              await controller.dismiss();
            } else {
              //何もしない
              await controller.dismiss();
            }
          },
        );
      },
      negativeActionBuilder: (context, controller, _) {
        return InkWell(
          child: const Icon(Icons.close),
          onTap: () async => await controller.dismiss(),
        );
      },
    );
  }
}
