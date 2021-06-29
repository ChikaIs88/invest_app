import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'packeges_state.dart';

class PackageCubit extends Cubit<PackageState> {
  PackageCubit() : super(const PackageState());

  dynamic onChangeDropdownList(selectedTest) {
    emit(state.copyWith(selectedItem: selectedTest));
  }
}
