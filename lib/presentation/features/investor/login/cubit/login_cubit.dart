import 'package:chipln/logic/core/auth_status.dart';
import 'package:chipln/logic/core/firebase_core.dart';
import 'package:chipln/logic/core/storage.dart';
import 'package:chipln/logic/core/validation_mixin.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:chipln/presentation/global/constants.dart';
import 'package:chipln/presentation/global/routing/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:progress_state_button/progress_button.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> with ValidationMixin {
  LoginCubit()
      : super(
            LoginState()); //allows the Logincubit to understand which state you are mapping to

  // Local Variables
  final _formKeyOne = GlobalKey<FormState>();
  final _formKeyTwo = GlobalKey<FormState>();
  final appAuth = Modular.get<Authentication>();
  // Getters
  GlobalKey get formKeyOne => _formKeyOne;
  GlobalKey get formKeyTwo => _formKeyTwo;

  // Methods

  void handleNavigateToRegister() {
    Modular.to.pushNamed('/investorlogin/investorRegister');
  }

  void updateColor(Color value) {
    emit(state.copyWith(
        btnColor:
            value)); //this is to update a singular state. It combine the old states of other variables to this new one
  }

  void emailChanged(String value) {
    emit(state.copyWith(emailAddress: value));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value));
  }

  void usernameChanged(String value) {
    emit(state.copyWith(username: value));
  }

  void btnIsActive(bool value) {
    emit(state.copyWith(isActive: value));
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(showPassword: !state.showPassword!));
  }

  void updateButtonState(value) {
    emit(state.copyWith(buttonState: value));
  }

  void handleNavigateHome() {
    Modular.to.navigate('/investorDashboard');
  }

  void handleLogin() {
    if (!_formKeyOne.currentState!.validate()) return;
    updateButtonState(ButtonState.loading);
    appAuth
        .signInUser(email: state.emailAddress, password: state.password)
        .then((value) {
      if (value == null) {
        updateButtonState(ButtonState.fail);
      } else {
        updateButtonState(ButtonState.success);
       
        Future.delayed(const Duration(seconds: 2), handleNavigateHome);
      }
    });
  }
}
