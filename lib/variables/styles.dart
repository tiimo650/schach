import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:schach/variables/variables.dart';

import '../spielfigur.dart';
class Styles{


  static const TextStyle titleWHITE = const TextStyle(
    fontSize: 50,
    color: Colors.white,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(3, 3),
        blurRadius: 8.0,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      Shadow(
        offset: Offset(3, 3),
        blurRadius: 8.0,
        color: Color.fromARGB(125, 0, 0, 255),
      ),
    ],
  );

  static const TextStyle titleBLACK = const TextStyle(
    fontSize: 50,
    color: Colors.black,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(3, 3),
        blurRadius: 8.0,
        color: Color.fromARGB(125, 255, 255, 255),
      ),
      Shadow(
        offset: Offset(3, 3),
        blurRadius: 8.0,
        color: Color.fromARGB(125, 65, 97, 255),
      ),
    ],
  );

  static const TextStyle boldMiddle = const TextStyle(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static  TextStyle getStyle(Colour colour){
    return (colour==Colour.white) ? titleWHITE : titleBLACK;
  }

  static const TextStyle redSmall = const TextStyle(
    fontSize: 15,
    color: Colors.red,
    fontWeight: FontWeight.bold,
  );


  static const TextStyle gameTitle = const TextStyle(
    fontWeight: FontWeight.w800,
    color:  Colors.white,
      fontSize: 27,
    letterSpacing: 15,
  );


  static TextStyle playTITLE(double i) => TextStyle(
    fontWeight: FontWeight.w900,
    color:  Colors.black,
    fontSize: i*0.021,
    letterSpacing: 15,
  );



}