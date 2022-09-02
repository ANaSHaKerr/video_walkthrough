import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bg_video.dart';
import 'walkthrough.dart';


class WelcomeScreen extends StatefulWidget {
  final List<Walkthrough>? walkthroughList;
  final MaterialPageRoute? pageRoute;
  final video , volume;

  const WelcomeScreen({ this.walkthroughList, this.pageRoute, this.video, this.volume});
  void skipPage(BuildContext context) {
    Navigator.push(context, pageRoute!);
  }

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Size? _size;
  double? _appbarSize;
  int _currentPage = 0;
  PageController _controller = PageController(initialPage: 0);

  List<Widget> _buildIndicators() {
    List<Widget> wlist = [];
    for (int i = 0; i < widget.walkthroughList!.length - 1; i++) {
      wlist.add((i == _currentPage) ? _indicator(true) : _indicator(false));
    }

    return wlist;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      height: 8.0,
      width: 8.0,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.white54,
          borderRadius: BorderRadius.all(Radius.circular(12.0))
      ),
    );
  }

  void _setPageState(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _moveToNextPage() {
    _controller.jumpToPage(_currentPage + 1);
  }
  void _skipPage() {
    _controller.jumpToPage(_currentPage = 2);
  }

  void _sysTemUIConfig() {
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  void initState() {
    super.initState();
    _sysTemUIConfig(); //now we will hard reset
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery
        .of(context)
        .size;
    _appbarSize = MediaQuery
        .of(context)
        .padding
        .top;
    return Scaffold(
      body: Container(
        height: _size!.height,
        child: Background(
          video: widget.video,
          volume: widget.volume,
          childWidget: Container(
              height: _size!.height,
              child: _body()),
        ),
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: _appbarSize!),
            child: FlatButton(
              child: Text(
                'Skip',
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              onPressed: () => _skipPage(),
            ),
          ),
          Image.asset("assets/blackLogo.png",
            color: Colors.white,
            width: 100,),

          Container(
            height: _size!.height / 1.6,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: PageView(
                controller: _controller,
                onPageChanged: (value) => _setPageState(value),
                physics: ClampingScrollPhysics(),
                children:widget.walkthroughList!,
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicators(),
            ),
          ),
          Container(
            child: Expanded(
              child: Container(
//                    color: Colors.indigo,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: 200,
                      height: 45,
                      child: (_currentPage != widget.walkthroughList!.length - 1)
                          ? FlatButton(
                        shape: StadiumBorder(side: BorderSide(color: Colors.white), ),
                        child: Text(
                          'Continue',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => _moveToNextPage(),
                      ) : FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(24.0)),
                        ),
                        child: Text(
                          'Start',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => widget.skipPage(context),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}