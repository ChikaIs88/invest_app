import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  // ignore: sort_constructors_first
  const Background({Key? key, required this.child, children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 3,
            left: 3,
            child: Image.asset(
              'assets/images/blank.png',
              width: 100,
              height: 100,
            ),
          ),
          child,
        ],
      ),
    );
  }
}

//width: size.width * 0.5
