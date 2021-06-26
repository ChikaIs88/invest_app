import 'package:chipln/presentation/features/investor/chat/chat_files/convoList.dart';
import 'package:chipln/presentation/features/investor/chat/chat_files/m_users.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'package:lib\Scenes\Welcome\components\Investor\customW\m_users.dart'

class MsgPage extends StatefulWidget {
  @override
  _MsgPageState createState() => _MsgPageState();
}

class _MsgPageState extends State<MsgPage> {
  List<MsgUsers> msgUsers = [
    MsgUsers(
        name: 'Chika',
        messageText: 'How can i help you',
        imageURL: 'assets/images/ChipIn.png',
        time: 'Now')
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 45, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Messages',
                        style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Container(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 6, bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.green[50],
                      ),
                      child: Row(
                        children: <Widget>[
                          const Icon(
                            Icons.add,
                            color: Colors.green,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            'Add New',
                            style: GoogleFonts.quicksand(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
            child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle:
                        GoogleFonts.quicksand(color: Colors.grey.shade600),
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
          ListView.builder(
              itemCount: msgUsers.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 16),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ConversationList(
                  name: msgUsers[index].name,
                  messageText: msgUsers[index].messageText,
                  imageURL: msgUsers[index].imageURL,
                  time: msgUsers[index].time,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                );
              })
        ],
      ),
    );
  }
}
