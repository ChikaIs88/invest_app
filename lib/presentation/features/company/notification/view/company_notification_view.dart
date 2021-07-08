import 'package:chipln/logic/core/variable.dart';
import 'package:chipln/presentation/global/text_styling.dart';
import 'package:chipln/presentation/global/ui_helper.dart';
import 'package:chipln/presentation/global/widget/company_header_design.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:sizer/sizer.dart';

class CompanyNotificationView extends StatelessWidget {
  const CompanyNotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _notifications = FirebaseFirestore.instance
        .collection('notification')
        .where('userId', isEqualTo: userUid)
        .snapshots();

    return Scaffold(
      body: CompanyNotificationBodySection(notifications: _notifications),
    );
  }
}

class CompanyNotificationBodySection extends StatelessWidget {
  const CompanyNotificationBodySection({
    Key? key,
    required Stream<QuerySnapshot<Object?>> notifications,
  }) : _notifications = notifications, super(key: key);

  final Stream<QuerySnapshot<Object?>> _notifications;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(5),
        const Padding(
          padding: paddingLR20,
          child: CompanyHeaderDesign(
            title: 'Notifications',
            show: true,
          ),
        ),
        verticalSpace(2),
        StreamBuilder<QuerySnapshot>(
            stream: _notifications,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('Loading');
              }
              return Expanded(
                  child: ListView(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                children:
                    snapshot.data!.docs.map((DocumentSnapshot document) {
                  var data = document.data() as Map<String, dynamic>;
                  return NotifcatioCards(
                    name: data['userName'],
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
  const NotifcatioCards({
    Key? key,
    required this.name,
    required this.time,
  }) : super(key: key);
  final String name;
  final dynamic time;

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
                TimeAgo.getTimeAgo(time.toDate()),
                style: TextStyling.bodyText1
                    .copyWith(fontSize: 13, color: Colors.black54),
              )
            ],
          ),
          verticalSpace(2),
          Text(
            '$name has showed intrest in your investment package ,Jamp to $name\'s dm',
            style: TextStyling.bodyText1
                .copyWith(fontSize: 13, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
