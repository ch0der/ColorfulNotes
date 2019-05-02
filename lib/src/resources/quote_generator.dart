import 'package:flutter/material.dart';

class QuoteBuddy extends StatefulWidget {
  @override
  _QuoteBuddyState createState() => _QuoteBuddyState();
}

class _QuoteBuddyState extends State<QuoteBuddy>with TickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState(){
    super.initState();

    controller = AnimationController(vsync: this,
    duration: Duration(seconds: 1));

    animation = Tween(begin: 0.0, end: 1.0)
        .animate(
        CurvedAnimation(parent: controller, curve: Curves.easeIn)
    );

    Future.delayed(Duration(milliseconds: 750),
            (){
     if (controller.status == AnimationStatus.dismissed){
       controller.forward();
     }

        }
    );
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: FadeTransition(
        opacity: animation,
        child: Text(
            '“People take different roads seeking fulfillment and happiness. Just because they are not on your road, '
                'doesn’t mean they’ve gotten lost.” – Dalai Lama',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,),
      ),
    );
  }
}
