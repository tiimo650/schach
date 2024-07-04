import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schach/spielfigur.dart';

class Queen extends Spielfigur{
  Queen({super.key, required super.id, required super.color}): super(icon: MdiIcons.chessQueen);


  @override
  List<List<int>> getPositions() {
    return deleteWrongPos(getPos([0,1,2,3,4,5,6,7], 8, id));

    /*List<List<int>> positionen = List.generate(8, (int index) => []);
    for(int i= 0;i<8;i++){
      positionen[i] = getRichtungPositionen(i, 8, id);
    }
    return deleteWrongPos(positionen);*/
  }

}