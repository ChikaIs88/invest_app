import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'prefrence_state.dart';

class PrefrenceCubit extends Cubit<PrefrenceState> {
  PrefrenceCubit() : super(const PrefrenceState());

  dynamic onChangeDropdownList(selectedTest) {
    emit(state.copyWith(selectedItem: selectedTest));
  }
}
