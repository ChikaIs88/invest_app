import 'package:adv_fab/adv_fab.dart';
import 'package:chipln/logic/core/variable.dart';
import 'package:chipln/presentation/global/constants.dart';
import 'package:chipln/presentation/global/text_styling.dart';
import 'package:chipln/presentation/global/ui_helper.dart';
import 'package:chipln/presentation/global/widget/app_text_field.dart';
import 'package:chipln/presentation/global/widget/company_header_design.dart';
import 'package:chipln/presentation/global/widget/header_text.dart';
import 'package:chipln/presentation/global/widget/transparent_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:sizer/sizer.dart';
import 'package:chipln/presentation/features/company/packages/packages_cubit.dart';

class CompanyPackagesView extends StatefulWidget {
  const CompanyPackagesView({Key? key}) : super(key: key);

  @override
  State<CompanyPackagesView> createState() => _CompanyPackagesViewState();
}

class _CompanyPackagesViewState extends State<CompanyPackagesView> {
  final Stream<QuerySnapshot> _packageStream = FirebaseFirestore.instance
      .collection('package')
      .where('companyId', isEqualTo: userUid)
      .snapshots();
  late List<DropdownMenuItem> _dropdownTestItems;
  late List<DropdownMenuItem> _dropdownSectorItems;
  late List<DropdownMenuItem> _dropdownInterestItems;
  PageController _controller = PageController(initialPage: 0);

  AdvFabController? mabialaFABController;
  dynamic _packageInterest;
  dynamic _packageSector;
  dynamic _packageInvestmentTypes;

  final List _investmentTypes = [
    {'no': 1, 'keyword': 'Growth Investment'},
    {'no': 2, 'keyword': 'Defensive Investment'},
    {'no': 3, 'keyword': 'Cash'},
    {'no': 4, 'keyword': 'Fixed Interest'}
  ];
  final List _sector = [
    {'no': 1, 'keyword': 'Agriculture'},
    {'no': 2, 'keyword': 'Enterprise'},
    {'no': 3, 'keyword': 'Health'},
    {'no': 4, 'keyword': 'Media and Entertainment'},
    {'no': 5, 'keyword': 'Real Estate'},
  ];
  final List _interest = [
    {'no': 1, 'keyword': 'Medium (7%-15%)'},
    {'no': 2, 'keyword': 'High (15% and above)'},
  ];

  List<DropdownMenuItem> buildDropdownInestmentItems() {
    var items = <DropdownMenuItem>[];
    for (var i in _investmentTypes) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i['keyword']),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem> buildDropdownSectorItems() {
    var items = <DropdownMenuItem>[];
    for (var i in _sector) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i['keyword']),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem> buildDropdownInterestItems() {
    var items = <DropdownMenuItem>[];
    for (var i in _interest) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i['keyword']),
        ),
      );
    }
    return items;
  }

  @override
  void initState() {
    _dropdownTestItems = buildDropdownInestmentItems();
    _dropdownSectorItems = buildDropdownSectorItems();
    _dropdownInterestItems = buildDropdownInterestItems();
    mabialaFABController = AdvFabController();
    super.initState();
  }

  String? hello;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PackageCubit(),
      child: CompanyPackageBodySction(
          mabialaFABController: mabialaFABController,
          controller: _controller,
          dropdownInterestItems: _dropdownInterestItems,
          packageInterest: _packageInterest,
          dropdownTestItems: _dropdownTestItems,
          packageInvestmentTypes: _packageInvestmentTypes,
          packageStream: _packageStream),
    );
  }
}

class CompanyPackageBodySction extends StatelessWidget {
  const CompanyPackageBodySction({
    Key? key,
    required this.mabialaFABController,
    required PageController controller,
    required List<DropdownMenuItem> dropdownInterestItems,
    required packageInterest,
    required List<DropdownMenuItem> dropdownTestItems,
    required packageInvestmentTypes,
    required Stream<QuerySnapshot<Object?>> packageStream,
  })  : _controller = controller,
        _dropdownInterestItems = dropdownInterestItems,
        _packageInterest = packageInterest,
        _dropdownTestItems = dropdownTestItems,
        _packageInvestmentTypes = packageInvestmentTypes,
        _packageStream = packageStream,
        super(key: key);

