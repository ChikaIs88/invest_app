import 'package:chipln/presentation/features/investor/profile/view/investor_profile_view.dart';
import 'package:chipln/presentation/global/constants.dart';
import 'package:chipln/presentation/global/text_styling.dart';
import 'package:chipln/presentation/global/ui_helper.dart';
import 'package:chipln/presentation/global/widget/company_header_design.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CompanyNotificationView extends StatelessWidget {
  const CompanyNotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          verticalSpace(5),
          const Padding(
           padding: paddingLR20,
            child: CompanyHeaderDesign(
              title: 'Packages',
              show: true,
            ),
          ),
          verticalSpace(2),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const NotifcatioCards();
                }),
          ),
        ],
      ),
    );
  }
}

