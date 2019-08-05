import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:random_color/random_color.dart';
import 'package:flutter/material.dart';
import 'package:more_bloc_testing/src/resources/list_model.dart';
import 'package:more_bloc_testing/src/resources/list_db.dart';

class ColorBloc{

  Color colorTest = Colors.blue;

  final RandomColor _randomColor = RandomColor();
  final _color1 = BehaviorSubject<RandomColor>();
  final _color2 = BehaviorSubject<Color>();
  final _color3 = BehaviorSubject<Color>();
  final _color4 = BehaviorSubject<int>();
  final _color5 = BehaviorSubject<String>();
  final _color6 = BehaviorSubject<RandomColor>();
  final _color7 = BehaviorSubject<RandomColor>();
  final _color101 = BehaviorSubject<Color>();
  final _colorController = StreamController<NoteColors>.broadcast();

  Stream<RandomColor> get color1 => _color1.stream;
  Stream<Color> get color2 => _color2.stream;
  Stream<Color> get color3 => _color3.stream;
  Stream<int> get color4 => _color4.stream;
  Stream<String> get color5 => _color5.stream;

  get colors => _colorController.stream;
  Stream<Color> get color101 => _color101.stream;

  Function(RandomColor) get changeColor1 => _color1.sink.add;
  Function(Color) get changeColor3 => _color3.sink.add;

  Color hexToColor(String hexString, {String alphaChannel = 'FF'}) {
    return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
  }


  dispose(){
    _color1.close();
    _color2.close();
    _color3.close();
    _color4.close();
    _color5.close();
    _color6.close();
    _color7.close();
    _color101.close();
    _colorController.close();

  }
  color<RandomColor>(){

    final colorR = _randomColor.randomColor(
      colorBrightness: ColorBrightness.light,
      colorSaturation: ColorSaturation.lowSaturation,
    );

    _color2.sink.add(colorR);
    final test = _color2.value;
    MyColor _myColor = getColorNameFromColor(colorR);
    MyColor _myColor2 = getColorNameFromColor(test);
    print(_myColor.getCode);
    print(_myColor2.getName);
    return colorR;
  }
  ColorBloc(){
    color();
  }
  color101r(){
    final value = _randomColor.randomColor(colorBrightness: ColorBrightness.light,
      colorSaturation: ColorSaturation.lowSaturation,);

    _color101.sink.add(value);
    return _color101;
  }
  retrieve(){
    Color color = _color3.value;
    return color;
  }
  testp<Color>(){
    final color = _color3.value;
    return color;
  }
  add(NoteColors noteColors){
    DBProvider.db.newNoteColor(noteColors);
  }
  getColor<NoteColors>(int id3){
    DBProvider.db.getAcolor(id3);
  }
  retrieve1()async{
    final ids = await DBProvider.db.getColors();
    _colorController.sink.add(ids);

  }
  getaColor<String>(int id3)async{
    final color = await DBProvider.db.getoneColor(id3);
    return color;


  }
  newColor(){
    Color random = _randomColor.randomColor(colorBrightness: ColorBrightness.light,
      colorSaturation: ColorSaturation.lowSaturation,);
    int colorString = random.value;
    String str = random.value.toString();
    NoteColors note = NoteColors(color: str);

    DBProvider.db.newNoteColor(note);


    _color4.sink.add(colorString);

  }
  retrieveColor(){
    int key = _color4.value;

    return key;
  }
  colorOne(int id3) async{
    _color5.sink.add(await DBProvider.db.getoneColor(id3));


  }
  deleteAnimate(){

  }

}