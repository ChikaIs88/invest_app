import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chipln/logic/core/firebase_core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:progress_state_button/progress_button.dart';

part 'investorregistercomplete_state.dart';

class InvestorregistercompleteCubit
    extends Cubit<InvestorregistercompleteState> {
  InvestorregistercompleteCubit()
      : super(const InvestorregistercompleteState());
  final appAuth = Modular.get<FirebaseConfiguration>();
// Method to update  state
  void updateImage(value) {
    emit(state.copyWith(profileImage: File(value.path)));
  }

  void updateUserImage(value) {
    emit(state.copyWith(profileImage: value));
  }

  void updateYears(value) {
    emit(state.copyWith(years: value));
  }

  void updateDescription(value) {
    emit(state.copyWith(description: value));
  }

  void updateWebsite(value) {
    emit(state.copyWith(website: value));
  }

  void updateButtonState(value) {
    emit(state.copyWith(buttonState: value));
  }

  void handleNavigateHome() {
    Modular.to.navigate('/companyLogin/companyDashboard');
  }

  void handleAddInfo() async {
    if (state.years != null &&
        state.description != null &&
        state.profileImage != null &&
        state.website != null) {
      await appAuth.info(imageFile: File(state.profileImage.path), data: {
        'years': state.years,
        'description': state.description,
        'website': state.website,
      }).then((value) {
        if (value == null) {
          updateButtonState(ButtonState.fail);
        } else {
          updateButtonState(ButtonState.success);
          Future.delayed(const Duration(seconds: 2), handleNavigateHome);
        }
      });
    } else {
      showToast('All Field are required');
    }
  }
}
