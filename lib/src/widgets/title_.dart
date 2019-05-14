import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';



class TitleBackground extends StatelessWidget {
  build(context) {
    return Container(
      child: Container(
        child: TyperAnimatedTextKit(
          isRepeatingAnimation: false,
          duration: Duration(milliseconds: 1000),
          text: [
            '7LOG'
          ],
          textStyle: TextStyle(
              fontSize: 100.0,
              color: Color.fromRGBO(15, 98, 58, 1.0),
              fontFamily: "Raleway"
          ),
        ),
      ),
    );
  }
}
