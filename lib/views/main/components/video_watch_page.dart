import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoWatchPage extends ConsumerStatefulWidget {
  //VideoItemを実行した時の引数を取得するのに必要。
  final String videoPath;
  const VideoWatchPage(this.videoPath, {super.key});
  @override
  _VideoWatchPageState createState() => _VideoWatchPageState();
}

class _VideoWatchPageState extends ConsumerState<VideoWatchPage> {
  late ChewieController _chewieController;
  late VideoPlayerController _videoPlayerController;

  //ただの箱。
  late Future<void> _future;

  Future<void> initVideoPlayer() async {
    await _videoPlayerController.initialize();
    setState(() {
      //Chewieで動画を再生するための準備。
      _chewieController = ChewieController(
        //動画のパスを教えてあげる
        videoPlayerController: _videoPlayerController,
        //動画表示画面の比率
        aspectRatio: _videoPlayerController.value.aspectRatio,
        //自動再生
        autoPlay: false,
        //自動ループ再生
        looping: false,
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
    _videoPlayerController = VideoPlayerController.network(widget.videoPath);
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
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: FutureBuilder(
        //_future = initVideoPlayer()
        future: _future,
        builder: (context, snapshot) {
          return _videoPlayerController.value.isInitialized
              ? SizedBox(
                  width: maxWidth * 0.68,
                  //initializedされていたらtrueになって、動画が再生される。
                  child:
                      //動画再生表示画面の比率をオリジナルのまま表示してくれる
                      AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    //数行で動画再生してくれる。
                    child: Chewie(
                      controller: _chewieController,
                    ),
                  ),
                )
              : Container(
                  alignment: Alignment.center,
                  width: maxWidth * 0.68,
                  child: const SizedBox(
                      width: 40, child: CircularProgressIndicator()),
                );
        },
      ),
    );
  }
}
