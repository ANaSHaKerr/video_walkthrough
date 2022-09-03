import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bg_video.dart';
import 'walkthrough.dart';


class WelcomeScreen extends StatefulWidget {
  final List<Walkthrough> walkthroughList;
  final MaterialPageRoute? pageRoute;
  final String video , smallImage ;
  final String? skipText, continueText, startText  ;
  final TextStyle? skipStyle , continueStyle, startStyle;
  final double? volume , videoScale , dotSize , smallImageSize;
  final Color? smallImageColor, indicatorActiveColor ,  indicatorInActiveColor , continueBorderColor , startBtnColor;

  const WelcomeScreen({required this.walkthroughList, this.pageRoute,required this.video, this.volume, this.videoScale,  this.indicatorActiveColor,  this.indicatorInActiveColor, this.dotSize, this.skipText, this.continueText, this.startText, this.skipStyle, this.continueStyle, this.startStyle, this.continueBorderColor, this.startBtnColor, this.smallImage = "", this.smallImageSize, this.smallImageColor});
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
    for (int i = 0; i < widget.walkthroughList.length; i++) {
      wlist.add((i == _currentPage) ? _indicator(true) : _indicator(false));
    }

    return wlist;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      height: widget.dotSize ?? 8.0,
      width:widget.dotSize ?? 8.0,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: isActive ? widget.indicatorActiveColor ?? Colors.white : widget.indicatorActiveColor ?? Colors.white54,
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
    _controller.jumpToPage(_currentPage = widget.walkthroughList.length - 1);
  }

  void _sysTemUIConfig() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
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
          scale: widget.videoScale,
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
                widget.skipText ?? 'Skip',
                style:widget.skipStyle ?? const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              onPressed: () => _skipPage(),
            ),
          ),
          widget.smallImage.isNotEmpty ? Image.asset(widget.smallImage  ,
            color:widget.smallImageColor ?? Colors.white,
            width:widget.smallImageSize ??  100,) : Container(),

          Container(
            height: _size!.height / 1.6,

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: PageView(
                controller: _controller,
                onPageChanged: (value) => _setPageState(value),
                physics: ClampingScrollPhysics(),
                children:widget.walkthroughList,
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
                      child: (_currentPage != widget.walkthroughList.length - 1)
                          ? FlatButton(
                        shape: StadiumBorder(side: BorderSide(color: widget.continueBorderColor ?? Colors.white), ),
                        child: Text(
                          widget.continueText ??  'Continue',
                          style:widget.continueStyle ?? const TextStyle(color: Colors.white),
                        ),
                        onPressed: () => _moveToNextPage(),
                      ) : FlatButton(
                        color: widget.startBtnColor ?? Colors.indigoAccent,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(24.0)),
                        ),
                        child: Text(
                          widget.startText ??'Start',
                          style:widget.startStyle ?? TextStyle(color: Colors.white),
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