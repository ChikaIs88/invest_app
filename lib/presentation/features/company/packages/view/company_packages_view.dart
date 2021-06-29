import 'package:adv_fab/adv_fab.dart';
import 'package:chipln/presentation/global/constants.dart';
import 'package:chipln/presentation/global/text_styling.dart';
import 'package:chipln/presentation/global/ui_helper.dart';
import 'package:chipln/presentation/global/widget/app_text_field.dart';
import 'package:chipln/presentation/global/widget/company_header_design.dart';
import 'package:chipln/presentation/global/widget/header_text.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:chipln/presentation/features/company/packages/packages_cubit.dart';

class CompanyPackagesView extends StatelessWidget {
  const CompanyPackagesView({Key? key}) : super(key: key);
  // late List<DropdownMenuItem> _dropdownTestItems;
  // late List<DropdownMenuItem> _dropdownSectorItems;
  // late List<DropdownMenuItem> _dropdownInterestItems;

  // final List _investmentTypes = [
  //   {'no': 1, 'keyword': 'Growth Investment'},
  //   {'no': 2, 'keyword': 'Defensive Investment'},
  //   {'no': 3, 'keyword': 'Cash'},
  //   {'no': 4, 'keyword': 'Fixed Interest'}
  // ];
  // final List _sector = [
  //   {'no': 1, 'keyword': 'Agriculture'},
  //   {'no': 2, 'keyword': 'Enterprise'},
  //   {'no': 3, 'keyword': 'Health'},
  //   {'no': 4, 'keyword': 'Media and Entertainment'},
  //   {'no': 5, 'keyword': 'Real Estate'},
  // ];
  // final List _interest = [
  //   {'no': 1, 'keyword': 'Medium (7%-15%)'},
  //   {'no': 2, 'keyword': 'High (15% and above)'},
  // ];
  // List<DropdownMenuItem> buildDropdownTestItems() {
  //   var items = <DropdownMenuItem>[];
  //   for (var i in _investmentTypes) {
  //     items.add(
  //       DropdownMenuItem(
  //         value: i,
  //         child: Text(i['keyword']),
  //       ),
  //     );
  //   }
  //   return items;
  // }

  // List<DropdownMenuItem> buildDropdownSectorItems() {
  //   var items = <DropdownMenuItem>[];
  //   for (var i in _sector) {
  //     items.add(
  //       DropdownMenuItem(
  //         value: i,
  //         child: Text(i['keyword']),
  //       ),
  //     );
  //   }
  //   return items;
  // }

  // List<DropdownMenuItem> buildDropdownInterestItems() {
  //   var items = <DropdownMenuItem>[];
  //   for (var i in _interest) {
  //     items.add(
  //       DropdownMenuItem(
  //         value: i,
  //         child: Text(i['keyword']),
  //       ),
  //     );
  //   }
  //   return items;
  // }

  // void initState() {
  //   _dropdownTestItems = buildDropdownTestItems();
  //   _dropdownSectorItems = buildDropdownSectorItems();
  //   _dropdownInterestItems = buildDropdownInterestItems();

  //   // ignore: avoid_dynamic_calls
  // }

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
            expendedBackgroundColor: Color(0xffFFFAFA),
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
                // AppDropDown1(
                //   dropdownTestItems: _dropdownTestItems,
                //   label: 'Investmnt Type',
                //   title: 'Investment Type',
                //   selectedItem: state.selectedItem,
                // ignore: lines_longer_than_80_chars
                //   onChangeDropdownList: _readPackageData.onChangeDropdownList,
                // ),
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
                verticalSpace(4.5),
                // AppDropDown(
                //   dropdownSectorItems: _dropdownSectorItems,
                //   label: 'Sector',
                //   title: 'Sector',
                //   selectedItem: state.selectedItem,
                //   onChangeDropdownList: _readPackageData.onChangeDropdownList,
                // ),
                // verticalSpace(4.5)
                //  AppDropDown3(
                //                 dropdownInterestItems: _dropdownInterestItems,
                //                 label: 'What is your preferred interest rate?',
                //                 title: 'Preferred Interest Rate',
                //                 selectedItem: state.selectedItem,
                //                 onChangeDropdownList:
                //                     _readPackageData.onChangeDropdownList,
                //               ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          mabialaFABController.isCollapsed = true;
                        },
                        icon: Icon(EvaIcons.questionMarkCircle))
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
                  itemCount: 2,
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

class AppDropDown1 extends StatelessWidget {
  const AppDropDown1({
    Key? key,
    required List<DropdownMenuItem> dropdownTestItems,
    this.selectedItem,
    this.title,
    this.label,
    onChangeDropdownList,
  })  : _dropdownTestItems = dropdownTestItems,
        _onChangeDropdownList = onChangeDropdownList,
        super(key: key);

