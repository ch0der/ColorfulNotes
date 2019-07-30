import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:random_color/random_color.dart';
import 'package:flutter/material.dart';
import 'package:more_bloc_testing/src/resources/list_db.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorsBloc{
  final _color1 = BehaviorSubject<int>();
  final _color2 = BehaviorSubject<int>();
  final _color3 = BehaviorSubject<int>();
  final _color4 = BehaviorSubject<int>();
  final _color5 = BehaviorSubject<int>();
  final _color6 = BehaviorSubject<int>();
  final _color7 = BehaviorSubject<int>();

  Stream<int> get color1 => _color1.stream;
  Stream<int> get color2 => _color2.stream;
  Stream<int> get color3 => _color3.stream;
  Stream<int> get color4 => _color4.stream;
  Stream<int> get color5 => _color5.stream;
  Stream<int> get color6 => _color6.stream;
  Stream<int> get color7 => _color7.stream;

  RandomColor _randomColor = RandomColor();

  Future<void> changeColor1(String color) async{
    final prefs = await SharedPreferences.getInstance();
    final rndcolor = _randomColor.randomColor(colorSaturation: ColorSaturation.mediumSaturation,colorBrightness: ColorBrightness.light).value;
    await prefs.setInt(color, rndcolor);
    _color1.sink.add(rndcolor);

  }
  Future<void> changeColor2(String color) async{
    final prefs = await SharedPreferences.getInstance();
    final rndcolor = _randomColor.randomColor(colorSaturation: ColorSaturation.mediumSaturation,colorBrightness: ColorBrightness.light).value;
    await prefs.setInt(color, rndcolor);
    _color2.sink.add(rndcolor);

  }
  Future<void> changeColor3(String color) async{
    final prefs = await SharedPreferences.getInstance();
    final rndcolor = _randomColor.randomColor(colorSaturation: ColorSaturation.mediumSaturation,colorBrightness: ColorBrightness.light).value;
    await prefs.setInt(color, rndcolor);
    _color3.sink.add(rndcolor);

  }
  Future<void> changeColor4(String color) async{
    final prefs = await SharedPreferences.getInstance();
    final rndcolor = _randomColor.randomColor(colorSaturation: ColorSaturation.mediumSaturation,colorBrightness: ColorBrightness.light).value;
    await prefs.setInt(color, rndcolor);
    _color4.sink.add(rndcolor);

  }
  Future<void> changeColor5(String color) async{
    final prefs = await SharedPreferences.getInstance();
    final rndcolor = _randomColor.randomColor(colorSaturation: ColorSaturation.mediumSaturation,colorBrightness: ColorBrightness.light).value;
    await prefs.setInt(color, rndcolor);
    _color5.sink.add(rndcolor);

  }
  Future<void> changeColor6(String color) async{
    final prefs = await SharedPreferences.getInstance();
    final rndcolor = _randomColor.randomColor(colorSaturation: ColorSaturation.mediumSaturation,colorBrightness: ColorBrightness.light).value;
    await prefs.setInt(color, rndcolor);
    _color6.sink.add(rndcolor);

  }
  Future<void> changeColor7() async{
    final prefs = await SharedPreferences.getInstance();
    final rndcolor = _randomColor.randomColor(colorSaturation: ColorSaturation.mediumSaturation,colorBrightness: ColorBrightness.light).value;
    await prefs.setInt('color7', rndcolor);
    _color7.sink.add(rndcolor);

  }

  dispose(){
    _color4.close();
    _color5.close();
    _color1.close();
    _color2.close();
    _color3.close();
    _color6.close();
    _color7.close();
  }

  Future<int> getColor1(String color) async{
    final prefs = await SharedPreferences.getInstance();
    final color1 = prefs.getInt(color);
    _color4.sink.add(color1);
    if (color1 == null){
      return Colors.pink[200].value;
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
    getColors();
  }
  Future getColors()async{

    final prefs = await SharedPreferences.getInstance();
    final color1 = prefs.getInt('color1');
    final color2 = prefs.getInt('color2');
    final color3 = prefs.getInt('color3');
    final color4 = prefs.getInt('color4');
    final color5 = prefs.getInt('color5');
    final color6 = prefs.getInt('color6');
    final color7 = prefs.getInt('color7');

    _color1.sink.add(color1);
    _color2.sink.add(color2);
    _color3.sink.add(color3);
    _color4.sink.add(color4);
    _color5.sink.add(color5);
    _color6.sink.add(color6);
    _color7.sink.add(color7);

  }

  deleteDay(String today){
    DBProvider.db.deleteADay2(today);

  }


}