import 'package:flutter/material.dart';
import 'package:diya/providers/color_provider.dart';
import 'package:diya/screens/onboarding/components/drawer_paint.dart';
import 'package:diya/screens/onboarding/models/onboard_page_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    _safeAreaHorizontal = _mediaQueryData.padding.left +
        _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top +
        _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal)/100;
    safeBlockVertical = (screenHeight - _safeAreaVertical)/100;
  }
}


class OnboardPage extends StatefulWidget {
  final PageController pageController;
  final OnboardPageModel pageModel;

  const OnboardPage(
      {Key key, @required this.pageModel, @required this.pageController})
      : super(key: key);

  @override
  _OnboardPageState createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> heroAnimation;
  Animation<double> borderAnimation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750));

    heroAnimation = Tween<double>(begin: -40, end: 0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut));
    borderAnimation = Tween<double>(begin: 75, end: 50).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut));

    animationController.forward(from: 0);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  _nextButtonPressed() {
    Provider.of<ColorProvider>(context, listen: false).color =
        widget.pageModel.nextAccentColor;
    widget.pageController.nextPage(
      duration: Duration(
        milliseconds: 100,
      ),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Stack(
        children: <Widget>[
          Container(
            color: widget.pageModel.primeColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                AnimatedBuilder(
                  animation: heroAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(heroAnimation.value, 0),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 32.0, top: 30.0, left: 32.0),
                        child: Image.asset(widget.pageModel.imagePath),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    height:MediaQuery.of(context).size.height/2.3100 ,
                     width: MediaQuery.of(context).size.width/0.25 ,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.pageModel.caption,
                          style: TextStyle(
                              fontSize: 15,
                              color:
                                  widget.pageModel.accentColor.withOpacity(0.8),
                              letterSpacing: 1,
                              fontStyle: FontStyle.normal),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            widget.pageModel.subhead,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: widget.pageModel.accentColor,
                                letterSpacing: 1,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            widget.pageModel.description,
                            style: TextStyle(
                              fontSize: 18,
                              color:
                                  widget.pageModel.accentColor.withOpacity(0.9),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: AnimatedBuilder(
              animation: borderAnimation,
              builder: (context, child) {
                return CustomPaint(
                  painter: DrawerPaint(
                    curveColor: widget.pageModel.accentColor,
                  ),
                  child: Container(
                    width: borderAnimation.value,
                    height: double.infinity,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_forward,
                            color: widget.pageModel.primeColor,
                            size: 32,
                          ),
                          onPressed: _nextButtonPressed,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );

  }
}
