import 'package:chipln/presentation/global/assets/assets.gen.dart';
import 'package:chipln/presentation/global/constants.dart';
import 'package:chipln/presentation/global/routing/routes.dart';
import 'package:chipln/presentation/global/text_styling.dart';
import 'package:chipln/presentation/global/ui_helper.dart';
import 'package:chipln/presentation/global/widget/company_header_design.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:sizer/sizer.dart';

class CompanyDashboardView extends StatelessWidget {
  const CompanyDashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: paddingLR20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(5),
            const CompanyHeaderDesign(
              title: 'Dashboard',
            ),
            verticalSpace(5),
            Text(
              'Welcome, Goji😃',
              style: TextStyling.h1.copyWith(color: Colors.black),
            ),
            verticalSpace(3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const DashboardTopCard(
                  color: Colors.red,
                ),
                const DashboardTopCard(
                  color: Colors.blue,
                )
              ],
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Routes.seafarer.navigate(dashboardRoutingPath[index]);
                      },
                      child: DashLayout(
                        image: images[index],
                        label: titles[index],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

List<String> dashboardRoutingPath = [
  '/investorCompanyPackages',
  '/investorCompanyMessages',
  '/investorCompanyAssignWorker',
  '/investorCompanyNotification',
  '/investorCompanyCompleteRegister',
  '/'
];

List<String> titles = [
  'Packages',
  'Messages',
  'Assign Worker',
  'Notfication',
  'Edit Profile',
  'Logout'
];

List<Widget> images = [
  Assets.images.company.package.image(height: 60),
  Assets.images.company.chat.image(height: 60),
  Assets.images.company.assign.image(height: 60),
  Assets.images.company.notification.image(height: 60),
  Assets.images.company.edit.image(height: 60),
  Assets.images.company.logout.image(height: 60)
];

class DashLayout extends StatelessWidget {
  const DashLayout({
    Key? key,
    this.image,
    this.label,
  }) : super(key: key);

  final Widget? image;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 40.w,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image!,
            verticalSpace(1.5),
            Text(
              label!,
              style: TextStyling.bodyText1.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardTopCard extends StatelessWidget {
  const DashboardTopCard({
    Key? key,
    this.color,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      height: 12.h,
      alignment: Alignment.center,
      width: 42.w,
      borderRadius: 10,
      blur: 20,
      border: 2,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color!.withOpacity(0.1),
            color!.withOpacity(0.05),
          ],
          stops: [
            0.1,
            1,
          ]),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          color!.withOpacity(0.5),
          color!.withOpacity(0.5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Total Investment',
            style: TextStyling.h2.copyWith(color: Colors.black),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                maxRadius: 20,
                child: Text(
                  '1',
                  style: TextStyling.h2.copyWith(color: Colors.black),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
