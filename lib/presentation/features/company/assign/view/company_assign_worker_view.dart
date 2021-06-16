import 'package:chipln/presentation/global/constants.dart';
import 'package:chipln/presentation/global/text_styling.dart';
import 'package:chipln/presentation/global/ui_helper.dart';
import 'package:chipln/presentation/global/widget/company_header_design.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CompanyAssignWorkerView extends StatelessWidget {
  const CompanyAssignWorkerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          verticalSpace(5),
          const Padding(
            padding: paddingLR20,
            child:  CompanyHeaderDesign(
              title: 'Assign Worker',
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
                  return  const WorkerCard();
                }),
          ),
         
        ],
      ),
    );
  }
}

class WorkerCard extends StatelessWidget {
  const WorkerCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.h,
      width: 100.w,
      margin: paddingLR20.copyWith(bottom: 2.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 5.h,
            width: 100.w,
            decoration: const BoxDecoration(
              color: Color(0xffdaf2dc),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          verticalSpace(2),
          Padding(
            padding: paddingLR20,
            child: Text('Chika Peace',
                style: TextStyling.h2.copyWith(color: Colors.black)),
          ),
          Padding(
            padding: paddingLR20,
            child: Text('Chika was assign Today',
                style: TextStyling.bodyText1.copyWith(color: kTransBlack, fontSize: 13)),
          )
        ],
      ),
    );
  }
}
