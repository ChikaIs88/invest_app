part of 'investproductlist_cubit.dart';

class InvestproductlistState extends Equatable {
  InvestproductlistState({this.index = 0});

  final int index;

  InvestproductlistState copyWith({int? index}) {
    return InvestproductlistState(index: index ?? this.index);
  }

  @override
  List<Object?> get props => [index];
}
