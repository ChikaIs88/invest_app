import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:chipln/logic/core/auth_status.dart';
import 'package:chipln/logic/core/validation_mixin.dart';
import 'package:chipln/presentation/global/constants.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> with ValidationMixin {
  RegisterCubit() : super(RegisterState());

  // Local Variables
  final _formKeyOne = GlobalKey<FormState>();
  final _formKeyTwo = GlobalKey<FormState>();

  // Getters
  GlobalKey get formKeyOne => _formKeyOne;
  GlobalKey get formKeyTwo => _formKeyTwo;

  // Methods

  void onPhoneNumberChange(
      String number,
      String internationalizedPhoneNumber,
      String isoCode,
      String dialCode,
      String countryCapital,
      String countryContinent,
      String countryCurrency,
      String countryName) {
    emit(state.copyWith(phoneNumber: number, isoCode: dialCode));
  }

  void firstNameChanged(String value) {
    emit(state.copyWith(firstName: value));
  }

  void lastNameChanged(String value) {
    emit(state.copyWith(lastName: value));
  }

  void dateOfBirth(DateTime? value) {
    emit(state.copyWith(dateTime: value));
  }

  void updateColor(Color value) {
    emit(state.copyWith(btnColor: value));
  }

  void usernameChanged(String value) {
    emit(state.copyWith(username: value));
  }

  void phoneNumberChanged(String value) {
    emit(state.copyWith(phoneNumber: value));
  }

  void emailChanged(String value) {
    emit(state.copyWith(emailAddress: value));
  }

  void accountTypeChanged(String value) {
    emit(state.copyWith(accountType: value));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value));
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(showPassword: !state.showPassword!));
  }

  void navigateToRegisterScreenTwo() {
    if (!_formKeyOne.currentState!.validate()) return;
    emit(state.copyWith(status: AuthStatus.nextPage));
    emit(state.copyWith(status: AuthStatus.initial));
  }

  Future<void> register() async {
    if (!_formKeyTwo.currentState!.validate()) return;
    emit(state.copyWith(status: AuthStatus.submissionInProgress));
    try {
      await Future.delayed(Duration(seconds: 3));
      emit(state.copyWith(status: AuthStatus.submissionSuccess));
    } on Exception {
      emit(state.copyWith(status: AuthStatus.submissionFailure));
    }
  }
}
