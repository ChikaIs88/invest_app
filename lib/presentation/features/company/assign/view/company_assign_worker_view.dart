import 'package:chipln/presentation/global/constants.dart';
import 'package:chipln/presentation/global/text_styling.dart';
import 'package:chipln/presentation/global/ui_helper.dart';
import 'package:chipln/presentation/global/widget/app_text_field.dart';
import 'package:chipln/presentation/global/widget/company_header_design.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:adv_fab/adv_fab.dart';

class CompanyAssignWorkerView extends StatelessWidget {
  const CompanyAssignWorkerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mabialaFABController = AdvFabController();
    return Scaffold(
      floatingActionButton: AdvFab(
        showLogs: true,
        onFloatingActionButtonTapped: () {
          // ignore: avoid_dynamic_calls
          mabialaFABController.setExpandedWidgetConfiguration(
            showLogs: true,
            heightToExpandTo: 75,
            forceCustomHeight: true,
            expendedBackgroundColor: Color(0xffFFFAFA),
            withChild: Column(
              children: [
                verticalSpace(1.5),
                Text('Assign Consultant',
                    style: TextStyling.h1.copyWith(
                      color: kTransBlack,
                    )),
                verticalSpace(4.5),
                Text(
                    'Please note that after adding,\nyou will not be able to edit it',
                    textAlign: TextAlign.center,
                    style: TextStyling.bodyText1.copyWith(
                      color: kTransBlack,
                    )),
                verticalSpace(1.5),
                Padding(
                  padding: paddingLR20,
                  child: AppTextField(
                    key: const Key('consultant_name_textfield'),
                    label: 'Name',
                    hintText: "Enter the consultant's name",
                    onChanged: (value) {},
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                verticalSpace(4.5),
                Padding(
                  padding: paddingLR20,
                  child: AppTextField(
                    key: const Key('consultant_email_textfield'),
                    label: 'E-mail',
                    hintText: "Enter the consultant's E-mail",
                    onChanged: (value) {},
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                verticalSpace(4.5),
                Padding(
                  padding: paddingLR20,
                  child: AppTextField(
                    key: const Key('consultant_pin_textfield'),
                    label: 'PIN',
                    hintText: 'Assign PIN to consultant. Must be 4 digits',
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                verticalSpace(4.5),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          mabialaFABController.isCollapsed = true;
                        },
                        icon: const Icon(EvaIcons.questionMarkCircle))
                  ],
                )
              ],
            ),
          );
          mabialaFABController.isCollapsed
              ? mabialaFABController.expandFAB()
              : mabialaFABController.collapseFAB();
        },
        floatingActionButtonIcon: Icons.add,
        floatingActionButtonIconColor: Colors.red,
        floatingActionButtonExpendedWidth: 93,
        navigationBarIconActiveColor: Colors.pink,
        navigationBarIconInactiveColor: Colors.pink[200]!.withOpacity(0.6),
        collapsedColor: Colors.grey[200],
        useAsFloatingSpaceBar: false,
        useAsNavigationBar: false,
        controller: mabialaFABController,
        animationDuration: const Duration(milliseconds: 350),
      ),
      body: Column(
        children: [
          verticalSpace(5),
          const Padding(
            padding: paddingLR20,
            child: CompanyHeaderDesign(
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
                  return const WorkerCard();
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
                style: TextStyling.bodyText1
                    .copyWith(color: kTransBlack, fontSize: 13)),
          )
        ],
      ),
    );
  }
}
