import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'company_assign_worker_state.dart';

class CompanyAssignWorkerCubit extends Cubit<CompanyAssignWorkerState> {
  CompanyAssignWorkerCubit() : super(const CompanyAssignWorkerState());

  void updateWorkerName(value) {
    emit(state.copyWith(name: value));
  }

  void updateWorkerEmail(value) {
    emit(state.copyWith(email: value));
  }

  void updateWorkerPassword(value) {
    emit(state.copyWith(password: value));
  }
}
