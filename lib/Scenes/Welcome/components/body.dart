import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:invest_app/Scenes/Welcome/components/background.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Background(
        child: SizedBox(
      width: double.infinity,
      child: Column(children: <Widget>[
        Expanded(
            flex: 2,
            child: Column(children: <Widget>[
              Image.asset(
                'assets/images/first.png',
                height: 300,
                width: 300,
              ),
              Text('Find Investment options that suit your needs',
                  style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: const Color(0xFFFFFFFF),
                    //textAlign: TextAlign.center,
                  )),
              Text('Find Investment options that suit your needs',
                  style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: const Color(0xB3FFFFFF),
                    //textAlign: TextAlign.center,
                  ))
            ])),
        const Expanded(
          flex: 2,
          child: SizedBox(),
        )
      ]),
    ));
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
