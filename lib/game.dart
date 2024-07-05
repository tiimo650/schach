import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schach/board_field.dart';
import 'package:schach/chessFiguren/pawn.dart';
import 'package:schach/widgets/game_widget.dart';
import 'package:schach/widgets/history_widget.dart';
import 'package:schach/variables/styles.dart';
import 'package:schach/spielfigur.dart';
import 'package:schach/layout_figuren.dart';
import 'dart:ui';

import 'package:schach/variables/variables.dart';
enum Status {
  schachmatt, schach, remis, weiter,
}

class Game extends StatefulWidget {
  Game({super.key, required this.function});

  static List<List<Spielfigur?>> geschlageneFiguren = [[],[]];
  static int currentSelected = -1;
  static Status status = Status.weiter;
  final Function function;
  static List<List<String>> history = [
    [

    ],
    [

    ]
  ];
  static Colour currentPlayer = Colour.white;
  static List<List<int>> fields = [[]];
  late List<Spielfigur?> figurenliste = Layoutfiguren().getSpielfiguren(0);

  //late GameWidget gameWidget = GameWidget(figurenliste: figurenliste);

  final title = "  SCHACH  ";

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  late List<Spielfigur?> figurenliste = widget.figurenliste;

  //late GameWidget gameWidget = widget.gameWidget;
  @override
  Widget build(BuildContext context) {
      function(){
      widget.function();
      setState(() {

      });
      setState(() {
        widget.function();
      });
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
        ),
        backgroundColor: Color.fromRGBO(75, 107, 128, 1.0),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              MdiIcons.chessQueen,
              color: Colors.white,
            ),
            const Text(
              "PLAY",
              style: Styles.gameTitle,
            ),

            Icon(MdiIcons.chessKing, color: Colors.white),
            Text("  ${Game.status}",
              style: Styles.boldMiddle,
            ),
          ],
        ),
        toolbarHeight: kToolbarHeight*0.8,
      ),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter,
          colors: [
            Color.fromRGBO(30, 30, 30, 0.6196078431372549),
            Color.fromRGBO(255, 255, 255, 0.3411764705882353),
          ]),
            //color: const Color.fromRGBO(133, 154, 148, 0.3411764705882353),
          ),

        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HistoryWidget(history: Game.history, colour: Colour.white),
              //Expanded(child: Center()),
              SizedBox(
                width: MediaQuery.sizeOf(context).height * 0.95,
              ),
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



