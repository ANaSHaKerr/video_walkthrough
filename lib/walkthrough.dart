import 'package:flutter/material.dart';

class Walkthrough extends StatefulWidget {
  final title;
  final content;
  final titleStyle;
  final contentStyle;


  Walkthrough(
      {this.title,
        this.content, this.titleStyle, this.contentStyle,
      });

  @override
  WalkthroughState createState() {
    return  WalkthroughState();
  }
}

class WalkthroughState extends State<Walkthrough>
    with SingleTickerProviderStateMixin {
  Animation? animation;
  AnimationController? animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =  AnimationController(
        vsync: this, duration:  Duration(milliseconds: 500));
    animation =  Tween(begin: -250.0, end: 0.0).animate( CurvedAnimation(
        parent: animationController!, curve: Curves.easeInOut));

    animation!.addListener(() => setState(() {}));

    animationController!.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Text(
          widget.title,
          style: widget.titleStyle ?? const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          widget.content,
          style: widget.contentStyle ?? const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
