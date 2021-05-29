import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invest_app/Scenes/Welcome/components/Investor/LoginInv.dart';
import 'package:invest_app/Scenes/Welcome/components/Investor/PForm.dart';
import 'package:invest_app/Scenes/Welcome/components/Invest_Comp/first_page.dart';


class RegInv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(children: [
          Container(
            color: Colors.green,
            height: 200,
            width: size.width,
            child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Sign Up',
                      style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      // ignore: lines_longer_than_80_chars
                      'Signing up for Chipin is fast and free. No commitments or long-term contracts.',
                      style: GoogleFonts.quicksand(
                        color: const Color(0x99FFFFFF),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  ],
                )),
          ),
          const SizedBox(
            height: 5,
          ),
          FlatButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => FirstPage(),
              ),
            ),
            child: Text(
              'Are you an investment company instead, Click here',
              style: GoogleFonts.quicksand(
                  color: Colors.green,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          'Full Name',
                          style: GoogleFonts.quicksand(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          child: TextField(
                        autocorrect: true,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              
                            ),
                            labelText: 'Full Name',
                            labelStyle: GoogleFonts.quicksand(
                              color: const Color(0xFF9E9E9E),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            hintText:
                                // ignore: lines_longer_than_80_chars
                                'Enter your Full name'),
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          'Emails',
                          style: GoogleFonts.quicksand(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          child: TextField(
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Emails',
                            labelStyle: GoogleFonts.quicksand(
                              color: const Color(0xFF9E9E9E),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            hintText:
                                // ignore: lines_longer_than_80_chars
                                'Enter valid email id as abc@gmail.com'),
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          'Password',
                          style: GoogleFonts.quicksand(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          child: TextField(
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'xxxxxxxx',
                            labelStyle: GoogleFonts.quicksand(
                              color: const Color(0xFF9E9E9E),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            hintText:
                                // ignore: lines_longer_than_80_chars
                                'Enter a pass word that is 8 characters or more'),
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          'Phone Number',
                          style: GoogleFonts.quicksand(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          child: TextField(
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: '+234XXXXXXXXXX',
                            labelStyle: GoogleFonts.quicksand(
                              color: const Color(0xFF9E9E9E),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            hintText:
                                // ignore: lines_longer_than_80_chars
                                'Enter a pass word that is 8 characters or more'),
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text(
                    'SIGN UP',
                    style: GoogleFonts.quicksand(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Colors.green,
                    minimumSize: const Size(250, 50),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PForm(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                FlatButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoginInv(),
                    ),
                  ),
                  child: Text(
                    'Have an account, Sign In!',
                    style: GoogleFonts.quicksand(
                      color: Colors.green,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
