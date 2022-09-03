# video_walkthrough

A new Flutter package for both android and iOS which helps developers in creating animated video walkthrough of their app.

### Show some :heart: and star the repo to support the project

## Usage

[Example](https://github.com/ANaSHaKerr/video_walkthrough/tree/master/example/example_app.dart)

## Dimo Video

<img src="https://user-images.githubusercontent.com/88486643/188253323-3a6c27d5-fe44-49c8-9996-92281b10c026.gif"  width="200" height="400">




## Screenshots

<img src="https://i.imgur.com/fgX7PUU.jpg" height="300em" /> <img src="https://i.imgur.com/rdjSeAn.jpg" height="300em" />


To use this package :

* add the dependency to your [pubspec.yaml](https://github.com/ANaSHaKerr/video_walkthrough/blob/master/pubspec.yaml) file.

```yaml
  dependencies:
    flutter:
      sdk: flutter
    video_walkthrough:
```

### How to use

```dart
import 'package:flutter/material.dart';

import 'video_walkthrough.dart';
import 'walkthrough.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final List<Walkthrough> list = [
    Walkthrough(
      title: "Title 1",
      content: "Content 1",
      titleStyle: TextStyle(color: Colors.white),
      contentStyle:  TextStyle(color: Colors.white),
    ),
    Walkthrough(
      title: "Title 2",
      content: "Content 2",
      titleStyle: TextStyle(color: Colors.white),
      contentStyle:  TextStyle(color: Colors.white),
    ),
    Walkthrough(
      title: "Title 3",
      content: "Content 3",
      titleStyle: TextStyle(color: Colors.white),
      contentStyle:  TextStyle(color: Colors.white),
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  WelcomeScreen(

        videoScale: 1.0,
        video: "assets/video.mp4",
        volume: 0.0,
        walkthroughList: list,
        pageRoute: MaterialPageRoute(builder: (context) =>  MyApp()),
      ),
    );
  }
}

```
`video` - the name of url that will show up in the background

`volume` - the sound of the video

`walkthroughList` - The list of content that will show in the screens

`pageRoute` - The screen that will be navigate to after the end of the walkthrough

`videoScale` - the size of the video in the background

`continueText` -  The string that will show up in the continue button

`continueStyle` - Text Style of continue button

`continueBorderColor` - border color of continue button

`skipText` -  The string that will show up in the skip button

`skipStyle` - Text Style of skip button

`startText` -  The string that will show up in the start button

`startStyle` - Text Style of start button

`startBtnColor` - background color of start button

`smallImage` - The asset of image that show up the content

`smallImageColor` - The color of the small image up the content

`smallImageSize` -  The size of the small image up the content

`dotSize` - The size of the dots of the indicator

`indicatorActiveColor` - The color of the indicator when be selected 

`indicatorInActiveColor` -  The size of the indicator when not be selected


[Github](https://github.com/ANaSHaKerr) ([Linkedin](https://www.linkedin.com/in/anashaker/)) ([Freelance](https://khamsat.com/user/ana_shaker))


