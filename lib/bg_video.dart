import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Background extends StatefulWidget {
  final Widget? childWidget;
  final String? video;
  final double? volume , scale;

  const Background({ required this.childWidget,  this.video,  this.volume,  this.scale});

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  VideoPlayerController? _playerController;
  VoidCallback? playerListener;

  void _createVideo() async{
    if (_playerController == null) {
      _playerController = VideoPlayerController.asset(widget.video!)
        ..initialize().then((value) => playerListener);
      _playerController!.setVolume(widget.volume ?? 1);
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

    return Stack(
      children: <Widget>[
        Transform.scale(
          scale: widget.scale ?? 1 , //scale as your video size
          child: (_playerController != null) ?
          VideoPlayer(
            _playerController!,
          )
              : Container(),
        ),
        widget.childWidget!,
      ],
    );
  }
}