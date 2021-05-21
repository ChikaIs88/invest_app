import 'package:flutter/material.dart';
import 'package:invest_app/Scenes/Welcome/customWidgets/splash.dart';
import 'package:google_fonts/google_fonts.dart';

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
        'I & I',
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
                 minimumSize: const Size(150,50),         
               ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Splash(),
          ),
        ),
        // style: ButtonStyle(
        //   backgroundColor: MaterialStateProperty.all(Colors.white), 
        //   padding: MaterialStateProperty.all(
        //     const EdgeInsets.fromLTRB(
        //       100,
        //       15,
        //       100,
        //       15)
        //     ),
        //   textStyle: MaterialStateProperty.all(const TextStyle(
        //     fontSize: 20,
        //     color: Colors.green,
        //     )
        //   ),
        // // borderSide: const BorderSide(
        // //   color: Colors.white,
        // // ),
        // ),
        
      ),
      // OutlineButton(
      //   child: const Text('Investment Company'),
      //   borderSide: const BorderSide(
      //     color: Colors.black,
      //   ),
      //   onPressed: () {
      //     print("HELLO");
      //   },
      // ),
    ]);
  }
}
