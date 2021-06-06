import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _hasBeenPressed = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Column(
      children: [
        Container(
          height: 150,
          width: size.width,
          child: Padding(
              padding: const EdgeInsets.only(top: 45, left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Search',
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
                    // ignore: lines_longer_than_80_chars
                    'Is there any specific investmnet option or job you want to find, check here!',
                    style: GoogleFonts.quicksand(
                      color: const Color(0x8A000000),
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
          child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: GoogleFonts.quicksand(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade100)))),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () => {
                  setState(() {
                    _hasBeenPressed = !_hasBeenPressed;
                  })
                },
                child: Text(
                  'All Results',
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  onPrimary: _hasBeenPressed ? Colors.green : Colors.white,
                  primary: _hasBeenPressed ? Colors.white : Colors.green,
                  minimumSize: const Size(150, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
              ElevatedButton(
                onPressed: () => {
                  setState(() {
                    _hasBeenPressed = !_hasBeenPressed;
                  })
                },
                child: Text(
                  'Interested',
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  onPrimary: _hasBeenPressed ? Colors.green : Colors.white,
                  primary: _hasBeenPressed ? Colors.white : Colors.green,
                  minimumSize: const Size(150, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
