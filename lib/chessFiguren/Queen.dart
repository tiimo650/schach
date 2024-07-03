import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schach/spielfigur.dart';

class Queen extends Spielfigur{
  Queen({required int id, required String color}): super(id: id, color: color, icon: MdiIcons.chessQueen);


  @override
  List<List<int>> getPositions() {
    List<List<int>> positionen = List.generate(8, (int index) => []);
    for(int i= 0;i<8;i++){
      positionen[i] = getRichtungPositionen(i, 8, id);
    }
    return deleteWrongPos(positionen);
  }

}