import 'package:flutter/material.dart';

abstract class Spielfigur extends StatelessWidget {
  late int id;
  final String color;
  final IconData icon;

  Spielfigur(
      {super.key, required this.id, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(
          icon,
          color: getColor(color),
          size: (MediaQuery.sizeOf(context).width * 0.05 + 5),
        );
  }

  List<List<int>> getPositions();

  Color getColor(String color) {
    if (color == "white") {
      return Colors.white;
    } else if (color == "black") {
      return Colors.black87;
    }
    return Colors.red;
  }

  List<List<int>> deleteWrongPos(List<List<int>> liste) {
    //geht sicher, dass keine position außerhalb des Spielfeldes ist
    List<List<int>> remove = liste;
    for (int i = 0; i < liste.length; i++) {
      for (int j = 0; j < liste[i].length; j++) {
        int cur = liste[i][j];
        if (cur < 0 || cur >= 64) {
          remove[i].removeAt(j);
          j--;
        }
      }
    }
    return remove;
  }

  List<List<int>> getPos(List<int> directions, int length, int index){
    List<List<int>> list = List.generate(directions.length, (int index) => []);
    for(int i = 0; i<directions.length;i++){
      list[i]= getRichtungPositionen(directions[i], length, index);
    }
    return list;
  }

  List<int> getRichtungPositionen(int direction, int length, int index) {
    List<int> position = [];
    bool rand = false;
    for (int i = 1; i <= length&&!rand; i++) {
      switch (direction) {
        case 0:
          position.add(index - (8 * i));
          if(!colCheck(position.last,index)){
            position.removeLast();
          }
          break;
        case 1:
          position.add(index - (7 * i));
          rand = diagonalCheck(position.last);
          break;
        case 2:
          position.add(index + (1 * i));
          if(!rowCheck(position.last,index)){
            position.removeLast();
          }
          break;
        case 3:
          position.add(index + (9 * i));
          rand = diagonalCheck(position.last);
          break;
        case 4:
          position.add(index + (8 * i));
          if(!colCheck(position.last,index)){
            position.removeLast();
          }
          break;
        case 5:
          position.add(index + (7 * i));
          rand = diagonalCheck(position.last);
          break;
        case 6:
          position.add(index - (1 * i));
          if(!rowCheck(position.last,index)){
            position.removeLast();
          }
          break;
        case 7:
          position.add(index - (9 * i));
          rand = diagonalCheck(position.last);
          break;
      }


    }
    return position;
  }
  bool diagonalCheck(int neW){
    int row2 = neW ~/ 8;
    int column2 = neW % 8;
    return(row2==0||row2==7||column2==0||column2==7);
  }
  bool rowCheck(int old, int neW){
  int row = old ~/ 8;
  int row2 = neW ~/ 8;
  return(row==row2);
  }
  bool colCheck(int old, int neW){
  int column = old % 8;
  int column2 = neW % 8;
  return(column==column2);
  }

}
