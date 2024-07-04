import 'dart:core';

import 'package:flutter/material.dart';
import 'package:schach/game.dart';
import 'package:schach/spielfigur.dart';

class Boardfield extends StatefulWidget {
  final int id;
  final Spielfigur? spielfigur;
  late BoxDecoration dec = BoxDecoration(
      border: Border.all(width: 0.5, color: Colors.black), color: getColor(id));

  Function() function;
  late bool temp;

  Boardfield(
      {super.key,
      required this.id,
      required this.spielfigur,
      required this.function});

  @override
  State<Boardfield> createState() => _BoardfieldState();
}

class _BoardfieldState extends State<Boardfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: getdec(widget.id),
      child: getChild(widget.id, widget.spielfigur, context),
    );
  }
}

BoxDecoration getdec(int id) {
  if (Game.currentSelected == id) {
    return BoxDecoration(
        border: Border.all(width: 2, color: Colors.blueAccent),
        color: getColor(id));
  }
  return BoxDecoration(
      border: Border.all(width: 0.5, color: Colors.black), color: getColor(id));
}

Widget getChild(int id, var spielfigur, var context) {
  List<List<int>> fields = Game.fields;
  if (listContains(fields, id) && spielfigur == null) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(0, 0, 0, 0.22),
      ),
      margin: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.02),
    );
  }
  if (spielfigur == null) {
    return Container();
  } else if (isLastList(fields, id)){ // wenn in der letzten liste der liste ( die killliste) das element ist, dann wird der kreis rot und über dem gegner angezeigt.
    return Stack(
      children: [
        Center(
          child: spielfigur,
        ),
      Center(
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromRGBO(175, 0, 0, 0.6980392156862745)
          ),
          margin: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.022),
        ),
      )
      ],
    );
  }
  return spielfigur;
}

bool isLastList(List<List<int>> fields, int id){
  if(fields.last.contains(id)){
    return true;
  }
  return false;
}

bool listContains(List<List<int>> liste, int id){
  for(List<int> i in liste){
    if(i.contains(id)){
      return true;
    }
  }
  return false;
}


Color getColor(int index) {
  bool isEvenRow = (index ~/ 8).isEven;
  bool isEvenColumn = index.isEven;
  bool isWhite = (isEvenRow && isEvenColumn) || (!isEvenRow && !isEvenColumn);
  return isWhite
      ? const Color.fromRGBO(239, 217, 141, 1.0)
      : const Color.fromRGBO(80, 36, 13, 1.0);
}
