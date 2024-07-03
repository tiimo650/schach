import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

abstract class Spielfigur extends StatelessWidget {
  final int id;
  final String color;
  final IconData icon;

  const Spielfigur(
      {super.key, required this.id, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Icon(
      icon,
      color: getColor(color),
      size: (MediaQuery.sizeOf(context).width * 0.05 + 5),
    ));
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
}