  final List<DropdownMenuItem> _dropdownTestItems;
  final dynamic selectedItem;
  final dynamic _onChangeDropdownList;
  final String? title;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(2),
        Text(label!,
            style: TextStyling.bodyText1.copyWith(
              fontSize: 13,
              color: Color.fromRGBO(103, 112, 126, 1),
            )),
        verticalSpace(2),
        DropdownBelow(
          itemWidth: 90.w,
          itemTextstyle: TextStyling.bodyText1.copyWith(
            fontSize: 13,
            color: const Color.fromRGBO(103, 112, 126, 1),
          ),
          boxTextstyle: TextStyling.bodyText1.copyWith(
            fontSize: 13,
            color: const Color.fromRGBO(103, 112, 126, 1),
          ),
          boxPadding: const EdgeInsets.fromLTRB(13, 12, 0, 12),
          boxHeight: 50,
          hint: Text(
            title!,
            style: TextStyling.bodyText1.copyWith(
              fontSize: 13,
              color: const Color.fromRGBO(103, 112, 126, 1),
            ),
          ),
          value: selectedItem,
          items: _dropdownTestItems,
          onChanged: _onChangeDropdownList,
        ),
      ],
    );
  }
}

class AppDropDown extends StatelessWidget {
  const AppDropDown({
    Key? key,
    required List<DropdownMenuItem> dropdownSectorItems,
    this.selectedItem,
    this.title,
    this.label,
    onChangeDropdownList,
  })  : _dropdownSectorItems = dropdownSectorItems,
        _onChangeDropdownList = onChangeDropdownList,
        super(key: key);

  final List<DropdownMenuItem> _dropdownSectorItems;
  final dynamic selectedItem;
  final dynamic _onChangeDropdownList;
  final String? title;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(2),
        Text(label!,
            style: TextStyling.bodyText1.copyWith(
              fontSize: 13,
              color: Color.fromRGBO(103, 112, 126, 1),
            )),
        verticalSpace(2),
        DropdownBelow(
          itemWidth: 90.w,
          itemTextstyle: TextStyling.bodyText1.copyWith(
            fontSize: 13,
            color: const Color.fromRGBO(103, 112, 126, 1),
          ),
          boxTextstyle: TextStyling.bodyText1.copyWith(
            fontSize: 13,
            color: const Color.fromRGBO(103, 112, 126, 1),
          ),
          boxPadding: const EdgeInsets.fromLTRB(13, 12, 0, 12),
          boxHeight: 50,
          hint: Text(
            title!,
            style: TextStyling.bodyText1.copyWith(
              fontSize: 13,
              color: const Color.fromRGBO(103, 112, 126, 1),
            ),
          ),
          value: selectedItem,
          items: _dropdownSectorItems,
          onChanged: _onChangeDropdownList,
        ),
      ],
    );
  }
}

class AppDropDown3 extends StatelessWidget {
  const AppDropDown3({
    Key? key,
    required List<DropdownMenuItem> dropdownInterestItems,
    this.selectedItem,
    this.title,
    this.label,
    onChangeDropdownList,
  })  : _dropdownInterestItems = dropdownInterestItems,
        _onChangeDropdownList = onChangeDropdownList,
        super(key: key);

  final List<DropdownMenuItem> _dropdownInterestItems;
  final dynamic selectedItem;
  final dynamic _onChangeDropdownList;
  final String? title;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(2),
        Text(label!,
            style: TextStyling.bodyText1.copyWith(
              fontSize: 13,
              color: Color.fromRGBO(103, 112, 126, 1),
            )),
        verticalSpace(2),
        DropdownBelow(
          itemWidth: 90.w,
          itemTextstyle: TextStyling.bodyText1.copyWith(
            fontSize: 13,
            color: const Color.fromRGBO(103, 112, 126, 1),
          ),
          boxTextstyle: TextStyling.bodyText1.copyWith(
            fontSize: 13,
            color: const Color.fromRGBO(103, 112, 126, 1),
          ),
          boxPadding: const EdgeInsets.fromLTRB(13, 12, 0, 12),
          boxHeight: 50,
          hint: Text(
            title!,
            style: TextStyling.bodyText1.copyWith(
              fontSize: 13,
              color: const Color.fromRGBO(103, 112, 126, 1),
            ),
          ),
          value: selectedItem,
          items: _dropdownInterestItems,
          onChanged: _onChangeDropdownList,
        ),
      ],
    );
  }
}
