import 'package:chipln/logic/core/firebase_core.dart';
import 'package:chipln/logic/core/variable.dart';
import 'package:chipln/presentation/global/assets/assets.gen.dart';
import 'package:chipln/presentation/global/text_styling.dart';
import 'package:chipln/presentation/global/ui_helper.dart';
import 'package:chipln/presentation/global/widget/app_flat_button.dart';
import 'package:chipln/presentation/global/widget/company_header_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:sizer/sizer.dart';

class CompanyDashboardView extends StatelessWidget {
  const CompanyDashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appAuth = Modular.get<FirebaseConfiguration>();
    return Scaffold(
      body: CompanyDashboardBody(appAuth: appAuth),
    );
  }
}

class CompanyDashboardBody extends StatelessWidget {
  const CompanyDashboardBody({
    Key? key,
    required this.appAuth,
  }) : super(key: key);

  final FirebaseConfiguration appAuth;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          Container(
              //alignment: Alignment.topRight,
              width: 21.w,
              height: 5.h,
              decoration: BoxDecoration(
                  color: Colors.red[100],
                  borderRadius: BorderRadius.circular(5)),
              child: AppFlatButton(
                color: Colors.red[100],
                label: 'Log Out',
                onPressed: () async {
                  await appAuth.logOUt();
                  Modular.to.navigate('/');
                },
              ),
            ),
            verticalSpace(5),
          Text(
            'Welcome, ${userInfo.company_name}😃',
            style: TextStyling.h1.copyWith(color: Colors.black),
          ),
          verticalSpace(1),
          // Text(
          //   'of XYZ Inc.',
          //   style: TextStyling.h2.copyWith(color: Colors.black),
          // ),
          verticalSpace(1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const DashboardTopCard(
                color: Colors.green,
                title: 'Total Interested',
                subTitle: '1',
              ),
              const DashboardTopCard(
                color: Colors.green,
                title: 'New Messages',
                subTitle: '1',
              ),
            ],
          ),
          PageBelowSection(appAuth: appAuth)
        ],
      ),
    );
  }
}

class PageBelowSection extends StatelessWidget {
  const PageBelowSection({
    Key? key,
    required this.appAuth,
  }) : super(key: key);

  final FirebaseConfiguration appAuth;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () async {
                if (index == 5) {
                  await appAuth.logOUt();
                  Modular.to.navigate('/companyLogin');
                  return;
                }
                await Modular.to.pushNamed(dashboardRoutingPath[index]);
              },
              child: DashLayout(
                image: images[index],
                label: titles[index],
              ),
            );
          }),
          
    );
  }
}

List<String> dashboardRoutingPath = [
  '/companyLogin/addPackages',
  '/investorCompanyMessages',
  '/companyLogin/notification',
  '/investorCompanyCompleteRegister',
  '/'
];

List<String> titles = [
  'Packages',
  'Messages',
  'Notfication',
  'Edit Profile',
];

List<Widget> images = [
  Assets.images.company.package.image(height: 60),
  Assets.images.company.chat.image(height: 60),
  Assets.images.company.notification.image(height: 60),
  Assets.images.company.edit.image(height: 60),
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
    return SizedBox(
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
    this.title,
    this.subTitle,
  }) : super(key: key);

  final Color? color;
  final String? title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      height: 12.h,
      alignment: Alignment.center,
      width: 40.w,
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
          stops: const [
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
            title!,
            style: TextStyling.h2.copyWith(color: Colors.black),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.green,
                maxRadius: 20,
                child: Text(
                  subTitle!,
                  style: TextStyling.h2.copyWith(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
