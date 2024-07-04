import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schach/spielfigur.dart';

class King extends Spielfigur{
  King({super.key, required super.id, required super.color}): super(icon: MdiIcons.chessKing);


  @override
  List<List<int>> getPositions() {

    return deleteWrongPos(getPos([0,1,2,3,4,5,6,7] ,1,id));
  }
}