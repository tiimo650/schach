import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:schach/variables/variables.dart';

import '../spielfigur.dart';
class Styles{


  static TextStyle titleWHITE = const TextStyle(
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

  static TextStyle titleBLACK = const TextStyle(
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

  static TextStyle boldMiddle = const TextStyle(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle getStyle(Colour colour){
    return (colour==Colour.white) ? titleWHITE : titleBLACK;
  }


}