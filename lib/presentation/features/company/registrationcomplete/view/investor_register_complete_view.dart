import 'dart:io';

import 'package:chipln/logic/services/image_picker.dart';
import 'package:chipln/presentation/global/constants.dart';
import 'package:chipln/presentation/global/routing/routes.dart';
import 'package:chipln/presentation/global/text_styling.dart';
import 'package:chipln/presentation/global/ui_helper.dart';
import 'package:chipln/presentation/global/widget/app_text_field.dart';
import 'package:chipln/presentation/global/widget/header_text.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:sizer/sizer.dart';

import 'cubit/investorregistercomplete_cubit.dart';

class InvestorRegistorCompleteView extends StatelessWidget {
  const InvestorRegistorCompleteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => InvestorregistercompleteCubit(),
        child: Scaffold(
          body: SingleChildScrollView(
            child: BlocBuilder<InvestorregistercompleteCubit,
                InvestorregistercompleteState>(builder: (context, state) {
              final _readInvestorRegistorProfile =
                  context.read<InvestorregistercompleteCubit>();
              return Column(
                children: [
                  const HeaderText(
                    title: 'Complete Profile👋',
                    subTitle:
                        'Help us complete the celebration by adding\ncompany logo and description',
                  ),
                  verticalSpace(4.5),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 15.h,
                        width: 30.w,
                      ),
                      CircularProfileAvatar(
                        '',
                        backgroundColor: kPrimaryColor,
                        borderColor: Colors.white,
                        child: state.profileImage != null
                            ? Image.file(
                                File(state.profileImage.path),
                                fit: BoxFit.fill,
                              )
                            : null,
                        borderWidth: 8,
                        elevation: 6,
                        radius: 50,
                      ),
                      Positioned(
                        bottom: 5,
                        right: 1,
                        child: GestureDetector(
                          onTap: () => getImage(ImgSource.Both, context)
                              .then(_readInvestorRegistorProfile.updateImage),
                          child: const CircleAvatar(
                              backgroundColor: kBackgroundColor,
                              maxRadius: 25,
                              child: Icon(
                                EvaIcons.camera,
                                color: kPrimaryColor,
                              )),
                        ),
                      )
                    ],
                  ),
                  verticalSpace(4.5),
                  Padding(
                    padding: paddingLR20,
                    child: AppTextField(
                      key: const Key('register_years_textfield'),
                      label: 'Years',
                      hintText: 'Enter years of establish',
                      onChanged: (value) {},
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  verticalSpace(4.5),
                  Padding(
                    padding: paddingLR20,
                    child: AppTextField(
                      key: const Key('register_description_textfield'),
                      label: 'Description',
                      hintText: 'Enter Company Description',
                      maxLines: 5,
                      onChanged: (value) {},
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  verticalSpace(5),
                  Padding(
                    padding: paddingLR20,
                    child: ProgressButton(
                      minWidth: 100.0,
                      radius: 100.0,
                      progressIndicatorAligment: MainAxisAlignment.center,
                      stateWidgets: {
                        ButtonState.idle: Text(
                          'Complete Profile',
                          style: TextStyling.h2.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        ButtonState.loading: Text(
                          '',
                          style: TextStyling.h2.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        ButtonState.fail: Text(
                          'Fail',
                          style: TextStyling.h2.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        ButtonState.success: Text(
                          'Success',
                          style: TextStyling.h2.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        )
                      },
                      stateColors: {
                        ButtonState.idle: Colors.grey.shade400,
                        ButtonState.loading: kMintGreen,
                        ButtonState.fail: Colors.red.shade300,
                        ButtonState.success: Colors.green.shade400,
                      },
                      onPressed: () {
                        Routes.seafarer.navigate('/investorCompanyDashboard');
                      },
                      state: ButtonState.idle,
                    ),
                  ),
                ],
              );
            }),
          ),
        ));
  }
}
