import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schach/home_page/row_piece.dart';
import 'package:schach/variables/styles.dart';

import '../game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'SCHACH'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  static var mediaheight;
  static var mediawidth;
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    MyHomePage.mediaheight = MediaQuery.sizeOf(context).height;
    MyHomePage.mediawidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
        ),
        backgroundColor: Color.fromRGBO(75, 107, 128, 1.0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              MdiIcons.chessQueen,
              color: Colors.white,
            ),
            Text(
              widget.title,
              style: Styles.gameTitle,
            ),
            Icon(MdiIcons.chessKing, color: Colors.white),
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
          RowPiece(title: "PLAY", icon: MdiIcons.chessKing),
          const RowPiece(title: "SETTINGS", icon: Icons.settings),
          const RowPiece(title: "STATISTICS", icon: Icons.analytics),
        ]),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//animationsroute
class ShrinkingAppBarRoute extends PageRouteBuilder {
  final Widget page;

  ShrinkingAppBarRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
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
                Text(
                  "SCHACH",
                  style: Styles.gameTitle,
                ),
                Icon(MdiIcons.chessKing, color: Colors.white),
              ],
            ),
            toolbarHeight:
                Tween<double>(begin: kToolbarHeight, end: kToolbarHeight * 0.8)
                    .animate(animation)
                    .value,
          ),
          body: child,
        );
      },
      child: child,
    );
  }
}
