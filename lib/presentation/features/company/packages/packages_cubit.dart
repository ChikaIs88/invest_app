import 'package:bloc/bloc.dart';
import 'package:chipln/logic/core/firebase_core.dart';
import 'package:chipln/logic/core/variable.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

part 'packeges_state.dart';

class PackageCubit extends Cubit<PackageState> {
  PackageCubit() : super(const PackageState());
  final appConfig = Modular.get<FirebaseConfiguration>();
  final _formKeyOne = GlobalKey<FormState>();
  final _formKeyTwo = GlobalKey<FormState>();

  // Getters
  GlobalKey get formKeyOne => _formKeyOne;
  GlobalKey get formKeyTwo => _formKeyTwo;
  dynamic onChangeDropdownList(value) {
    emit(state.copyWith(selectedItem: value));
  }

  void onChangeDropDownSector(value) {
    emit(state.copyWith(selectedSector: value));
  }

  void onChangeDropDownAmmount(value) {
    emit(state.copyWith(amount: value));
  }

  void onChangeDropDownRate(value) {
    emit(state.copyWith(rate: value));
  }

  void updatePackageName(value) {
    emit(state.copyWith(packageName: value));
  }

  void updateDescription(value) {
    emit(state.copyWith(description: value));
  }

  void updateUnit(value) {
    emit(state.copyWith(unit: value));
  }

  void updatemabiala(value) {
    emit(state.copyWith(mabiala: value));
  }

//[Func] this use to add package
  void handleAddPackage({progress, foo}) async {
    if (state.packageName != null &&
        state.description != null &&
        state.unit != null &&
        state.amount != null &&
        state.selectedSector != null &&
        state.rate != null) {
      progress.showWithText('Loading...');
      var image = await appConfig.downloadImageURL(id: userUid);
      await appConfig.package(data: {
        'id': DateTime.now(),
        'image': image,
        'companyId': userUid,
        'company': userInfo.company_name,
        'packageName': state.packageName,
        'description': state.description,
        'unit': state.unit,
        'price': state.amount,
        'type': state.selectedSector['keyword'],
        'rate': state.rate['keyword']
      }).then((value) => {
            if (value == null)
              {progress.dismiss(), showToast('Failed Adding Package')}
            else
              {
                foo!.collapseFAB(),
                progress.dismiss(),
                showToast('Added Package Sucesfully')
              }
          });
    } else {
      showToast('complete the package field');
    }
  }
}
