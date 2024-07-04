import 'package:flutter/material.dart';

import '../board_field.dart';
import '../chessFiguren/pawn.dart';
import '../game.dart';
import '../layout_figuren.dart';
import '../spielfigur.dart';
import '../variables/variables.dart';

class GameWidget extends StatefulWidget {
  final List<Spielfigur?> figurenliste;

  final Function function;
  GameWidget({super.key, required this.figurenliste, required this.function});

  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {

  late List<Spielfigur?> figurenliste = widget.figurenliste;

  void setHistory( int indexOld, int indexNew,) {
    String n = "";
    int i = (figurenliste[indexOld]?.color == Colour.white) ? 0 : 1;
    n += Functions.getFieldName(indexOld);
    n += " --> ";
    n += Functions.getFieldName(indexNew);
    Game.history[i].add(n);
  }



  @override
  Widget build(BuildContext context) {

    return Center(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).height * 0.95,
        child: GridView.count(
            crossAxisCount: 8,
            children: List.generate(64, (index) {
              return GestureDetector(
                onTap: () {
                  debugPrint("$index");
                  if (intListContains(index)) {
                    setHistory(Game.currentSelected, index);
                    setState(() {
                      if(figurenliste[index]!=null){
                        //wenn jmd auf diesem feld steht wird er geschlagen und in die liste eingetragen
                        Game.geschlageneFiguren.add(figurenliste[index] as Spielfigur);
                        widget.function();
                      }
                      widget.function();
                      Spielfigur? tempSpielfigur =
                      figurenliste[Game.currentSelected];
                      figurenliste[index] = tempSpielfigur;
                      figurenliste[Game.currentSelected] = null;
                      figurenliste[index]?.id = index;
                      Game.fields = [[]];
                      if (Game.currentPlayer == Colour.white) {
                        Game.currentPlayer = Colour.black;
                      } else {
                        Game.currentPlayer = Colour.white;
                      }
                      Game.currentSelected = -1;
                    });
                  } else if (figurenliste[index] != null &&
                      figurenliste[index]?.color == Game.currentPlayer) {
                    setState(() {
                      widget.function();
                      Game.currentSelected = index;
                      changeDots(figurenliste[index] as Spielfigur);
                    });
                  }
                },
                child: Boardfield(
                    id: index,
                    spielfigur: figurenliste[index],
                    function: () {
                      setState(() {
                        widget.function();
                      });
                    }),
              );
            })),
      ),
    );
  }

  void changeDots(Spielfigur spielfigur) {
    Game.fields = spielfigur.getPositions();
    checkDots(figurenliste);
  }

  bool intListContains(int index) {
    for (List<int> i in Game.fields) {
      if (i.contains(index)) {
        return true;
      }
    }
    return false;
  }



  void checkDots(List<Spielfigur?> figurenliste) {
    List<List<int>> liste = Game.fields;
    List<int> killlist = [];

    for (int i = 0; i < liste.length; i++) {
      //jede Liste der liste durchgehen
      bool delete = false;

      for (int j = liste[i].indexOf(Game.currentSelected) + 1;
      j < liste[i].length;
      j++) {
        // zu der position ( in der Liste) gehen wo das aktuell ausgewählte element ist
        //dann bei aktueller figur starten und dann weiter gehen auf dem weg in plus richtung
        var aktuellesObjekt = figurenliste[liste[i][j]];
        if (aktuellesObjekt != null) {
          // schauen ob an aktueller position schon eine figur ist

          if (aktuellesObjekt.color !=
              figurenliste.elementAt(Game.currentSelected)?.color &&
              !delete) {
            if (figurenliste[Game.currentSelected] is! Pawn) {
              killlist.add(liste[i][j]);
            } else if (i == 0) {
              liste[i][j] = -1;
            } else {
              killlist.add(liste[i][j]);
            }
          } else {
            liste[i][j] = -1;
          }
          delete = true;
        } else if (delete) {
          liste[i].removeRange(j, liste[i].length);
        } else if (figurenliste[Game.currentSelected] is Pawn && i > 0) {
          //pawn diagonal attack
          liste[i][j] = -1;
        }
      }
    }
    //zweimal das ganze weil es ausgehend von der aktuellen figur in beide richtungen jeder liste gehen muss ( hier unten in die negative richtung)
    for (int i = 0; i < liste.length; i++) {
      //jede Liste der liste durchgehen
      bool delete = false;
      for (int j = liste[i].indexOf(Game.currentSelected) - 1; j >= 0; j--) {
        // zu der position ( in der Liste) gehen wo das aktuell ausgewählte element ist
        //dann bei aktueller figur starten und dann weiter gehen auf dem weg in plus richtung
        var aktuellesObjekt = figurenliste[liste[i][j]];
        if (aktuellesObjekt != null) {
          // schauen ob an aktueller position schon eine figur ist
          if (aktuellesObjekt.color !=
              figurenliste.elementAt(Game.currentSelected)?.color &&
              !delete) {
            killlist.add(liste[i][j]);
          }
          delete = true;
        } else if (delete) {
          liste[i].removeRange(0, j);
        }
      }
    }
    liste.add(killlist); // liste mit gegnern am ende einfügen
    Game.fields = liste;
  }

  bool listContains(List<Spielfigur> liste, int id) {
    for (int i = 0; i < liste.length; i++) {
      if (liste[i].id == id) {
        return true;
      }
    }
    return false;
  }
}
