import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maher_jaafar_portfolio/constants.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeVideoWidget extends StatefulWidget {
  const YoutubeVideoWidget({
    Key key,
    this.videoId,
  }) : super(key: key);
  final videoId;

  @override
  _YoutubeVideosWidgetState createState() => _YoutubeVideosWidgetState();
}

class _YoutubeVideosWidgetState extends State<YoutubeVideoWidget> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      params: const YoutubePlayerParams(
        playlist: const [],
        autoPlay: false,
        showControls: true,
        showFullscreenButton: true,
        desktopMode: false,
        enableJavaScript: false,
      ),
    )..listen((value) {
        if (value.isReady && !value.hasPlayed) {
          _controller
            ..hidePauseOverlay()
            ..hideTopMenu();
        }
      });
    _controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      log('Entered Fullscreen');
    };
    _controller.onExitFullscreen = () {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      Future.delayed(const Duration(seconds: 1), () {
        _controller.play();
      });
      Future.delayed(const Duration(seconds: 5), () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      });
      log('Exited Fullscreen');
    };
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final height = screenSize.height;
    final width = screenSize.width;

    const player = YoutubePlayerIFrame();

    return YoutubePlayerControllerProvider(
      // Passing controller to widgets below.
      controller: _controller,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(kDefaultPadding),
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        ),
        height: width > height ? height * 0.5 : height * 0.5,
        width: width > height ? width * 0.5 : width * 0.9,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: player),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
