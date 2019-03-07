import 'package:flutter/material.dart';
import '../widgets/cat.dart';
import 'dart:math';

class Home extends StatefulWidget{
  HomeState createState()=>HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation; //(instance variable) declaration of variable, does not initiliaze it to any value \
  AnimationController catController; //instance varable
  Animation<double> boxAnimation;
  AnimationController boxController;

  initState(){
    super.initState();

    boxController = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this,
    );
    boxAnimation = Tween(begin: pi*0.5, end:  pi*0.55,)
        .animate(CurvedAnimation
      (parent: boxController,curve: Curves.easeInOut)
    );

    catController = AnimationController(
      duration: Duration(milliseconds: 250),
      vsync: this,
    );
    catAnimation = Tween(begin: -50.0, end: -80.0) //ALL catAnimation 'knows/understands' is that it is changing from 0.0 to 100.0 in 2 seconds
        .animate(
      CurvedAnimation(
        parent: catController, curve: Curves.easeIn,
      ),
    );
    boxAnimation.addStatusListener((status){
      if (status == AnimationStatus.completed){
        boxController.reverse();
      } else if (status == AnimationStatus.dismissed){
        boxController.forward();
      }
    });
    boxController.forward();
  }

  onTap(){
    boxController.stop();
    if (catController.status == AnimationStatus.completed){
      boxController.forward();
      catController.reverse();
    }
    else if (catController.status == AnimationStatus.forward){
      catController.reverse();
    }
    else if (catController.status == AnimationStatus.reverse){
      catController.forward();
    }
    else if (catController.status ==AnimationStatus.dismissed){
      boxController.stop();
      catController.forward();
    }
  }


  Widget build(context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: GestureDetector(
        child: Center(
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                buildCatAnimation(),
                buildBox(),
                buildLeftFlap(),
                buildRightFlap(),
              ],
            )
        ),

        onTap: onTap,
      ),
    );
  }

  Widget buildCatAnimation(){
    return AnimatedBuilder(animation: catAnimation, builder:(context, child){
      return Positioned(
        child: child,
        top: catAnimation.value, right: 0.0, left: 0.0,
      );
    },
      child: Cat(),//this single instance of cat will be reused over and over within our builder (aka doesnt have to load NEW instance 60 times per second)
    );
  }

  Widget buildBox(){
    return Container(
      width: 200.0,
      height: 200.0,
      color: Colors.brown,
    );
  }

  Widget buildLeftFlap(){
    return Positioned(
      left: 3.0,
      child: AnimatedBuilder(
          animation: boxAnimation,
          child: Container(
              height: 10.0,
              width: 125.0,
              color: Colors.brown
          ),
          builder:(context, child){
            return Transform.rotate(
              child: child,
              alignment: Alignment.topLeft,
              angle: boxAnimation.value,
            );
          }
      ),
    );
  }
  Widget buildRightFlap(){
    return Positioned(
      right: 3.0,
      child: AnimatedBuilder(
          animation: boxAnimation,
          child: Container(
              height: 10.0,
              width: 125.0,
              color: Colors.brown
          ),
          builder:(context, child){
            return Transform.rotate(
              child: child,
              alignment: Alignment.topRight,
              angle: -boxAnimation.value, //add the negative symbol will do value but negative
            );
          }
      ),
    );
  }

}