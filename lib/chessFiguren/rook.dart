import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schach/spielfigur.dart';

class Rook extends Spielfigur {
  Rook({super.key, required super.id, required super.color})
      : super(icon: MdiIcons.chessRook);

  @override
  List<List<int>> getPositions() {
    return deleteWrongPos(getPos([0,2,4,6], 8, id));
  }
}
