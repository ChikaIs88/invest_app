import 'package:adv_fab/adv_fab.dart';
import 'package:chipln/presentation/global/constants.dart';
import 'package:chipln/presentation/global/text_styling.dart';
import 'package:chipln/presentation/global/ui_helper.dart';
import 'package:chipln/presentation/global/widget/app_text_field.dart';
import 'package:chipln/presentation/global/widget/company_header_design.dart';
import 'package:chipln/presentation/global/widget/header_text.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CompanyPackagesView extends StatelessWidget {
  const CompanyPackagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mabialaFABController = AdvFabController();
    return Scaffold(
      floatingActionButton: AdvFab(
        showLogs: true,
        onFloatingActionButtonTapped: () {
          mabialaFABController.setExpandedWidgetConfiguration(
            showLogs: true,
            heightToExpandTo: 75,
            forceCustomHeight: true,

            expendedBackgroundColor:    Color(0xffFFFAFA),
            withChild: Column(
              children: [
                verticalSpace(1.5),
                Text('Add Package📋',
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
                    key: const Key('package_name_textfield'),
                    label: 'Name',
                    hintText: 'Enter the package name',
                    onChanged: (value) {},
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                verticalSpace(4.5),
                Padding(
                  padding: paddingLR20,
                  child: AppTextField(
                    key: const Key('package_description_textfield'),
                    label: 'Description',
                    hintText: 'Enter Package Description',
                    maxLines: 5,
                    onChanged: (value) {},
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                verticalSpace(4.5),
                Padding(
                  padding: paddingLR20,
                  child: Row(
                    children: [
                      SizedBox(
                        width: responsiveWidth(35),
                        child: const AppTextField(
                          key: Key('package_price_textfield'),
                          label: 'Value',
                          hintText: 'Enter package value',
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      horizontalSpace(2),
                      SizedBox(
                        width: responsiveWidth(35),
                        child: const AppTextField(
                          key: Key('register_lastname_textfield'),
                          label: 'Unit',
                          hintText: 'Enter package unit',
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(children: [
                  IconButton(onPressed: (){
                     mabialaFABController.isCollapsed = true;
                  }, icon: Icon(EvaIcons.questionMarkCircle))
                ],)
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
      body: Padding(
        padding: paddingLR20,
        child: Column(
          children: [
            verticalSpace(5),
            const CompanyHeaderDesign(
              title: 'Packages',
            ),
            verticalSpace(2),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const PackagesCards();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class PackagesCards extends StatelessWidget {
  const PackagesCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      margin: EdgeInsets.only(bottom: 2.h),
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
          border:
              const Border(left: BorderSide(color: kPrimaryColor, width: 5))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          verticalSpace(2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Bit Coin',
                style: TextStyling.h2.copyWith(color: Colors.black),
              ),
              const Icon(
                EvaIcons.close,
                color: Colors.red,
              )
            ],
          ),
          verticalSpace(2),
          Text(
            'This is a base bitcoin for everyone who want money to work for them',
            style: TextStyling.bodyText1
                .copyWith(fontSize: 13, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
