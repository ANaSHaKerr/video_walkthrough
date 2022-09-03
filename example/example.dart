import 'package:flutter/material.dart';
import 'package:video_walkthrough/video_walkthrough.dart';
import 'package:video_walkthrough/walkthrough.dart';

class TestScreen extends StatelessWidget {
  final List<Walkthrough> list = [
    Walkthrough(
      title: "Title 1",
      content: "Content 1",
    ),
    Walkthrough(
      title: "Title 2",
      content: "Content 2",
    ),
    Walkthrough(
      title: "Title 3",
      content: "Content 3",
    ),
    Walkthrough(
      title: "Title 4",
      content: "Content 4",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return  VideoWalkThrough(

      video: "assets/video.mp4",
      volume: 0,
      walkthroughList: list,
      pageRoute: MaterialPageRoute(builder: (context) =>  TestScreen()),



    );
  }
}
