import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chipln/Scenes/Welcome/components/Investor/RegInv.dart';
import 'package:chipln/Scenes/Welcome/components/Investor/LoginInv.dart';

class LoginS extends StatelessWidget {
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
                      height: 50,
                    ),
                    Text(
                      'Welcome',
                      style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Happy to see you again!',
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
            height: 10,
          ),
          FlatButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => LoginInv(),
              ),
            ),
            child: Text(
              'Are you an investor instead, Click here',
              style: GoogleFonts.quicksand(
                  color: Colors.green,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 40,
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
                          'Consultant Name',
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
                            border: const OutlineInputBorder(),
                            labelText: 'Consultant Name',
                            labelStyle: GoogleFonts.quicksand(
                              color: const Color(0xFF9E9E9E),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            hintText:
                                // ignore: lines_longer_than_80_chars
                                'Enter your full name'),
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          'Company Name',
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
                            border: const OutlineInputBorder(),
                            labelText: 'Company Name',
                            labelStyle: GoogleFonts.quicksand(
                              color: const Color(0xFF9E9E9E),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            hintText:
                                // ignore: lines_longer_than_80_chars
                                'Enter valid email id as abc@gmail.com or your phone number'),
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          'Pin Code',
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
                            labelText: 'XXXXXX',
                            labelStyle: GoogleFonts.quicksand(
                              color: const Color(0xFF9E9E9E),
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                            hintText:
                                // ignore: lines_longer_than_80_chars
                                'Enter a 6 character pin code'),
                      ))
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    //TODO FORGOT PASSWORD SCREEN GOES HERE
                  },
                  child: Text(
                    'Forgot Password',
                    style: GoogleFonts.quicksand(
                      color: Colors.green,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  child: Text(
                    'L0GIN',
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
                  onPressed: () {
                    print('HELLO');
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
