import 'package:csc_picker/csc_picker.dart';
import 'package:flexible_scrollbar/flexible_scrollbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:international_phone_field/international_phone_field.dart';
import 'package:chipln/app/logger_init.dart';
import 'package:chipln/logic/core/auth_status.dart';
import 'package:chipln/presentation/global/assets/assets.gen.dart';
import 'package:chipln/presentation/global/constants.dart';
import 'package:chipln/presentation/global/routing/routes.dart';
import 'package:chipln/presentation/global/text_styling.dart';
import 'package:chipln/presentation/global/ui_helper.dart';
import 'package:chipln/presentation/global/widget/app_text_field.dart';
import 'package:chipln/presentation/global/widget/validator/flutter_pw_validator.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:sizer/sizer.dart';
import '../cubit/register_cubit.dart';

class InvestorCompanyRegisterView extends StatelessWidget {
  final TextEditingController _passwordController = TextEditingController();
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    logger.d('Investor Companay RegisterScreen has been initialized');
    var buttonState = ButtonState.idle;
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
          body: Column(mainAxisSize: MainAxisSize.max, children: [
        Container(
          height: 30.h,
          width: double.infinity,
          decoration: const BoxDecoration(color: kPrimaryColor),
          child: Stack(
            children: [
              Assets.images.login.loginbg.svg(height: 30.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(10),
                    Text(
                      'Sign up',
                      style: TextStyling.h1,
                    ),
                    verticalSpace(2),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Signing up for Chipin is fast and free. No commitments or long term contracts.',
                            style: TextStyling.h2,
                          ),
                        ),
                        Assets.images.login.investorRegister.image(height: 60)
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        verticalSpace(8),
        Expanded(
          child: BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) async {
              final _cubit = context.read<RegisterCubit>();
              print(state.lastName);
              if (state.firstName!.isNotEmpty &&
                  state.lastName!.isNotEmpty &&
                  state.dateTime != null &&
                  state.emailAddress!.isNotEmpty &&
                  state.phoneNumber!.isNotEmpty &&
                  state.password!.isNotEmpty) {
                _cubit.updateColor(kPrimaryColor);
              } else {
                _cubit.updateColor(kGrishTransWhiteColor);
              }
              if (state.status == AuthStatus.nextPage &&
                  state.dateTime != null &&
                  state.phoneNumber != null) {
                FocusScope.of(context).unfocus();
              }
            },
            builder: (context, state) {
              final _cubit = context.watch<RegisterCubit>();
              return FlexibleScrollbar(
                alwaysVisible: true,
                scrollThumbBuilder: (ScrollbarInfo info) {
                  return AnimatedContainer(
                    width: info.isDragging ? 10 : 10,
                    height: info.thumbMainAxisSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color:
                          Colors.black.withOpacity(info.isDragging ? 1 : 0.6),
                    ),
                    duration: Duration(milliseconds: 500),
                  );
                },
                controller: _controller,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  controller: _controller,
                  children: [
                    Padding(
                      padding: paddingLR20,
                      child: Form(
                        key: _cubit.formKeyOne,
                        child: Column(
                          children: [
                            AppTextField(
                              key: const Key('register_companyName_textfield'),
                              label: 'Company Name',
                              hintText: 'Enter Company Name',
                              onChanged: _cubit.firstNameChanged,
                              validator: _cubit.validateFullName,
                              textInputAction: TextInputAction.next,
                            ),
                            verticalSpace(4.5),
                            AppTextField(
                              key: const Key('register_emailaddress_textfield'),
                              label: 'Enter Company Email Address',
                              hintText: 'Enter Email Address',
                              onChanged: _cubit.emailChanged,
                              keyboardType: TextInputType.emailAddress,
                              validator: _cubit.validateEmail,
                              textInputAction: TextInputAction.next,
                            ),
                            verticalSpace(4.5),
                            InterField(
                              onPhoneNumberChange: _cubit.onPhoneNumberChange,
                              initialPhoneNumber: state.phoneNumber,
                              initialSelection: state.isoCode,
                              enabledCountries: ['+234', '+233', '+44'],
                              addCountryComponentInsideField: true,
                              hintText: 'Enter Company Phone number',
                              hintStyle: TextStyling.bodyText1.copyWith(
                                fontSize: 13,
                                color: Color.fromRGBO(103, 112, 126, 1),
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: kPrimaryColor,
                                ),
                                gapPadding: 20.0,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            verticalSpace(4.5),
                            CSCPicker(
                              layout: Layout.vertical,
                              flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,
                              dropdownDecoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.grey.shade300, width: 1)),
                              disabledDropdownDecoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: Colors.grey.shade300,
                                  border: Border.all(
                                      color: Colors.grey.shade300, width: 1)),
                              defaultCountry: DefaultCountry.Nigeria,
                              selectedItemStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              dropdownHeadingStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                              dropdownItemStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              dropdownDialogRadius: 10.0,
                              searchBarRadius: 10.0,
                              onCountryChanged: (value) {},
                              onStateChanged: (value) {},
                              onCityChanged: (value) {},
                            ),
                            verticalSpace(4.5),
                            AppTextField(
                              controller: _passwordController,
                              key: const Key('register_password_textfield'),
                              label: 'Password',
                              hintText: 'Enter Company Password',
                              onChanged: _cubit.passwordChanged,
                              obscureText: state.showPassword!,
                              validator: _cubit.validatePassword,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  state.showPassword!
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: state.showPassword!
                                      ? kGreyColor
                                      : kPrimaryColor,
                                ),
                                onPressed: _cubit.togglePasswordVisibility,
                              ),
                              onFieldSubmitted: (val) =>
                                  _cubit.navigateToRegisterScreenTwo(),
                            ),
                            verticalSpace(1),
                            FlutterPwValidator(
                              controller: _passwordController,
                              minLength: 8,
                              uppercaseCharCount: 1,
                              numericCharCount: 1,
                              specialCharCount: 1,
                              width: 400,
                              height: 150,
                              onSuccess: () {},
                            ),
                            verticalSpace(4.5),
                            Text(
                                'By tapping the “Register” button below, you agree to our Terms and Privacy policy',
                                textAlign: TextAlign.center,
                                style: TextStyling.bodyText1.copyWith(
                                  fontSize: 13,
                                  color: Color.fromRGBO(103, 112, 126, 1),
                                )),
                            verticalSpace(4.5),
                            ProgressButton(
                              minWidth: 100.0,
                              radius: 100.0,
                              progressIndicatorAligment:
                                  MainAxisAlignment.center,
                              stateWidgets: {
                                ButtonState.idle: Text(
                                  'Register',
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
                                ButtonState.idle:
                                    state.btnColor ?? Colors.grey.shade400,
                                ButtonState.loading: kMintGreen,
                                ButtonState.fail: Colors.red.shade300,
                                ButtonState.success: Colors.green.shade400,
                              },
                              onPressed: () {
                                Routes.seafarer.navigate('/investorCompanyConfirmRegister');
                                // _cubit.navigateToRegisterScreenTwo();
                              },
                              state: buttonState,
                            ),
                            verticalSpace(4.5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Already have an account? ',
                                    textAlign: TextAlign.center,
                                    style: TextStyling.bodyText1.copyWith(
                                      color: const Color.fromRGBO(
                                          103, 112, 126, 1),
                                    )),
                                GestureDetector(
                                  onTap: Routes.seafarer.pop,
                                  child: Text('Login',
                                      textAlign: TextAlign.center,
                                      style: TextStyling.bodyText1.copyWith(
                                        color: kPrimaryColor,
                                      )),
                                ),
                              ],
                            ),
                            verticalSpace(2),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ])),
    );
  }
}
