import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schach/spielfigur.dart';

class Bishop extends Spielfigur{
  Bishop({super.key, required super.id, required super.color}): super(icon: MdiIcons.chessBishop);


  @override
  List<List<int>> getPositions() {
    return deleteWrongPos(getPos([1,3,5,7], 8, id));
  }
}