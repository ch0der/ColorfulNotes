import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:math';
import 'package:random_color/random_color.dart';

class LogoScreen extends StatefulWidget {
  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {

  final rndColor = RandomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, '/second');
        },
          child: Center(
        child: logo(),
      )),
    );
  }

  Widget logo() {
    return Center(
      child: Container(
        width: 290,
        decoration: BoxDecoration(
        ),
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 200)),
            Text(
              "Colorful",
              style: TextStyle(fontFamily: "Coiny", fontSize: 40),
            ),
            Row(children: <Widget>[
              note('N',rndColor.randomColor(colorBrightness: ColorBrightness.light,colorSaturation: ColorSaturation.mediumSaturation),),
              Padding(padding: EdgeInsets.only(right: 10),),
              note('O',rndColor.randomColor(colorBrightness: ColorBrightness.light,colorSaturation: ColorSaturation.mediumSaturation),),
              Padding(padding: EdgeInsets.only(right: 10),),
              note('T',rndColor.randomColor(colorBrightness: ColorBrightness.light,colorSaturation: ColorSaturation.mediumSaturation),),
              Padding(padding: EdgeInsets.only(right: 10),),
              note('E',rndColor.randomColor(colorBrightness: ColorBrightness.light,colorSaturation: ColorSaturation.mediumSaturation),),
              Padding(padding: EdgeInsets.only(right: 10),),
              note('S',rndColor.randomColor(colorBrightness: ColorBrightness.light,colorSaturation: ColorSaturation.mediumSaturation),),
            ],),
            Padding(padding: EdgeInsets.only(top: 300)),
            FadeAnimatedTextKit(text: ['tap anywhere to continue'],duration: Duration(seconds: 2),isRepeatingAnimation: false,),
          ],
        ),
      ),
    );
  }

  Widget note(String str, Color color){
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: 50,
              height: 6.5,
              color: Colors.transparent,
            ),
            Stack(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: color,
                    //hexToColor('#9eb1cd'),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.8),
                        offset: Offset.fromDirection(5.0, -4.0),
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      str,
                      style: TextStyle(
                        fontFamily: "Brownbag",
                        fontSize: 40,
                        height: 1,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 7.5,
                  decoration: BoxDecoration(
                    backgroundBlendMode: BlendMode.srcATop,
                    color: Colors.black.withOpacity(.2),
                  ),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          left: 25,
          bottom: 10,
          child: Container(
            child: Transform.scale(
                scale:.8,
                child: thumbtack(color: Colors.lime)),
          ),
        ),
      ],
    );
  }

  Widget thumbtack({Key key, Color color}) {
    return Container(
      child: Container(
        width: 25,
        height: 30,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 8,
              left: 7,
              child: Transform.rotate(
                angle: pi / 5.0,
                child: Container(
                  height: 16,
                  width: 1.5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.black26,
                      Colors.black26,
                    ]),
                  ),
                ),
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.topRight,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 17,
                      width: 17,
                      decoration: BoxDecoration(
                        color: Colors.black38.withOpacity(.3),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      height: 14,
                      width: 14,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(8),
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(5),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 5,
                      top: 7,
                      child: Container(
                        height: 1,
                        width: 1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white,
                                spreadRadius: 3.0,
                                blurRadius: 3.0),
                          ],
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
    );
  }
}


