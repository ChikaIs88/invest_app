import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:chipln/app/logger_init.dart';
import 'package:chipln/presentation/features/investor/prefrence/cubit/prefrence_cubit.dart';
import 'package:chipln/presentation/features/investor/register/cubit/register_cubit.dart';
import 'package:chipln/presentation/global/assets/assets.gen.dart';
import 'package:chipln/presentation/global/constants.dart';
import 'package:chipln/presentation/global/routing/routes.dart';
import 'package:chipln/presentation/global/text_styling.dart';
import 'package:chipln/presentation/global/ui_helper.dart';
import 'package:chipln/presentation/global/widget/transparent_status_bar.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:sizer/sizer.dart';

class PrefrenceView extends StatefulWidget {
  const PrefrenceView({Key? key}) : super(key: key);

  @override
  _PrefrenceViewState createState() => _PrefrenceViewState();
}

class _PrefrenceViewState extends State<PrefrenceView> {
  late List<DropdownMenuItem> _dropdownTestItems;

  final List _investmentTypes = [
    {'no': 1, 'keyword': 'Growth Investment'},
    {'no': 2, 'keyword': 'Defensive Investment'},
    {'no': 3, 'keyword': 'Cash'},
    {'no': 3, 'keyword': 'Fixed Interest'}
  ];

  List<DropdownMenuItem> buildDropdownTestItems() {
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

  @override
  void initState() {
    _dropdownTestItems = buildDropdownTestItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    logger.d('Prefrencecreen has been initialized');
    return BlocProvider(
        create: (context) => PrefrenceCubit(),
        child: TransparentStatusBar(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 17.h,
                    width: double.infinity,
                    padding: paddingLR20,
                    decoration: const BoxDecoration(color: kPrimaryColor),
                    child: Stack(
                      children: [
                        Assets.images.login.loginbg.svg(height: 17.h),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              verticalSpace(10),
                              Text(
                                'Preferrence form',
                                style: TextStyling.h1,
                              ),
                              verticalSpace(2),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: paddingLR20,
                      child: BlocBuilder<PrefrenceCubit, PrefrenceState>(
                        builder: (context, state) {
                          final _readPrefrenceData =
                              context.read<PrefrenceCubit>();
                          return Column(
                            children: [
                              verticalSpace(2),
                              Text(
                                  'Fill out this form for ChipIn to pesent to you investment options that meet your needs.',
                                  style: TextStyling.bodyText1.copyWith(
                                    color:
                                        const Color.fromRGBO(103, 112, 126, 1),
                                  )),
                              verticalSpace(2),
                              AppDropDown(
                                dropdownTestItems: _dropdownTestItems,
                                label: 'Preferred Investmnt Type?',
                                title: 'Investment Type',
                                selectedItem: state.selectedItem,
                                onChangeDropdownList:
                                    _readPrefrenceData.onChangeDropdownList,
                              ),
                              verticalSpace(2),
                              AppDropDown(
                                dropdownTestItems: _dropdownTestItems,
                                label: 'Preferred Sector',
                                title: 'Sector',
                                selectedItem: state.selectedItem,
                                onChangeDropdownList:
                                    _readPrefrenceData.onChangeDropdownList,
                              ),
                              verticalSpace(2),
                              Row(
                                children: [
                                  Container(
                                    height: 45,
                                    width: 25.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0XFFececec),
                                          width: 2),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      '0\u20A6 - Any',
                                      style: TextStyling.bodyText1.copyWith(
                                        fontSize: 13,
                                        color: const Color.fromRGBO(
                                            103, 112, 126, 1),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 62.w,
                                    child: FlutterSlider(
                                      values: [10, 100],
                                      rangeSlider: true,
                                      max: 100,
                                      min: 0,
                                      step: const FlutterSliderStep(step: 5),
                                      jump: true,
                                      trackBar: const FlutterSliderTrackBar(
                                        activeTrackBar:
                                            BoxDecoration(color: kPrimaryColor),
                                        inactiveTrackBarHeight: 2,
                                        activeTrackBarHeight: 3,
                                      ),
                                      disabled: false,
                                      handler:
                                          customHandler(Icons.chevron_right),
                                      rightHandler:
                                          customHandler(Icons.chevron_left),
                                      tooltip: FlutterSliderTooltip(
                                        leftPrefix: const Icon(
                                          Icons.attach_money,
                                          size: 19,
                                          color: Colors.black45,
                                        ),
                                        rightSuffix: const Icon(
                                          Icons.attach_money,
                                          size: 19,
                                          color: Colors.black45,
                                        ),
                                        textStyle: const TextStyle(
                                            fontSize: 17,
                                            color: Colors.black45),
                                      ),
                                      onDragging: (handlerIndex, lowerValue,
                                          upperValue) {
                                        setState(() {});
                                      },
                                    ),
                                  )
                                ],
                              ),
                              AppDropDown(
                                dropdownTestItems: _dropdownTestItems,
                                label: 'What is your preferred interest rate?',
                                title: 'Preferred Interest Rate',
                                selectedItem: state.selectedItem,
                                onChangeDropdownList:
                                    _readPrefrenceData.onChangeDropdownList,
                              ),
                              verticalSpace(5),
                              ProgressButton(
                                minWidth: 100.0,
                                radius: 100.0,
                                progressIndicatorAligment:
                                    MainAxisAlignment.center,
                                stateWidgets: {
                                  ButtonState.idle: Text(
                                    'Reconfig Investment options',
                                    style: TextStyling.h2.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  ButtonState.loading: Text(
                                    '',
                                    style: TextStyling.h2.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  ButtonState.fail: Text(
                                    'Fail',
                                    style: TextStyling.h2.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  ButtonState.success: Text(
                                    'Success',
                                    style: TextStyling.h2.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  )
                                },
                                stateColors: {
                                  ButtonState.idle: Colors.grey.shade400,
                                  ButtonState.loading: kMintGreen,
                                  ButtonState.fail: Colors.red.shade300,
                                  ButtonState.success: Colors.green.shade400,
                                },
                                onPressed: () {
                                  Routes.seafarer
                                      .navigate('/investorDashboardView');
                                  // _cubit.navigateToRegisterScreenTwo();
                                },
                                state: ButtonState.idle,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class AppDropDown extends StatelessWidget {
  const AppDropDown({
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

FlutterSliderHandler customHandler(IconData icon) {
  return FlutterSliderHandler(
    decoration: const BoxDecoration(),
    child: Container(
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration:
            const BoxDecoration(color: kMintGreen, shape: BoxShape.circle),
        child: Icon(
          icon,
          color: Colors.white,
          size: 23,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: kMintGreen.withOpacity(0.3),
              spreadRadius: 0.05,
              blurRadius: 5,
              offset: const Offset(0, 1))
        ],
      ),
    ),
  );
}
