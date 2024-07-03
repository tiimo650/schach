import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schach/spielfigur.dart';

class Queen extends Spielfigur{
  Queen({required int id, required String color}): super(id: id, color: color, icon: MdiIcons.chessQueen);


  @override
  List<List<int>> getPositions() {
    return [];
  }

}