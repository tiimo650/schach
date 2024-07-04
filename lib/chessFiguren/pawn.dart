import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schach/spielfigur.dart';

class Pawn extends Spielfigur{
  Pawn({super.key, required super.id, required super.color}): super(icon: MdiIcons.chessPawn);


  @override
  List<List<int>> getPositions() {
    List<List<int>> positionen = [[]];
    if(color==Colour.white){
      positionen[0].add(id+8);
      positionen[0].add(id+16);
    }
    else{
      positionen[0].add(id-8);
      positionen[0].add(id-16);
    }
    return deleteWrongPos(positionen);
  }
}