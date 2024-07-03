import 'package:flutter/material.dart';
import 'package:schach/boardField.dart';
import 'package:schach/spielfigur.dart';
import 'package:schach/layout_figuren.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  static int currentSelected = -1;
  static List<List<int>> fields = [[]];
  final title = "Schach spielen";

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  late bool test3 = false;
  late var temp;

  late List<Spielfigur?> figurenliste = Layoutfiguren().getSpielfiguren();
  int aktiverSpieler = 0;

  //late List<Spielfigur> figurenliste = List.generate(64, (int index) => Spielfigur(id: index, color: "color"));
  /*  late List<Boardfield> list = List.generate(64, (index) {
    return Boardfield(
        id: index, spielfigur: figurenliste[index], function: );
  });*/

  @override
  Widget build(BuildContext context) {
    /*Function function1 = (){
      setState(() {

      });
    };*/
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).height * 0.95,
          child: GridView.count(
              crossAxisCount: 8,
              children: List.generate(64, (index) {
                return GestureDetector(
                  onTap: () {
                    debugPrint("$index");
                    if (figurenliste[index] != null) {
                      setState(() {
                        Game.currentSelected = index;
                        changeDots(figurenliste[index] as Spielfigur);
                      });
                    }
                  },
                  child: Boardfield(
                      id: index,
                      spielfigur: figurenliste[index],
                      function: () {
                        setState(() {});
                      }),
                );
              })),
        ),
      ),
    );
  }

  void changeDots(Spielfigur spielfigur) {
    Game.fields = spielfigur.getPositions();
    checkDots(figurenliste);
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
            killlist.add(liste[i][j]);
          }
          delete = true;
        } else if (delete) {
          liste[i].removeRange(j, liste[i].length);
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

  bool ListContains(List<Spielfigur> liste, int id) {
    for (int i = 0; i < liste.length; i++) {
      if (liste[i].id == id) {
        return true;
      }
    }
    return false;
  }
}
