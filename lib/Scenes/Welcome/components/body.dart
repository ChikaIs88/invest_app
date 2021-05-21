import 'package:flutter/material.dart';
import 'package:invest_app/Scenes/Welcome/components/background.dart';
import 'package:invest_app/Scenes/Welcome/customWidgets/first_page.dart';
import 'package:invest_app/Scenes/Welcome/customWidgets/second_page.dart';
import 'package:invest_app/Scenes/Welcome/customWidgets/third_page.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final PageController _pageViewController = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Background(
        child: PageView(
          controller: _pageViewController,
          children: [
            FirstPage(),
            SecondPage(),
            ThirdPage(),
          ],
        ),
      ),
    );
  }
}
