import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/presentation/global/assets/assets.gen.dart';
import 'package:invest_app/presentation/global/constants.dart';
import 'package:invest_app/presentation/global/text_styling.dart';
import 'package:invest_app/presentation/global/ui_helper.dart';
import 'package:invest_app/presentation/global/widget/app_text_field.dart';
import 'package:sizer/sizer.dart';

class InvestorChatView extends StatelessWidget {
  const InvestorChatView({Key? key}) : super(key: key);

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
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return const ChatCard();
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
  const ChatCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingLR20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 19.w,
                height: 10.h,
                child: Card(
                  child: Assets.images.home.samplecompany.image(),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              horizontalSpace(3),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chika Peace',
                    style: TextStyling.h2.copyWith(color: Colors.black),
                  ),
                  verticalSpace(1),
                  Text(
                    'How is it going today?',
                    style: TextStyling.bodyText1
                        .copyWith(fontSize: 13, color: Colors.black45),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Today',
                style: TextStyling.bodyText1
                    .copyWith(fontSize: 13, color: Colors.black45),
              ),
              verticalSpace(1),
              CircleAvatar(
                maxRadius: 12,
                child: Text(
                  '1',
                  style: TextStyling.bodyText1
                      .copyWith(fontSize: 13, color: Colors.black45),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
