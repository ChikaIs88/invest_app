import 'package:flutter/material.dart';
import 'package:invest_app/Scenes/Welcome/welcome_screen.dart';
import 'package:invest_app/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Investment App',
      theme: ThemeData(
          primaryColor: kPrimaryColor, scaffoldBackgroundColor: Colors.white),
      home: WelcomeScreen(),
    );
  }
}
