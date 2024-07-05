import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../game.dart';
import '../variables/styles.dart';
import 'main.dart';

class RowPiece extends StatelessWidget {
  final String title;
  final IconData icon;
  const RowPiece({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.sizeOf(context);
    return Container(
      padding: EdgeInsets.all(60),
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          width: media.width*0.23,
          height: media.width*0.23,
          child: Container(
            child: TextButton(
                onPressed: () {
                  Navigator.push(context, ShrinkingAppBarRoute(page: Game()));
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      icon,
                      color: const Color.fromRGBO(75, 107, 128, 0.575),
                      size: media.width*0.21,
                    ),
                    Text(title, style: Styles.playTITLE(media.width)),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
