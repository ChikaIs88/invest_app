import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'investproductlist_state.dart';

class InvestproductlistCubit extends Cubit<InvestproductlistState> {
  InvestproductlistCubit() : super((InvestproductlistState()));

  void trackIndex(value){
    emit(state.copyWith(index: value));
  }
}
