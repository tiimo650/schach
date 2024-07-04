import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schach/board_field.dart';
import 'package:schach/chessFiguren/pawn.dart';
import 'package:schach/widgets/game_widget.dart';
import 'package:schach/widgets/history_widget.dart';
import 'package:schach/variables/styles.dart';
import 'package:schach/spielfigur.dart';
import 'package:schach/layout_figuren.dart';
import 'dart:ui';

import 'package:schach/variables/variables.dart';

class Game extends StatefulWidget {
  Game({super.key});

  static int currentSelected = -1;
  static List<List<String>> history = [
    [
      "s",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "s"
    ],
    [
      "a",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "a"
    ]
  ];
  static Colour currentPlayer = Colour.white;
  static List<List<int>> fields = [[]];
  late List<Spielfigur?> figurenliste = Layoutfiguren().getSpielfiguren(0);

  //late GameWidget gameWidget = GameWidget(figurenliste: figurenliste);

  final title = "Schach spielen";

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  late Function function = () {
    setState(() {});
  };
  late List<Spielfigur?> figurenliste = widget.figurenliste;

  //late GameWidget gameWidget = widget.gameWidget;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(children: [
        Container(
          color: const Color.fromRGBO(133, 154, 148, 0.3411764705882353),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          HistoryWidget(history: Game.history, colour: Colour.white),
          Expanded(child: Center()),
          HistoryWidget(history: Game.history, colour: Colour.black),
        ]),
        GameWidget(
          figurenliste: figurenliste,
          function: function,
        ),
      ]),
    );
  }
}
