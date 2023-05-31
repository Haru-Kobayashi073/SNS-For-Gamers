//flutter
// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

final videoProvider = ChangeNotifierProvider((ref) => VideoModel());

class VideoModel extends ChangeNotifier {

  //path_providerでアプリ内のストレージ領域を確保。
  static Future get localPath async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = appDocDir.path;
    return path;
  }

  Future getVideo(context, source) async {
    //image pickerを用いて動画を選択する。
    final picker = ImagePicker();
    final pickVideo = await picker.pickVideo(source: source);
    if (pickVideo == null) return;

    //データの型をPickedFileからFileに変更する。
    final pickFile = File(pickVideo.path);

    //localPathを呼び出して、アプリ内のストレージ領域を確保。
    final path = await localPath;

    //拡張子を取得
    final String fileName = basename(pickVideo.path);

    //pickした動画をコピーする場所を作成。
    final videoPath = '$path/$fileName';

    //pickした動画をvideoPathにコピー。※ .copyはデータの型がFileの必要あり。
    final File saveVideo = await pickFile.copy(videoPath);

    //saveVideoを引数に、VideoItemページに移動。
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => VideoWatchPage(saveVideo),
    //   ),
    // );
  }
}
