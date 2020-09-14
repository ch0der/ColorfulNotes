import 'package:flutter/material.dart';

class SlidingDrawer extends StatefulWidget {
  @override
  _SlidingDrawerState createState() => _SlidingDrawerState();
}

class _SlidingDrawerState extends State<SlidingDrawer> {
  double _width = 1;
  double _height = 50;
  Color _color = Colors.redAccent.withOpacity(.8);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          curve: Curves.fastLinearToSlowEaseIn,
          height: _height,
          width: _width,
          decoration: BoxDecoration(color: _color),
        ),
        RotatedBox(
          quarterTurns: 3,
          child: ClipPath(
            clipper: TriangleClip(),
            child: GestureDetector(
              onTap: (){
                if(_width == 1){
                  setState(() {
                    _width = 250;
                  });
                } else {
                  setState(() {
                  _width = 1;
                });}
              },
              child: Container(
                height: 20,
                width: 50,
                color: _color,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
class TriangleClip extends CustomClipper<Path>{

  Path getClip(Size size){
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width/2, size.height);
    path.close();
    return path;
  }
  bool shouldReclip(TriangleClip oldClipper) => false;
}
