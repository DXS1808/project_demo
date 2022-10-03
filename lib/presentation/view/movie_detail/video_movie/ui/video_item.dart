import 'package:flutter/material.dart';
import 'package:project_demo/data/model/video_movie/video_movie.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoItem extends StatefulWidget {
  final Results results;

  const VideoItem(this.results, {super.key});

  @override
  VideoItemState createState() => VideoItemState();
}

class VideoItemState extends State<VideoItem> {
  late YoutubePlayerController controller;
  late PlayerState playerState;
  late YoutubeMetaData videoMetaData;
  bool muted = false;
  bool isPlayerReady = false;

  @override
  void initState() {
    controller = YoutubePlayerController(
      initialVideoId: widget.results.key!,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
    videoMetaData = const YoutubeMetaData();
    playerState = PlayerState.unknown;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        onReady: () {
          isPlayerReady = true;
        },
      ),
      builder: (BuildContext context, Widget child) {
        return Stack(
          children: const [],
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }
}
