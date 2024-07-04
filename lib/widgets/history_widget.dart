import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schach/variables/styles.dart';
import 'package:schach/variables/variables.dart';

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
      Container(
        child: SizedBox(
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
      )
    ]);
  }
}
