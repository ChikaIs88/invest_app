import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chipln/app/logger_init.dart';
import 'package:chipln/presentation/global/assets/assets.gen.dart';
import 'package:chipln/presentation/global/constants.dart';
import 'package:chipln/presentation/global/ui_helper.dart';
import 'package:chipln/presentation/global/widget/app_flat_button.dart';
import 'package:chipln/presentation/global/widget/onboarding_item.dart';
import 'package:chipln/presentation/global/widget/pattern_background.dart';
import 'package:chipln/presentation/global/widget/transparent_button.dart';

import '../onboarding.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({Key? key}) : super(key: key);

  /// This method is used to generate
  /// the Page indicator based on the number of pages
  /// Indicator is selected by page
  /// Logic is defined in [_indicator] method below
  List<Widget> _buildPageIndicator(OnboardingCubit controller) {
    var list = <Widget>[];
    for (var i = 0; i < pages.length; i++) {
      list.add(i == controller.state ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : const Color(0xFFCCDAD8),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  /// List of pages contained in the onboarding screen
  final pages = <Widget>[
    OnboardingItem(
      svgUrl: Assets.images.startup.nomad.path,
      title: 'Save time and money',
      description: 'Find Investment options that suit your needs',
    ),
    OnboardingItem(
      svgUrl: Assets.images.startup.help.path,
      title: 'Find New investors',
      description: 'Connect with Interested investors daily',
    ),
    OnboardingItem(
      svgUrl: Assets.images.startup.money.path,
      title: 'Get Funded',
      description: 'Connect to an investor and get funded',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    logger.i('OnBoarding has been initialized');
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: PatternBackground(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: BlocBuilder<OnboardingCubit, int>(
            builder: (context, state) {
              final _cubit = context.watch<OnboardingCubit>();
              return ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      state == 2
                          ? AppFlatButton(label: '', onPressed: () {})
                          : AppFlatButton(label: 'Skip', onPressed: () {}),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.60,
                    child: PageView(
                      controller: _cubit.pageController,
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: _cubit.onPageChanged,
                      children: pages,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(_cubit),
                  ),
                  verticalSpace(3),
                  GestureDetector(
                    onTap: _cubit.navigateInvestorLoginView,
                    child: const TransparentBtn(
                      title: 'Investor',
                      color: kGrishTransWhiteColor,
                      textColor: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: _cubit.navigateInvestorCompanyLoginView,
                    child: const TransparentBtn(
                      title: 'Investment company',
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
