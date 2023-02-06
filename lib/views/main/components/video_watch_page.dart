import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoWatchPage extends ConsumerStatefulWidget {
  //VideoItemを実行した時の引数を取得するのに必要。
  final File saveVideo;
  const VideoWatchPage(this.saveVideo, {super.key});

  @override
  _VideoWatchPageState createState() => _VideoWatchPageState();
}

class _VideoWatchPageState extends ConsumerState<VideoWatchPage> {
  late ChewieController _chewieController;
  late VideoPlayerController _videoPlayerController;

  //ただの箱。
  late Future<void> _future;

  Future<void> initVideoPlayer() async {
    //初期化。
    await _videoPlayerController.initialize();
    setState(() {
      //Chewieで動画を再生するための準備。
      _chewieController = ChewieController(
        //動画のパスを教えてあげる
        videoPlayerController: _videoPlayerController,
        //動画表示画面の比率
        aspectRatio: _videoPlayerController.value.aspectRatio,
        //自動再生
        // autoPlay: true,
        //自動ループ再生
        looping: true,
        //もし、Chewieでエラーが出ていたら表示。
        //The requested URL was not found on this server.と出てきたら動画のパスの型（File型、String型）に注意。
        errorBuilder: (context, errorMessage) {
          print(errorMessage);
          return Center(
            child: Text(errorMessage),
          );
        },
      );
    });
  }

  @override
  void initState() {
    super.initState();
    //_videoPlayerControllerに動画のパスを示す。widget.’変数’で引数を用いれる。
    _videoPlayerController = VideoPlayerController.file(widget.saveVideo);
    _future = initVideoPlayer();
  }

  //このページを離れる時にコントローラーを破棄してくれる。
  //必要らしい
  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text("video"),
  //     ),
  //     body: SafeArea(
  //       child: FutureBuilder(
  //         //_future = initVideoPlayer()
  //         future: _future,
  //         builder: (context, snapshot) {
  //           return Center(
  //             //initializedされていたらtrueになって、動画が再生される。
  //             child: _videoPlayerController.value.isInitialized
  //                 //動画再生表示画面の比率をオリジナルのまま表示してくれる
  //                 ? AspectRatio(
  //                     aspectRatio: _videoPlayerController.value.aspectRatio,
  //                     //数行で動画再生してくれる。
  //                     child: Chewie(
  //                       controller: _chewieController,
  //                     ),
  //                   )
  //                 : const CircularProgressIndicator(),
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        //_future = initVideoPlayer()
        future: _future,
        builder: (context, snapshot) {
          return Center(
            //initializedされていたらtrueになって、動画が再生される。
            child: _videoPlayerController.value.isInitialized
                //動画再生表示画面の比率をオリジナルのまま表示してくれる
                ? AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    //数行で動画再生してくれる。
                    child: Chewie(
                      controller: _chewieController,
                    ),
                  )
                : const CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
