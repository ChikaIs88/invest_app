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
            top: 0,
            left: 0,
            child:
                Image.asset('assets/images/blank.png', width: size.width * 0.5),
          ),
          child,
        ],
      ),
    );
  }
}
