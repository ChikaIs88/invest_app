part of 'prefrence_cubit.dart';

class PrefrenceState extends Equatable {
  const PrefrenceState({this.selectedItem});

  final dynamic selectedItem;

  PrefrenceState copyWith({selectedItem}) {
    return PrefrenceState(selectedItem: selectedItem ?? this.selectedItem);
  }

  @override
  List<Object?> get props => [selectedItem];
}
