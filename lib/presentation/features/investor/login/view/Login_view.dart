// ignore: file_names
import 'package:chipln/logic/core/firebase_core.dart';
import 'package:chipln/logic/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
// ignore: unused_import
import 'package:chipln/presentation/global/widget/transparent_button.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:sizer/sizer.dart';

import '../cubit/login_cubit.dart';

class InvestorLoginView extends StatelessWidget {
  final TextEditingController _passwordController = TextEditingController();

  String? emailAddress = '';
  String? password = '';
  String? username = '';

  @override
  Widget build(BuildContext context) {
    logger.d(' LoginScreen has been initialized');

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
          body: InvestorLoginBodySection(
              passwordController: _passwordController)),
    );
  }
}

class InvestorLoginBodySection extends StatelessWidget {
  const InvestorLoginBodySection({
    Key? key,
    required TextEditingController passwordController,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
      BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          //listen to the change and run whatever it gets
          final _cubit = context.read<LoginCubit>();
          if (state.emailAddress!.isNotEmpty && state.password!.isNotEmpty) {
            _cubit.updateColor(kPrimaryColor);
          } else {
            _cubit.updateColor(kGrishTransWhiteColor);
          }
          if (state.status == AuthStatus.nextPage) {}
        },
        builder: (context, state) {
          //allows you update the ui
          final _cubit = context.watch<LoginCubit>();
          return Column(
            children: [
              Container(
                height: 25.h,
                width: double.infinity, //target the whole width
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
                            'Welcome',
                            style: TextStyling.h1,
                          ),
                          Row(
                            children: [
                              Text(
                                'Happy to see you again!',
                                style: TextStyling.h2,
                              ),
                              Assets.images.login.welcome.image(height: 60)
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
                        key: const Key('Login_emailaddress_textfield'),
                        label: 'Email Address',
                        hintText: 'Enter Email Address',
                        onChanged: _cubit.emailChanged,
                        keyboardType: TextInputType.emailAddress,
                        validator: _cubit.validateEmail,
                        textInputAction: TextInputAction.next,
                      ),
                      verticalSpace(4.5),
                      AppTextField(
                          key: const Key('Login_password_textfield'),
                          controller: _passwordController,
                          label: 'Password',
                          endWidget: GestureDetector(
                            onTap: () {},
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text('Forget Password',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.quicksand(
                                      color: kPrimaryColor, fontSize: 13)),
                            ),
                          ),
                          hintText: 'Password',
                          onChanged: _cubit.passwordChanged,
                          obscureText: state.showPassword!,
                          validator: _cubit.validatePassword,
                          suffixIcon: IconButton(
                            //puts your icon at the end of the input field
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
                              _cubit.handleLogin() //brings submission button
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
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          _cubit.handleLogin();
                        },
                        state: state.buttonState,
                      ),
                      verticalSpace(3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? ",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.quicksand(
                                color: Colors.black,
                              )),
                          GestureDetector(
                            onTap: _cubit.handleNavigateToRegister,
                            child: Text('Sign Up',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.quicksand(
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
    ]));
  }
}
