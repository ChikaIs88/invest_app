import 'package:bloc/bloc.dart';
import 'package:chipln/logic/core/firebase_core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:progress_state_button/progress_button.dart';

part 'prefrence_state.dart';

class PrefrenceCubit extends Cubit<PrefrenceState> {
  PrefrenceCubit() : super(const PrefrenceState());
  final appAuth = Modular.get<Authentication>();

  dynamic onChangeDropdownList(value) {
    emit(state.copyWith(selectedItem: value));
  }

  dynamic onChangeDropDownSector(value) {
    emit(state.copyWith(selectedSector: value));
  }

  dynamic onChangeDropDownAmmount(value) {
    emit(state.copyWith(amount: value));
  }

  dynamic onChangeDropDownRate(value) {
    emit(state.copyWith(rate: value));
  }

  void updateButtonState(value) {
    emit(state.copyWith(buttonState: value));
  }

  void handleNavigateHome() {
    Modular.to.navigate('/investorDashboard');
  }

  void handleAddPrefrence() async {
    if (state.selectedSector != null &&
        state.selectedItem != null &&
        state.amount != null &&
        state.rate != null) {
        
      await appAuth.prefrence(data: {
        'amount': state.amount,
        'sector': state.selectedSector['keyword'],
        'rate': state.rate['no'],
        'type': state.selectedItem['keyword']
      }).then((value) {
        print(value);
        if (value == null) {
          updateButtonState(ButtonState.fail);
        } else {
          updateButtonState(ButtonState.success);
          Future.delayed(const Duration(seconds: 2), handleNavigateHome);
        }
      });
    }else{
      showToast('All Field are required');
    }
  }
}
