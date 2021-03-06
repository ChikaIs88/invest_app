import 'package:chipln/logic/core/auth_status.dart';
import 'package:chipln/logic/core/firebase_core.dart';
import 'package:chipln/logic/core/validation_mixin.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:chipln/presentation/global/constants.dart';
import 'package:chipln/presentation/global/routing/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:progress_state_button/progress_button.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> with ValidationMixin {
  LoginCubit() : super(LoginState());

  // Local Variables
  final _formKeyOne = GlobalKey<FormState>();
  final _formKeyTwo = GlobalKey<FormState>();
  final appAuth = Modular.get<FirebaseConfiguration>();
  // Getters
  GlobalKey get formKeyOne => _formKeyOne;
  GlobalKey get formKeyTwo => _formKeyTwo;

  // Methods

  void updateColor(Color value) {
    emit(state.copyWith(btnColor: value));
  }

  void firstNameChanged(String value) {
    emit(state.copyWith(consultantName: value));
  }

  void lastNameChanged(String value) {
    emit(state.copyWith(companyName: value));
  }

  void usernameChanged(String value) {
    emit(state.copyWith(username: value));
  }

  void emailChanged(String value) {
    emit(state.copyWith(emailAddress: value));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value));
  }

  void pinChanged(String value) {
    emit(state.copyWith(pin: value));
  }

  void btnIsActive(bool value) {
    emit(state.copyWith(isActive: value));
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(showPassword: !state.showPassword!));
  }

  void togglePINVisibility() {
    emit(state.copyWith(showPIN: !state.showPIN!));
  }

  void navigateToLoginScreenTwo() {
    if (!_formKeyOne.currentState!.validate()) return;
    emit(state.copyWith(status: AuthStatus.nextPage));
    emit(state.copyWith(status: AuthStatus.initial));
  }

  Future<void> login() async {
    if (!_formKeyTwo.currentState!.validate()) return;
    emit(state.copyWith(status: AuthStatus.submissionInProgress));
    try {
      await Future.delayed(const Duration(seconds: 3));
      emit(state.copyWith(status: AuthStatus.submissionSuccess));
    } on Exception {
      emit(state.copyWith(status: AuthStatus.submissionFailure));
    }
  }

  void updateButtonState(value) {
    emit(state.copyWith(buttonState: value));
  }

  void handleNavigateHome() {
    Modular.to.navigate('/companyLogin/companyDashboard');
  }

  void handleLogin() {
    if (!_formKeyOne.currentState!.validate()) return;
    updateButtonState(ButtonState.loading);
    appAuth
        .signInCompanyUser(email: state.emailAddress, password: state.password)
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
