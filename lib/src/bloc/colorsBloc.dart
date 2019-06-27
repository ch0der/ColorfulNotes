import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:random_color/random_color.dart';
import 'package:flutter/material.dart';
import 'package:more_bloc_testing/src/resources/list_model.dart';
import 'package:more_bloc_testing/src/resources/list_db.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorsBloc{
  final _color4 = BehaviorSubject<int>();
  Stream<int> get color4 => _color4.stream;
  RandomColor _randomColor = RandomColor();

  Future<void> changeColor1() async{
    final prefs = await SharedPreferences.getInstance();
    final rndcolor = _randomColor.randomColor(colorSaturation: ColorSaturation.lowSaturation,colorBrightness: ColorBrightness.light).value;
    await prefs.setInt('color1', rndcolor);

  }
  dispose(){
    _color4.close();
  }
  Future<void> changeColor2() async{
    final prefs = await SharedPreferences.getInstance();
    final rndcolor2 = _randomColor.randomColor(colorSaturation: ColorSaturation.lowSaturation,colorBrightness: ColorBrightness.light).value;

    await prefs.setInt('color2', rndcolor2);
  }
  Future<int> getColor1() async{
    final prefs = await SharedPreferences.getInstance();
    final color1 = prefs.getInt('color1');
    _color4.sink.add(color1);
    if (color1 == null){
      return Colors.yellow[200].value;
    } return color1;

  }
  Future<int> getColor2() async{
    final prefs = await SharedPreferences.getInstance();
    final color1 = prefs.getInt('color2');
    if (color1 == null){
      return Colors.green[200].value;
    } return color1;

  }
  ColorsBloc(){
    getColor1();
    getColor2();
  }


}