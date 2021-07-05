part of 'prefrence_cubit.dart';

class PrefrenceState extends Equatable {
  const PrefrenceState(
      {this.selectedSector,
      this.amount = 0.0,
      this.rate,
      this.selectedItem,
      this.buttonState = ButtonState.idle});

  final dynamic selectedItem;
  final dynamic selectedSector;
  final dynamic amount;
  final dynamic rate;
  final ButtonState? buttonState;

  PrefrenceState copyWith({
    selectedItem,
    selectedSector,
    amount,
    rate,
    buttonState,
  }) {
    return PrefrenceState(
      buttonState: buttonState ?? this.buttonState,
      selectedSector: selectedSector ?? this.selectedSector,
      selectedItem: selectedItem ?? this.selectedItem,
      amount: amount ?? this.amount,
      rate: rate ?? rate,
    );
  }

  @override
  List<Object?> get props =>
      [selectedItem, selectedSector, amount, rate, buttonState];
}
