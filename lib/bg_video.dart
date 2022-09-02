import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Background extends StatefulWidget {
  final Widget childWidget;
  final String video;
  final double volume;

  const Background({ required this.childWidget, required this.video, required this.volume});

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  VideoPlayerController? _playerController;
  VoidCallback? playerListener;

  void _createVideo() async{
    if (_playerController == null) {
      _playerController = VideoPlayerController.asset(widget.video)
        ..initialize().then((value) => playerListener);
      _playerController!.setVolume(widget.volume);
      _playerController!.setLooping(true);
    }

    await _playerController!.play();

  }

  @override
  void initState() {
    super.initState();
    playerListener = (){
      setState(() {
      });
    };
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _createVideo();
  }

  @override
  void dispose() {
    _playerController!.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    _playerController!.removeListener(playerListener!);
    super.deactivate();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        Transform.scale(
          scale: 1.4, //scale as your video size
          child: (_playerController != null) ?
          VideoPlayer(
            _playerController!,
          )
              : Container(),
        ),
        widget.childWidget,
      ],
    );
  }
}