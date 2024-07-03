import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schach/spielfigur.dart';

class Bishop extends Spielfigur{
  Bishop({required int id, required String color}): super(id: id, color: color, icon: MdiIcons.chessBishop);


  @override
  List<List<int>> getPositions() {
    return [];
  }
}