import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../customW/Features.dart';
import '../customW/rect.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 160,
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
                      'Hi Chika,',
                      style: GoogleFonts.quicksand(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Hope your day is going great....',
                      style: GoogleFonts.quicksand(
                        color: const Color(0x8A000000),
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                )),
          ),
          // AnimatedContainer(
          //   duration: const Duration(milliseconds: 400),
          //   width: _folded ? 56 : 230,
          //   height: 56,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(32),
          //     color: Colors.white,
          //     boxShadow: kElevationToShadow[6],
          //   ),
          //   child: Row(
          //     children: [
          //       Expanded(
          //           child: Container(
          //         padding: EdgeInsets.only(left: 16),
          //         child: _folded
          //             ? TextField(
          //                 decoration: InputDecoration(
          //                     hintText: 'Search',
          //                     hintStyle: TextStyle(color: Colors.green[300]),
          //                     border: InputBorder.none),
          //               )
          //             : null,
          //       ))
          //     ],
          //   ),
          // )

          // SizedBox(
          //   height: 150,
          //   child: Expanded(
          //     child: ListView(
          //       scrollDirection: Axis.horizontal,
          //       children: [
          //         Container(
          //           color: Colors.white,
          //           height: 200,
          //           width: size.width,
          //           child: Row(
          //             children: [
          //               Padding(
          //                 padding: const EdgeInsets.fromLTRB(50, 0, 5, 0),
          //                 child: Rect('title', 'subtitle', 'assets/images/img.png'),
          //               ),
          //               const SizedBox(
          //                 width: 30,
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.fromLTRB(50, 0, 5, 0),
          //                 child: Rect('title', 'subtitle', 'assets/images/img.png'),
          //               )
                      
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          const SizedBox(
            width: 20,
          ),

          Expanded(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Investment options for you,',
                            style: GoogleFonts.quicksand(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ])),
                // const SizedBox(
                //   width: 200,
                // ),
                const Features(
                  'Gojek',
                  'oifhpfihspih ifobss ougaougd ougsougds ougodug ougsaougs',
                  25,
                  10,
                ),
                Features(
                  'Grab',
                  'oifhpfihspih ifobss ougaougd ougsougds ougodug ougsaougs',
                  30,
                  25,
                ),
                Features(
                  'Gojek',
                  'oifhpfihspih ifobss ougaougd ougsougds ougodug ougsaougs',
                  11,
                  10,
                ),
              ],
            ),
          ),
        ],
      ),
      //child: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
