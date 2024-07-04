import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schach/spielfigur.dart';

class Knight extends Spielfigur{
  Knight({super.key, required super.id, required super.color}): super(icon: MdiIcons.chessKnight);


  @override
  List<List<int>> getPositions() {
    List<List<int>> list = List.generate(6, (int index) => []);

    list.add([id-15]);
    if(columnCheckKnight(id, list.last.last)){ list.removeLast();}
    list.add([id+15]);
    if(columnCheckKnight(id, list.last.last)){ list.removeLast();}
    list.add([id-10]);
    if(columnCheckKnight(id, list.last.last)){ list.removeLast();}
    list.add([id+10]);
    if(columnCheckKnight(id, list.last.last)){ list.removeLast();}
    list.add([id+17]);
    if(columnCheckKnight(id, list.last.last)){ list.removeLast();}
    list.add([id-17]);
    if(columnCheckKnight(id, list.last.last)){ list.removeLast();}
    list.add([id+6]);
    if(columnCheckKnight(id, list.last.last)){ list.removeLast();}
    list.add([id-6]);
    if(columnCheckKnight(id, list.last.last)){ list.removeLast();}

    return deleteWrongPos(list);
  }



  bool columnCheckKnight(int o, int n){
    int column = o % 8;
    int column2 = n % 8;
    if((column2-column).abs()>2){
      return true;
    }
    return false;

  }
}