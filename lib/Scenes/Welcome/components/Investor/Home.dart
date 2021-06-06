import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invest_app/Scenes/Welcome/components/Investor/pages/msg_files/msg_page.dart';
import 'package:invest_app/Scenes/Welcome/components/Investor/pages/profile_page.dart';
import 'package:invest_app/Scenes/Welcome/components/Investor/customW/Features.dart';
import 'package:invest_app/Scenes/Welcome/components/Investor/pages/home_page.dart';
import 'package:invest_app/Scenes/Welcome/components/Investor/pages/search_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _folded = true;

  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    MsgPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Flutter BottomNavigationBar Example'),
      //     backgroundColor: Colors.green
      // ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home',
                  style: GoogleFonts.quicksand(fontSize:13),),
                  backgroundColor: Colors.green),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search',
                style: GoogleFonts.quicksand(fontSize:13),),
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              title: Text('Messages',
                style: GoogleFonts.quicksand(fontSize:13),),
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile',
                style: GoogleFonts.quicksand(fontSize:13),),
              backgroundColor: Colors.green,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
