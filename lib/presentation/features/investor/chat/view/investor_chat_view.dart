import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:chipln/presentation/global/assets/assets.gen.dart';
import 'package:chipln/presentation/global/constants.dart';
import 'package:chipln/presentation/global/text_styling.dart';
import 'package:chipln/presentation/global/ui_helper.dart';
import 'package:chipln/presentation/global/widget/app_text_field.dart';
import 'package:sizer/sizer.dart';
import 'package:chipln/presentation/features/investor/chat/chat_files/convoList.dart';
import 'package:chipln/presentation/features/investor/chat/chat_files/m_users.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InvestorChatView extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          Container(
              height: 20.h,
              padding: paddingLR20,
              color: Colors.white,
              child: Column(
                children: [
                  verticalSpace(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Chats',
                            style: TextStyling.h1.copyWith(color: Colors.black),
                          ),
                          horizontalSpace(3),
                          Assets.images.home.chat.image(height: 8.h)
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                              color: kShadeGrey,
                              onPressed: () {},
                              icon: const Icon(EvaIcons.bell)),
                          IconButton(
                              color: kShadeGrey,
                              onPressed: () {},
                              icon: const Icon(EvaIcons.settings))
                        ],
                      )
                    ],
                  ),
                  verticalSpace(4),
                ],
              )),
          verticalSpace(2),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  verticalSpace(2),
                  Padding(
                    padding: paddingLR20,
                    child: AppTextField(
                      key: const Key('invest_textfield'),
                      prefixIcon: IconButton(
                          onPressed: () {}, icon: const Icon(EvaIcons.search)),
                      hintText: 'Search...',
                      onChanged: (value) {},
                      validator: (value) {},
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  verticalSpace(2),
                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ChatCard();
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatCard extends StatelessWidget {
  List<MsgUsers> msgUsers = [
    MsgUsers(
        name: 'Chika',
        messageText: 'How can i help you',
        imageURL: 'assets/images/ChipIn.png',
        time: 'Now')
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
              });
  }
}
