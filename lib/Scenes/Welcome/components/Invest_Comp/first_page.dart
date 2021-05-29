import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invest_app/Scenes/Welcome/components/background.dart';
import 'package:invest_app/Scenes/Welcome/components/Investor/LoginInv.dart';
import 'package:invest_app/Scenes/Welcome/components/Invest_Comp/LoginM.dart';
import 'package:invest_app/Scenes/Welcome/components/Invest_Comp/LoginS.dart';



class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
          body: Background(
          child: Column(children: [
        const SizedBox(
          height: 50,
        ),
        Image.asset(
          'assets/images/first.png',
          scale: 0.5,
          height: size.height * 0.5,
        ),
        Text(
          'Just to be sure...',
          style: GoogleFonts.quicksand(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          'Select your Consulant type.',
          style: GoogleFonts.quicksand(
            color: const Color(0x99FFFFFF),
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 60,
        ),
        ElevatedButton(
          child: Text(
            'Main Consultant',
            style: GoogleFonts.quicksand(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: Colors.green,
            minimumSize: const Size(300, 50),
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => LoginM(),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          child: Text(
            'Secondary consultant',
            style: GoogleFonts.quicksand(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: Colors.white,
            minimumSize: const Size(300, 50),
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => LoginS(),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        FlatButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => LoginInv(),
            ),
          ),
          child: Text(
            'Are you an Investor, click here!',
            style: GoogleFonts.quicksand(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ])),
    );
  }
}
