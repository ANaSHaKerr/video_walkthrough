# video_walkthrough

A new Flutter package for both android and iOS which helps developers in creating animated video walkthrough of their app.

### Show some :heart: and star the repo to support the project

## Usage

[Example](https://github.com/ANaSHaKerr/video_walkthrough/tree/master/example/example_app.dart)

## Dimo Video
<img src="https://i.imgur.com/QdHkGOA.mp4" height="300em" />


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


[Github](https://github.com/ANaSHaKerr) ([Linkedin](https://www.linkedin.com/in/anashaker/)) ([Freelance](https://khamsat.com/user/ana_shaker))


