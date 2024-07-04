import 'package:schach/spielfigur.dart';
import 'package:schach/chessFiguren/bishop.dart';
import 'package:schach/chessFiguren/king.dart';
import 'package:schach/chessFiguren/knight.dart';
import 'package:schach/chessFiguren/queen.dart';
import 'package:schach/chessFiguren/rook.dart';
import 'chessFiguren/pawn.dart';

class Layoutfiguren {

    List<Spielfigur> white = [];
    List<Spielfigur> black = [];
    List<Spielfigur?> liste = [];

    Layoutfiguren();

    //die beiden methoden brauch ich eigentlich nicht?
    List<Spielfigur> getWhite(){
        white.removeRange(0, white.length);
        for(int i = 0; i<16;i++){
            white.add(liste[i]!);
        }
        return white;
    }
    List<Spielfigur> getBlack(){
        black.removeRange(0, black.length);
        for(int i = 0; i<16;i++){
            black.add(liste[i]!);
        }
        return black;
    }

    List<Spielfigur?> getSpielfiguren(int option) {
        switch(option){
            case 0:
                liste.add(Rook(id: 0, color: "white"));
                liste.add(Knight(id: 1, color: "white"));
                liste.add(Bishop(id: 2, color: "white"));
                liste.add(Queen(id: 3, color: "white"));
                liste.add(King(id: 4, color: "white"));
                liste.add(Bishop(id: 5, color: "white"));
                liste.add(Knight(id: 6, color: "white"));
                liste.add(Rook(id: 7, color: "white"));
                liste +=
                    List.generate(8, (int index) => Pawn(id: index + 8, color: "white"));
                liste += List.generate(32, (int index) => null);
                liste +=
                    List.generate(8, (int index) => Pawn(id: index + 48, color: "black"));
                liste.add(Rook(id: 56, color: "black"));
                liste.add(Knight(id: 57, color: "black"));
                liste.add(Bishop(id: 58, color: "black"));
                liste.add(Queen(id: 59, color: "black"));
                liste.add(King(id: 60, color: "black"));
                liste.add(Bishop(id: 61, color: "black"));
                liste.add(Knight(id: 62, color: "black"));
                liste.add(Rook(id: 63, color: "black"));
                break;
            case 1:
                liste.add(Rook(id: 0, color: "white"));
                liste.add(Knight(id: 1, color: "white"));
                liste.add(Bishop(id: 2, color: "white"));
                liste.add(Queen(id: 3, color: "white"));
                liste.add(King(id: 4, color: "white"));
                liste.add(Bishop(id: 5, color: "white"));
                liste.add(Knight(id: 6, color: "white"));
                liste.add(Rook(id: 7, color: "white"));
                liste +=
                    List.generate(8, (int index) => Pawn(id: index + 8, color: "white"));
                liste += List.generate(32, (int index) => null);
                liste +=
                    List.generate(8, (int index) => Pawn(id: index + 48, color: "black"));
                liste.add(Rook(id: 56, color: "black"));
                liste.add(Knight(id: 57, color: "black"));
                liste.add(Bishop(id: 58, color: "black"));
                liste.add(Queen(id: 59, color: "black"));
                liste.add(King(id: 60, color: "black"));
                liste.add(Bishop(id: 61, color: "black"));
                liste.add(Knight(id: 62, color: "black"));
                liste.add(Rook(id: 63, color: "black"));


                //rook test
                liste.removeAt(28);
                liste.insert(28, Knight(id: 28, color: "black"));
                liste.removeAt(17);
                liste.insert(17, Knight(id: 17, color: "black"));
                liste.removeAt(41);
                liste.insert(41, Knight(id: 41, color: "white"));
                break;

            case 2:
                liste += List.generate(64, (int index) => null);
                liste.removeAt(35);
                liste.insert(35, Knight(id: 35, color: "white"));
                liste.removeAt(2);
                liste.insert(2, Knight(id: 2, color: "white"));
                break;
        }


        return liste;
    }
}
