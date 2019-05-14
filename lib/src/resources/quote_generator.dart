import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math' as math;
import 'dart:math';
import 'package:more_bloc_testing/src/resources/quote_test.dart';

class QuoteBuddy extends StatefulWidget {
  @override
  _QuoteBuddyState createState() => _QuoteBuddyState();
}

class _QuoteBuddyState extends State<QuoteBuddy>with TickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;


  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this,
        duration: Duration(seconds: 1));

    animation = Tween(begin: 0.0, end: 1.0)
        .animate(
        CurvedAnimation(parent: controller, curve: Curves.easeIn)
    );

    Future.delayed(Duration(milliseconds: 750),
            () {
          if (controller.status == AnimationStatus.dismissed) {
            controller.forward();
          }
        }
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 150,
      child: FadeTransition(
        opacity: animation,
        child: Quoter(),
      ),
    );
  }
}