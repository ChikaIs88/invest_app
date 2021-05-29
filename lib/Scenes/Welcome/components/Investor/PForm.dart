import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invest_app/Scenes/Welcome/components/Investor/LoginInv.dart';
import 'package:invest_app/Scenes/Welcome/components/Invest_Comp/first_page.dart';
//import 'package:invest_app/Scenes/Welcome/customWidgets/dropdown.dart';

class PForm extends StatefulWidget {
  @override
  _PFormState createState() => _PFormState();
}

class _PFormState extends State<PForm> {
  String value = '';

  void valuechanged(_value) {
    setState(() {
      value = _value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
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
                      'Preferrence form',
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
                      'Fill out this form for ChipIn to pesent to you investment options that meet your needs.',
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
                          'Preferred Investmnt Type?',
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
                            labelText: 'Investmnt Type?',
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
                  padding: const EdgeInsets.only(right: 120),
                  child: DropdownButton(
                    
                    items: [
                      const DropdownMenuItem<String>(
                        
                          value: '1',
                          child: Center(
                            child: Text('One'),
                          )),
                      const DropdownMenuItem<String>(
                          value: '2',
                          child: Center(
                            child: Text('Two'),
                          )),
                      const DropdownMenuItem<String>(
                          value: '3',
                          child: Center(
                            child: Text('Three'),
                          )),
                    ],
                    onChanged: valuechanged,
                    hint: const Text('Select an option'),
                  ),
                ),
                Text('$value'),
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
                          'Sector',
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
                            labelText: 'Sector',
                            labelStyle: GoogleFonts.quicksand(
                              color: const Color(0xFF9E9E9E),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            hintText:
                                // ignore: lines_longer_than_80_chars
                                'Pick sector'),
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
                                'Enter a password that is 8 characters or more'),
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
                  onPressed: () {
                    print('HELLO');
                  },
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
