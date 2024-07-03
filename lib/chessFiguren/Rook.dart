import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schach/spielfigur.dart';

class Rook extends Spielfigur {
  Rook({required int id, required String color})
      : super(id: id, color: color, icon: MdiIcons.chessRook);

  @override
  List<List<int>> getPositions() {
    List<List<int>> positionen = [[],[]];
    int spalte = id % 8;
    debugPrint("spalte is $spalte");
    for (int i = 8; i < 64; i += 8) {
      if (spalte + i < 64) {
        positionen[0].add(spalte+i);
      }
    }
    int reihe = id ~/ 8;
    debugPrint("reihe is $reihe");
    for (int i = 0; i < 8; i++) {
      positionen[1].add((reihe * 8) + i);
    }
    return positionen;
  }
}