  final AdvFabController? mabialaFABController;
  final PageController _controller;
  final List<DropdownMenuItem> _dropdownInterestItems;
  final _packageInterest;
  final List<DropdownMenuItem> _dropdownTestItems;
  final _packageInvestmentTypes;
  final Stream<QuerySnapshot<Object?>> _packageStream;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PackageCubit, PackageState>(
      builder: (context, state) {
        final packageRead = context.read<PackageCubit>();
        return Material(
          type: MaterialType.transparency,
          child: ProgressHUD(
            child: Scaffold(
              floatingActionButton: AdvFloatingActionButton(
                  mabialaFABController: mabialaFABController,
                  controller: _controller,
                  packageRead: packageRead,
                  dropdownInterestItems: _dropdownInterestItems,
                  packageInterest: _packageInterest,
                  dropdownTestItems: _dropdownTestItems,
                  packageInvestmentTypes: _packageInvestmentTypes),
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
                      child: StreamBuilder<QuerySnapshot>(
                          stream: _packageStream,
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return Text('Something went wrong');
                            }

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Text("Loading");
                            }
                            return ListView(
                              children: snapshot.data!.docs
                                  .map((DocumentSnapshot document) {
                                var data =
                                    document.data() as Map<String, dynamic>;
                                return PackagesCards(
                                  title: data['packageName'],
                                  descriptions: data['description'],
                                );
                              }).toList(),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AdvFloatingActionButton extends StatelessWidget {
  AdvFloatingActionButton({
    Key? key,
    required this.mabialaFABController,
    required PageController controller,
    required this.packageRead,
    required List<DropdownMenuItem> dropdownInterestItems,
    required packageInterest,
    required List<DropdownMenuItem> dropdownTestItems,
    required packageInvestmentTypes,
  })  : _controller = controller,
        _dropdownInterestItems = dropdownInterestItems,
        _packageInterest = packageInterest,
        _dropdownTestItems = dropdownTestItems,
        _packageInvestmentTypes = packageInvestmentTypes,
        super(key: key);

  final AdvFabController? mabialaFABController;
  final PageController _controller;
  final PackageCubit packageRead;
  final List<DropdownMenuItem> _dropdownInterestItems;
  var _packageInterest;
  final List<DropdownMenuItem> _dropdownTestItems;
  var _packageInvestmentTypes;

  @override
  Widget build(BuildContext context) {
    return AdvFab(
      showLogs: true,
      onFloatingActionButtonTapped: () {
        mabialaFABController!.setExpandedWidgetConfiguration(
          showLogs: true,
          heightToExpandTo: 68,
          forceCustomHeight: true,
          expendedBackgroundColor: const Color(0xffFFFAFA),
          withChild: AddPackage(
              mabialaFABController: mabialaFABController,
              controller: _controller,
              packageRead: packageRead,
              dropdownInterestItems: _dropdownInterestItems,
              packageInterest: _packageInterest,
              dropdownTestItems: _dropdownTestItems,
              packageInvestmentTypes: _packageInvestmentTypes),
        );
        mabialaFABController!.expandFAB();
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
    );
  }
}

class AddPackage extends StatelessWidget {
  AddPackage({
    Key? key,
    required this.mabialaFABController,
    required PageController controller,
    required this.packageRead,
    required List<DropdownMenuItem> dropdownInterestItems,
    required packageInterest,
    required List<DropdownMenuItem> dropdownTestItems,
    required packageInvestmentTypes,
  })  : _controller = controller,
        _dropdownInterestItems = dropdownInterestItems,
        _packageInterest = packageInterest,
        _dropdownTestItems = dropdownTestItems,
        _packageInvestmentTypes = packageInvestmentTypes,
        super(key: key);

  final AdvFabController? mabialaFABController;
  final PageController _controller;
  final PackageCubit packageRead;
  final List<DropdownMenuItem> _dropdownInterestItems;
  var _packageInterest;
  final List<DropdownMenuItem> _dropdownTestItems;
  var _packageInvestmentTypes;

  @override
  Widget build(BuildContext context) {
    final progress = ProgressHUD.of(context);
    return StatefulBuilder(builder: (context, StateSetter setState) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalSpace(1.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(''),
              Text('Add Package 📋',
                  style: TextStyling.h1.copyWith(
                    color: kTransBlack,
                  )),
              InkWell(
                  onTap: () {
                    mabialaFABController!.collapseFAB();
                  },
                  child: const Icon(
                    EvaIcons.close,
                    color: Colors.red,
                  ))
            ],
          ),
          SizedBox(
            height: responsiveHeight(60),
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              children: [
                Form(
                  key: packageRead.formKeyOne,
                  child: Column(
                    children: [
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
                          onChanged: packageRead.updatePackageName,
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
                          onChanged: (value) =>
                              packageRead.updateDescription(value),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      verticalSpace(1),
                      Padding(
                        padding: paddingLR20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(''),
                            const Text(''),
                            SizedBox(
                              width: 35.w,
                              child: Align(
                                alignment: Alignment.topRight,
                                child: InkWell(
                                  onTap: () {
                                    _controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeIn);
                                  },
                                  child: TransparentBtn(
                                    marginSet: EdgeInsets.zero,
                                    title: 'Next',
                                    color: kPrimaryColor,
                                    textColor: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Form(
                  key: packageRead.formKeyTwo,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(4.5),
                      Padding(
                        padding: paddingLR20,
                        child: AppDropDown3(
                          dropdownInterestItems: _dropdownInterestItems,
                          label: 'What is your preferred interest rate?',
                          title: 'Preferred Interest Rate',
                          selectedItem: _packageInterest,
                          onChangeDropdownList: (value) {
                            _packageInterest = value;
                            packageRead.onChangeDropDownRate(value);
                            setState(() {});
                          },
                        ),
                      ),
                      verticalSpace(4.5),
                      Padding(
                        padding: paddingLR20,
                        child: AppDropDown1(
                          dropdownTestItems: _dropdownTestItems,
                          label: 'Investmnt Type',
                          title: 'Investment Type',
                          selectedItem: _packageInvestmentTypes,
                          onChangeDropdownList: (value) {
                            _packageInvestmentTypes = value;
                            packageRead.onChangeDropDownSector(value);
                            setState(() {});
                          },
                        ),
                      ),
                      verticalSpace(4),
                      Padding(
                        padding: paddingLR20,
                        child: Row(
                          children: [
                            SizedBox(
                              width: responsiveWidth(40),
                              child: AppTextField(
                                key: const Key('package_price_textfield'),
                                label: 'Price',
                                hintText: 'Price',
                                onChanged: packageRead.onChangeDropDownAmmount,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            horizontalSpace(2),
                            SizedBox(
                              width: responsiveWidth(35),
                              child: AppTextField(
                                key: const Key('register_lastname_textfield'),
                                label: 'Unit',
                                keyboardType: TextInputType.number,
                                hintText: 'Unit',
                                onChanged: packageRead.updateUnit,
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalSpace(2),
                      Padding(
                        padding: paddingLR20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  _controller.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeOut);
                                },
                                child: Icon(EvaIcons.arrowBack)),
                            const Text(''),
                            InkWell(
                              onTap: () {
                                packageRead.handleAddPackage(
                                    progress: progress,
                                    foo: mabialaFABController!);
                              },
                              child: SizedBox(
                                width: 35.w,
                                child: const Align(
                                  alignment: Alignment.topRight,
                                  child: TransparentBtn(
                                    marginSet: EdgeInsets.zero,
                                    title: 'Upload',
                                    color: kPrimaryColor,
                                    // color: state.btnColor,
                                    textColor: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class PackagesCards extends StatelessWidget {
  const PackagesCards({
    Key? key,
    this.title,
    this.descriptions,
  }) : super(key: key);

  final String? title;
  final String? descriptions;

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
                title!,
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
            descriptions!,
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
          icon: Icon(EvaIcons.arrowIosDownwardOutline),
          itemWidth: 76.w,
          boxDecoration: BoxDecoration(
              color: Color.fromRGBO(248, 248, 248, 1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: kGreyColor,
                width: 1.0,
              )),
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
              color: const Color.fromRGBO(103, 112, 126, 1),
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
              color: const Color.fromRGBO(103, 112, 126, 1),
            )),
        verticalSpace(2),
        DropdownBelow(
          icon: const Icon(EvaIcons.arrowIosDownwardOutline),
          itemWidth: 76.w,
          boxDecoration: BoxDecoration(
              color:const Color.fromRGBO(248, 248, 248, 1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: kGreyColor,
                width: 1.0,
              )),
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
