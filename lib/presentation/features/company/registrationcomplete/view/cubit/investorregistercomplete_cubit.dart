import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'investorregistercomplete_state.dart';

class InvestorregistercompleteCubit
    extends Cubit<InvestorregistercompleteState> {
  InvestorregistercompleteCubit()
      : super(const InvestorregistercompleteState());

// Method to update  state
  void updateImage(value) {
    emit(state.copyWith(profileImage: value));
  }
}
