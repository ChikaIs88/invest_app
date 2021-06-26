import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chipln/app/logger_init.dart';
import 'package:chipln/logic/core/auth_status.dart';
import 'package:chipln/presentation/global/assets/assets.gen.dart';
import 'package:chipln/presentation/global/constants.dart';
import 'package:chipln/presentation/global/routing/routes.dart';
import 'package:chipln/presentation/global/text_styling.dart';
import 'package:chipln/presentation/global/ui_helper.dart';
import 'package:chipln/presentation/global/widget/app_text_field.dart';
import 'package:chipln/presentation/global/widget/transparent_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:sizer/sizer.dart';

import '../cubit/login_cubit.dart';

class SLoginView extends StatelessWidget {
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _sconsultantController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var buttonState = ButtonState.idle;
    logger.d('Investor Companay LoginScreen has been initialized');

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
          body: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.max, children: [
        BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            final _cubit = context.read<LoginCubit>();
            if (state.emailAddress!.isNotEmpty && state.password!.isNotEmpty) {
              _cubit.updateColor(kPrimaryColor);
            } else {
              _cubit.updateColor(kGrishTransWhiteColor);
            }
            if (state.status == AuthStatus.nextPage) {
              FocusScope.of(context).unfocus();

              // buttonState = ButtonState.loading;
              _cubit.handleLogin();
            }
          },
          builder: (context, state) {
            final _cubit = context.watch<LoginCubit>();
            return Column(
              children: [
                Container(
                  height: 25.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: kPrimaryColor),
                  child: Stack(
                    children: [
                      Assets.images.login.loginbg.svg(height: 25.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            verticalSpace(10),
                            Text(
                              'Welcome Secondary Consultant',
                              style: TextStyling.h1,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Happy to see you again!',
                                  style: TextStyling.h2,
                                ),
                                Assets.images.login.investorLogin.image(height: 60)
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: paddingLR20,
                  child: Form(
                    key: _cubit.formKeyOne,
                    child: Column(
                      children: [
                        verticalSpace(8),
                        AppTextField(
                          controller: _sconsultantController,
                          key: const Key('Login_consultantName_textfield'),
                          label: 'Consultant Name',
                          hintText: 'Enter Consultant Name',
                          onChanged: _cubit.firstNameChanged,
                          validator: _cubit.validateFullName,
                          textInputAction: TextInputAction.next,
                        ),
                        verticalSpace(4.5),
                        AppTextField(
                          controller: _companyController,
                          key: const Key('Login_companyName_textfield'),
                          label: 'Company Name',
                          hintText: 'Enter Company Name',
                          onChanged: _cubit.firstNameChanged,
                          validator: _cubit.validateFullName,
                          textInputAction: TextInputAction.next,
                        ),
                        verticalSpace(4.5),
                        AppTextField(
                          controller: _pinController,
                          key: const Key('Login_PIN_textfield'),
                          label: 'PIN Code',
                          hintText: 'XXXX',
                          onChanged: _cubit.pinChanged,
                          obscureText: state.showPIN!,
                          validator: _cubit.validatePIN,
                          suffixIcon: IconButton(
                            icon: Icon(
                              state.showPassword!
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: state.showPIN!
                                  ? kGreyColor
                                  : kPrimaryColor,
                            ),
                            onPressed: _cubit.togglePINVisibility,
                          ),
                          onFieldSubmitted: (val) =>
                              _cubit.navigateToLoginScreenTwo(),
                        ),
                        verticalSpace(4),
                        ProgressButton(
                          minWidth: 100.0,
                          radius: 100.0,
                          progressIndicatorAligment: MainAxisAlignment.center,
                          stateWidgets: {
                            ButtonState.idle: Text(
                              'Login',
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
                            ButtonState.idle: state.emailAddress!.isNotEmpty &&
                                    state.password!.isNotEmpty
                                ? kPrimaryColor
                                : Colors.grey.shade400,
                            ButtonState.loading: kMintGreen,
                            ButtonState.fail: Colors.red.shade300,
                            ButtonState.success: Colors.green.shade400,
                          },
                          onPressed: () {
                            _cubit.navigateToLoginScreenTwo();
                          },
                          state: buttonState,
                        ),
                        verticalSpace(3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account? ",
                                textAlign: TextAlign.center,
                                style: TextStyling.bodyText1.copyWith(
                                  color: Colors.black,
                                )),
                            GestureDetector(
                              onTap: () {
                                Routes.seafarer('/investorCompanyRegister');
                              },
                              child: Text('Sign Up',
                                  textAlign: TextAlign.center,
                                  style: TextStyling.bodyText1.copyWith(
                                    color: kPrimaryColor,
                                  )),
                            ),
                          ],
                        ),
                        verticalSpace(8),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        )
      ]))),
    );
  }
}
