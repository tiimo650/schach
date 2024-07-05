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
    function(){
      setState(() {

      });
    }
    MyHomePage.mediaheight = MediaQuery.sizeOf(context).height;
    MyHomePage.mediawidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight * 1.7),
        child: AppBar(
          elevation: 5,
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          backgroundColor: Color.fromRGBO(75, 107, 128, 1.0),
          flexibleSpace: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  MdiIcons.chessQueen,
                  color: Colors.white,
                  size: Styles.gameTitleHome.fontSize,
                ),
                Text(
                  widget.title,
                  style: Styles.gameTitleHome,
                ),
                Icon(
                  MdiIcons.chessKing,
                  color: Colors.white,
                  size: Styles.gameTitleHome.fontSize,
                ),
              ],
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
          gradient: LinearGradient(
          //begin: Alignment.bottomCenter,
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
          colors: [
            Color.fromRGBO(161, 213, 218, 1.0),
            Color.fromRGBO(69, 109, 122, 1.0),
            //Color.fromARGB(100, 78, 78, 78),
            //Color.fromARGB(100, 204, 204, 204),
          ]),
      //borderRadius: BorderRadius.all(Radius.circular(20)),
    ),

            //color: const Color.fromRGBO(151, 166, 181, 1.0),
          ),
          Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            RowPiece(title: "PLAY", icon: MdiIcons.chessKing, page: Game(function: function,),function: function,),
            RowPiece(title: "SETTINGS", icon: Icons.settings, page: Center(),function: function,),
            RowPiece(title: "STATISTICS", icon: Icons.analytics, page: Center(),function: function,),
          ]),
        ),
      ]
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//animationsroute
class ShrinkingAppBarRoute extends PageRouteBuilder {
  final Game page;
  final String appBarTitle;

  ShrinkingAppBarRoute({required this.appBarTitle, required this.page})
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
                  appBarTitle,
                  style: Styles.gameTitle,
                ),
                Text(
                  Game.status.toString(),
                  style: Styles.boldMiddle,
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
