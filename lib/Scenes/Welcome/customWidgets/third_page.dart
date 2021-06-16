import 'package:flutter/material.dart';
import 'package:chipln/Scenes/Welcome/components/Investor/LoginInv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chipln/Scenes/Welcome/components/Invest_Comp/first_page.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(children: [
      const SizedBox(
        height: 50,
      ),
      Image.asset(
        'assets/images/b3c.png',
        scale: 0.5,
        height: size.height * 0.5,
      ),
      Image.asset(
        'assets/images/p3.png',
        height: 50,
        width: 50,
      ),
      // const Padding(
      //   padding: EdgeInsets.fromLTRB(
      //     10,
      //     2,
      //     10,
      //     2),
      //   ),

      const Text(
        'ChipIn',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 70,
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        'Connecting the need to those in need',
        style: GoogleFonts.quicksand(
          color: const Color(0x99FFFFFF),
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontSize: 22,
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 15,
      ),
      ElevatedButton(
        child: const Text('Investor'),
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.green,
          primary: Colors.white,
          minimumSize: const Size(250, 50),
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => LoginInv(),
          ),
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      ElevatedButton(
        child: const Text('Investment Company'),
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.green,
          primary: Colors.white,
          minimumSize: const Size(250, 50),
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => FirstPage(),
          ),
        ),
      ),
    ]);
  }
}
