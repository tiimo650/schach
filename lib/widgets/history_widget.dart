
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:schach/game.dart';
import 'package:schach/home_page/main.dart';
import 'package:schach/variables/styles.dart';
import 'package:schach/variables/variables.dart';
import 'package:schach/widgets/game_widget.dart';

import '../spielfigur.dart';

class HistoryWidget extends StatefulWidget {
  final List<List<String>> history;
  final Colour colour;

  const HistoryWidget({super.key, required this.history, required this.colour});

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Colour colour = widget.colour;
    final String colourString = (colour == Colour.white) ? "WHITE" : "BLACK";
    final List<List<String>> history = widget.history;
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());

    return Expanded(
      child: Container(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getAktiveFarbeAnzeige(colourString),
              Text(
                "Moves: ${(colour == Colour.white) ? history[0].length : history[1].length}",
                style: const TextStyle(fontSize: 40),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.47,
                width: MediaQuery.sizeOf(context).width * 0.21,
                child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  itemCount: (colour == Colour.white)
                      ? history[0].length
                      : history[1].length,
                  itemBuilder: (context, index) => Center(
                    child: ListTile(
                      title: Text(
                          (colour == Colour.white)
                              ? history[0][index]
                              : history[1][index],
                          style: Styles.boldMiddle),
                    ),
                  ),
                ),
              ),
              //hier jetzt geschlagene figuren anzeigen
              Center(
                child: Text(
                  "geschlagene Figuren:",
                  style: Styles.boldMiddle,
                ),
              ),
              const Divider(color: Color.fromRGBO(1, 1, 1, 0)),
              SizedBox(
                width: MediaQuery.sizeOf(context).height * 0.35,
                height: MediaQuery.sizeOf(context).width * 0.175,
                child: Material(
                  elevation: 30,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          //begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          begin: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 78, 78, 78),
                            Color.fromARGB(255, 204, 204, 204),
                          ]),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: (Game.geschlageneFiguren.isNotEmpty)
                        ? Geschlagene(colour: colour,)
                        : Center(),
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  Widget getAktiveFarbeAnzeige(String colourString) {


  if(Game.currentPlayer == widget.colour){
    return Material(
      //die Elevation wird bei dem aktiven Spieler angezeigt
      elevation: 15,
      borderRadius: BorderRadius.circular(10),

      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(215, 216, 216, 1.0),
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Text(
          colourString,
          style: Styles.getStyle(widget.colour),
        ),
      ),
    );
  }
  return Material(
    //die Elevation wird bei dem aktiven Spieler angezeigt
    color: const Color.fromRGBO(0, 0, 0, 0),
    child: Container(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 2),
      child: Text(
        colourString,
        style: Styles.getStyle(widget.colour),
      ),
    ),
  );



  }
}

class Geschlagene extends StatefulWidget {
  final Colour colour;
  const Geschlagene({super.key, required this.colour});

  @override
  State<Geschlagene> createState() => _GeschlageneState();
}

class _GeschlageneState extends State<Geschlagene> {
  final ScrollController _scrollController = ScrollController();


  void _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Spielfigur?> list = (widget.colour==Colour.white) ? Game.geschlageneFiguren[0] : Game.geschlageneFiguren[1] ;
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());

    return GridView.count(
        controller: _scrollController,
        mainAxisSpacing: 40,
        crossAxisSpacing: 0,
        crossAxisCount: 5,
        children: List.generate(
            list.length,
            (int index) => SizedBox(
                  child: getSpielfigurFromList(list, index),
                )));
  }
}

Spielfigur? getSpielfigurFromList(List<Spielfigur?> list, int index) {
  list[index]?.size = (MyHomePage.mediawidth * 0.04);
  return list[index];
}
