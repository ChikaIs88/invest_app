import 'package:chipln/logic/core/firebase_core.dart';
import 'package:chipln/logic/core/variable.dart';
import 'package:chipln/presentation/global/widget/app_flat_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:chipln/presentation/global/assets/assets.gen.dart';
import 'package:chipln/presentation/global/constants.dart';
import 'package:chipln/presentation/global/text_styling.dart';
import 'package:chipln/presentation/global/ui_helper.dart';
import 'package:chipln/presentation/global/widget/curve_wave.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:sizer/sizer.dart';

class InvestorProfileView extends StatefulWidget {
  const InvestorProfileView({Key? key}) : super(key: key);

  @override
  _InvestorProfileViewState createState() => _InvestorProfileViewState();
}

class _InvestorProfileViewState extends State<InvestorProfileView>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appAuth = Modular.get<FirebaseConfiguration>();
    final Stream<QuerySnapshot> _notifications = FirebaseFirestore.instance
        .collection('notification')
        .where('userId', isEqualTo: userUid)
        .snapshots();

    return Scaffold(
      body: InvestorProfileBodySection(
          appAuth: appAuth, notifications: _notifications),
    );
  }
}

class InvestorProfileBodySection extends StatelessWidget {
  const InvestorProfileBodySection({
    Key? key,
    required this.appAuth,
    required Stream<QuerySnapshot<Object?>> notifications,
  })  : _notifications = notifications,
        super(key: key);

  final FirebaseConfiguration appAuth;
  final Stream<QuerySnapshot<Object?>> _notifications;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40.h,
          width: double.infinity,
          decoration: const BoxDecoration(color: kPrimaryColor),
          child: Stack(
            children: [
              Assets.images.login.loginbg.svg(height: 40.h),
              verticalSpace(10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: paddingLR20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Assets.images.home.chat.image(height: 8.h),
                            horizontalSpace(3),
                            Text(
                              '${userInfo!.first_name} ${userInfo!.last_name} ',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyling.h2.copyWith(
                                color: Colors.white,
                                fontSize: 15.sp,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
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
                                  Modular.to.navigate('/investorlogin');
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  verticalSpace(5),
                  Padding(
                    padding: paddingLR20,
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const ProfileText(
                            title: '20,000',
                            subText: 'Min Investment',
                          ),
                          const VerticalDivider(color: Colors.white54),
                          const ProfileText(
                            title: '10',
                            subText: 'Total Connection',
                          ),
                          const VerticalDivider(color: Colors.white54),
                          const ProfileText(
                            title: '100',
                            subText: 'Intrested',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        verticalSpace(2),
        StreamBuilder<QuerySnapshot>(
            stream: _notifications,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }
              return Expanded(
                  child: ListView(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  var data = document.data() as Map<String, dynamic>;
                  return NotifcatioCards(
                    company: data['companyName'],
                    time: data['time'],
                  );
                }).toList(),
              ));
            }),
      ],
    );
  }
}

class NotifcatioCards extends StatelessWidget {
  final dynamic time;
  final String company;
  const NotifcatioCards({
    Key? key,
    required this.time,
    required this.company,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      margin: paddingLR20.copyWith(bottom: 2.h),
      width: double.infinity,
      padding: paddingLR20,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          // borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: const Border(
              left: BorderSide(color: Colors.redAccent, width: 5))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          verticalSpace(2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Investment Notice',
                    style: TextStyling.h2.copyWith(color: Colors.black),
                  ),
                  Icon(
                    EvaIcons.alertCircle,
                    color: Colors.red[100],
                  )
                ],
              ),
              Text(
                GetTimeAgo.parse(time.toDate()),
                style: TextStyling.bodyText1
                    .copyWith(fontSize: 13, color: Colors.black54),
              )
            ],
          ),
          verticalSpace(2),
          Text(
            'You showed intrest in ${company}\'s Investment,Jamp to thier dm',
            style: TextStyling.bodyText1
                .copyWith(fontSize: 13, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

class ProfileText extends StatelessWidget {
  const ProfileText({
    Key? key,
    this.title,
    this.subText,
  }) : super(key: key);

  final String? title;
  final String? subText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: TextStyling.h2,
        ),
        verticalSpace(1),
        Text(
          subText!,
          style: TextStyling.bodyText1
              .copyWith(fontSize: 13, color: Colors.white54),
        )
      ],
    );
  }
}

class ProileCard extends StatelessWidget {
  const ProileCard({
    Key? key,
    required AnimationController controller,
  })  : _controller = controller,
        super(key: key);

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(80.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: <Color>[
                Colors.white,
                Color.lerp(Colors.white, Colors.black, .05)!
              ],
            ),
          ),
          child: ScaleTransition(
              scale: Tween(begin: 0.95, end: 1.0).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: const CurveWave(),
                ),
              ),
              child: Assets.images.home.productlist.image(height: 80)),
        ),
      ),
    );
  }
}
