import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late VideoPlayerController _player;

  late ChewieController chewieController;
 

  @override
  void initState() {
    super.initState();
    _player = VideoPlayerController.asset("lib/video/restaurant.mp4")..initialize();
    chewieController = ChewieController(videoPlayerController: _player);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: _player.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  
                  Chewie(controller: chewieController),
                  
                ],
              ),
            ),
            Text("Your additional content here"),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayPauseButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_player.value.isPlaying) {
            _player.pause();
          } else {
            _player.play();
          }
        });
      },
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.all(8.0),
        child: Icon(
          _player.value.isPlaying ? Icons.pause : Icons.play_arrow,
          color: Colors.white,
          size: 48.0,
        ),
      ),
    );
  }
}
