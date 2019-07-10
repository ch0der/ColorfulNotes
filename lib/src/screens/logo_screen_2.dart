import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LogoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, '/second2');
        },
          child: Center(
        child: logo(),
      )),
    );
  }

  Widget logo() {
    return Container(
      width: 1000,
      decoration: BoxDecoration(
      ),
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 200)),
          Text(
            "7Log",
            style: TextStyle(fontFamily: "Coiny", fontSize: 40),
          ),
          Text(
            "7 day tracker",
            style: TextStyle(fontFamily: "Coiny", fontSize: 15),
          ),
          Padding(padding: EdgeInsets.only(top: 300)),
          FadeAnimatedTextKit(text: ['tap anywhere to continue'],duration: Duration(seconds: 2),isRepeatingAnimation: false,),
        ],
      ),
    );
  }
}


