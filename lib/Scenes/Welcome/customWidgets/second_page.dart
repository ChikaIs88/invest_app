import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(children: [
      const SizedBox(
        height: 50,
      ),
      Image.asset(
        'assets/images/b2c.png',
        scale: 0.5,
        height: size.height * 0.5,
      ),
      Image.asset(
        'assets/images/p2.png',
        height: 50,
        width: 50,
      ),
      Text(
        'Reach out and find New investors',
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
        'Connect with Interested investors daily',
        style: GoogleFonts.quicksand(
          color: const Color(0x99FFFFFF),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
      ),
    ]);
  }
}
