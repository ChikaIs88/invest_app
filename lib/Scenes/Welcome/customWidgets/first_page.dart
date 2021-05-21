import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:google_fonts/google_fonts.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(children: [
      const SizedBox(
        height: 50,
      ),
      Image.asset(
        'assets/images/first.png',
        scale: 0.5,
        height: size.height * 0.5,
      ),
      Image.asset(
        'assets/images/p1.png',
        height: 50,
        width: 50,
      ),
      Text(
        'Make your dream investment today!',
        style: GoogleFonts.quicksand(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 15,
      ),
      Text(
        'Find Investment options that suit your needs',
        style: GoogleFonts.quicksand(
          color: const Color(0x99FFFFFF),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 15,
      ),
    ]);
  }
}
