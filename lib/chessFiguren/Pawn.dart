import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schach/spielfigur.dart';

class Pawn extends Spielfigur{
  Pawn({required int id, required String color}): super(id: id, color: color, icon: MdiIcons.chessPawn);


  @override
  List<List<int>> getPositions() {
    List<List<int>> positionen = [[]];
    if(color=="white"){
      positionen[0].add(id+8);
      positionen[0].add(id+16);
    }
    else{
      positionen[0].add(id-8);
      positionen[0].add(id-16);
    }
    return positionen;
  }
}