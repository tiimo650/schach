import 'dart:ui';
import 'package:flutter/material.dart';
import '../spielfigur.dart';

class Functions{
  static List<String> alphabet = ["a","b","c","d","e","f","g","h"];
  static String getFieldName(int index){
    return alphabet[getColumn(index)]+getRowInverted(index).toString();
  }
  static int getColumn(int index){
    return index % 8;
  }
  static int getRowInverted(int index){
    return (((index ~/ 8)-7).abs())+1;
  }
  static int getRow(int index){
    return index ~/ 8;
  }



}