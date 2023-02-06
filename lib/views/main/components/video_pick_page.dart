import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sns_vol2/models/video_model.dart';

class VideoPickPage extends ConsumerWidget {
  const VideoPickPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final VideoModel videoModel = ref.watch(videoProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("video play demo"),
      ),
      body: const Center(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              //galleryをcameraに変更すれば、撮影した動画を再生できる。
              videoModel.getVideo(context, ImageSource.gallery);
            },
            heroTag: "gallery",
            child: const Icon(Icons.photo),
          ),
        ],
      ),
    );
  }
}
