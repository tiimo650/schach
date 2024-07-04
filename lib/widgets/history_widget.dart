import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schach/game.dart';
import 'package:schach/main.dart';
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

    return Column(children: [
      Text(
        colourString,
        style: Styles.getStyle(colour),
      ),
      Text(
        "Moves: ${(colour==Colour.white) ? history[0].length : history[1].length}",
        style: const TextStyle(fontSize: 40),
      ),
      SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.5,
        width: MediaQuery.sizeOf(context).width * 0.21,
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          itemCount: (colour==Colour.white) ? history[0].length : history[1].length,
          itemBuilder: (context, index) => Center(
            child: ListTile(
              title: Text((colour==Colour.white) ? history[0][index] : history[1][index], style: Styles.boldMiddle),
            ),
          ),
        ),
      ),
      //hier jetzt geschlagene figuren anzeigen
      Center(
        child: Text(
          "geschlagene Figuren:",style: Styles.redSmall,
        ),
      ),
      (Game.geschlageneFiguren.isNotEmpty) ? Geschlagene(): Center(),

    ]);
  }
}



class GeschlageneFiguren extends StatelessWidget {
  final List<Spielfigur> list;
  const GeschlageneFiguren({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).height * 0.25,
      height: MediaQuery.sizeOf(context).width * 0.1,
      child: GridView.count(crossAxisCount: 5, children:
        list
      ),
    );
  }
}

class Geschlagene extends StatefulWidget {
  const Geschlagene({super.key});

  @override
  State<Geschlagene> createState() => _GeschlageneState();
}

class _GeschlageneState extends State<Geschlagene> {
  @override
  Widget build(BuildContext context) {
    List<Spielfigur> list = Game.geschlageneFiguren;
    list[0].size = 1;

    return SizedBox(
      width: MediaQuery.sizeOf(context).height * 0.3,
      height: MediaQuery.sizeOf(context).width * 0.15,
      child: GridView.count(mainAxisSpacing: 40, crossAxisSpacing: 0, crossAxisCount: 5, children:
      List.generate(list.length, (int index) => SizedBox(
        child: list[index],
      ))
      ),
    );
  }
}

