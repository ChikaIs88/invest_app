import 'package:chipln/presentation/global/assets/assets.gen.dart';
import 'package:chipln/presentation/global/constants.dart';
import 'package:chipln/presentation/global/routing/routes.dart';
import 'package:chipln/presentation/global/text_styling.dart';
import 'package:chipln/presentation/global/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sizer/sizer.dart';

class ConfirmInvestorRegistrationView extends StatelessWidget {
  const ConfirmInvestorRegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomSheet: BottomSheetSelector(),
      body: ConfirInvestorPageBody(),
    );
  }
}

class ConfirInvestorPageBody extends StatelessWidget {
  const ConfirInvestorPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 1),
          Image.asset(
            Assets.animation.accountsucess.path,
            height: MediaQuery.of(context).size.height * 0.4,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Congratulation!! Your account has been created',
              style: TextStyling.h1.copyWith(color: kTransBlack),
              textAlign: TextAlign.center,
            ),
          ),
          verticalSpace(3),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Do you want to complete the registration?',
              style: TextStyling.h2.copyWith(color: kTransBlack),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}

class BottomSheetSelector extends StatelessWidget {
  const BottomSheetSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => Routes.seafarer.navigate('/'),
          child: Container(
            width: 50.w,
            alignment: Alignment.center,
            height: 7.h,
            decoration: BoxDecoration(
              color: Colors.red[100],
            ),
            child: Text(
              'Not Now 👎',
              style: TextStyling.h2.copyWith(color: kGrishTransWhiteColor),
            ),
          ),
        ),
        InkWell(
          onTap: () => Modular.to.navigate('/companyLogin/completeRegister'),
          child: Container(
            width: 50.w,
            height: 7.h,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
            ),
            child: Text(
              'Sure ✌️',
              style: TextStyling.h2.copyWith(color: kGrishTransWhiteColor),
            ),
          ),
        ),
      ],
    );
  }
}
