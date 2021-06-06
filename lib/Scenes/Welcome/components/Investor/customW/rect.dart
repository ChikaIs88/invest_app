import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rect extends StatelessWidget {
  Rect(this.title, this.subtitle, this.image_path);
  final String title;
  final String subtitle;
  final String image_path;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          height: 150,
          width: 300.0,
          color: Colors.transparent,
          child: Container(
              decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              //color: Colors.green,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 30, 10, 15),
                        child: Text(
                          title,
                          style: GoogleFonts.quicksand(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 10, 5),
                        child: Text(
                          subtitle,
                          style: GoogleFonts.quicksand(
                            color: const Color(0x99FFFFFF),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 30, 15),
                    child: Image.asset(image_path, 
                      scale: 0.8,
                      ),
                  )
                ],
              )),
        )
      ],
    );
  }
}
