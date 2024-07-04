import 'package:flutter/cupertino.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schach/game.dart';
import 'package:schach/spielfigur.dart';

class Pawn extends Spielfigur{
  Pawn({super.key, required super.id, required super.color}): super(icon: MdiIcons.chessPawn);


  @override
  List<List<int>> getPositions() {
    List<List<int>> positionen = [[],[],[]];
    int row = id ~/ 8;
    debugPrint(row.toString());
    if(color==Colour.white){
      positionen[0].add(id-8);
      if(row==6){
        positionen[0].add(id-16);
      }
      positionen[1].add(id-7);
      positionen[2].add(id-9);
    }
    else{
      positionen[0].add(id+8);
      if(row==1){
        positionen[0].add(id+16);
      }
      positionen[1].add(id+7);
      positionen[2].add(id+9);
    }
    return deleteWrongPos(positionen);
  }
}