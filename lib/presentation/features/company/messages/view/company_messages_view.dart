import 'package:chipln/presentation/features/investor/chat/view/investor_chat_view.dart';
import 'package:chipln/presentation/global/ui_helper.dart';
import 'package:chipln/presentation/global/widget/company_header_design.dart';
import 'package:flutter/material.dart';

class CompanyMessagesView extends StatelessWidget {
  const CompanyMessagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          verticalSpace(5),
          const Padding(
            padding: paddingLR20,
            child: CompanyHeaderDesign(
              show: true,
              title: 'Messages',
            ),
          ),
          verticalSpace(2),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return  ChatCard();
                }),
          ),
        ],
      ),
    );
  }
}
