import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:invest_app/Scenes/Welcome/components/background.dart';
//import 'package:flutter_svg/svg.dart';
//import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(children: <Widget>[
      Expanded(
          flex: 2,
          child: Center(
              child: Image.asset(
                  'C:/Users/Dell latitude 5470/Documents/Development/develop/flutter/invest_app/lib/assets/images/first.png')
              /*child: Text(
          'Make your Dream Investment today',
          style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: const Color(0xFF000000),
          ),*/
              )),
      const Expanded(
        flex: 2,
        child: SizedBox(),
      )
    ]);
  }
}

/*@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial',
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Flutter Tutorial'),
          ),
        ),
        body: Center(
          child: Text(
            'Hello World! Welcome to TutorialKart for this awesome Flutter Tutorial on Text widget.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}*/
