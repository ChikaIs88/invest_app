import 'package:chipln/Scenes/Welcome/components/background.dart';
import 'package:chipln/app/logger_init.dart';
import 'package:chipln/presentation/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:chipln/presentation/global/assets/assets.gen.dart';
import 'package:chipln/presentation/global/ui_helper.dart';
import 'package:chipln/presentation/global/widget/app_flat_button.dart';
import 'package:chipln/presentation/global/widget/pattern_background.dart';
import 'package:chipln/presentation/global/widget/transparent_button.dart';
import 'package:flutter/material.dart';
import 'package:chipln/presentation/global/constants.dart';
import 'package:chipln/presentation/features/company/login/view/m_login_view.dart';
import 'package:chipln/presentation/features/company/login/view/s_login_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chipln/presentation/global/routing/routes.dart';
import 'package:chipln/presentation/global/text_styling.dart';
import 'package:chipln/presentation/global/widget/onboarding_item.dart';


class FirstPage extends StatelessWidget {
  FirstPage({Key? key}) : super(key: key);

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
      svgUrl: Assets.images.startup.help.path,
      title: 'Just to be sure....',
      description: 'Select your Consulant type.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    logger.i('Investment page has been initialized');
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
                  Container(
                    height: MediaQuery.of(context).size.height * 0.60,
                    child: PageView(
                      controller: _cubit.pageController,
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: _cubit.onPageChanged,
                      children: pages,
                    ),
                  ),
                 
                  verticalSpace(3),
                  GestureDetector(
                    onTap: _cubit.navigateMLoginView,
                    child: const TransparentBtn(
                      title: 'Main Consultant',
                      color: kGrishTransWhiteColor,
                      textColor: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: _cubit.navigateSLoginView,
                    child: const TransparentBtn(
                      title: 'Secondary Consultant',
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

