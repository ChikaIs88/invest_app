part of 'packages_cubit.dart';

class PackageState extends Equatable {
  const PackageState({
    this.packageName,
    this.description,
    this.unit,
    this.mabiala = true,
    this.selectedSector,
    this.amount = 0.0,
    this.rate,
    this.selectedItem,
  });

  final dynamic selectedItem;
  final dynamic selectedSector;

  final dynamic amount;
  final dynamic rate;
  final dynamic packageName;
  final dynamic description;
  final dynamic unit;
  final dynamic mabiala;

  PackageState copyWith(
      {dynamic selectedItem,
      selectedSector,
      dynamic amount,
      dynamic rate,
      dynamic packageName,
      dynamic description,
      dynamic unit,
      dynamic mabiala}) {
    return PackageState(
        selectedSector: selectedSector ?? this.selectedSector,
        selectedItem: selectedItem ?? this.selectedItem,
        amount: amount ?? this.amount,
        rate: rate ?? this.rate,
        description: description ?? this.description,
        mabiala: mabiala ?? this.mabiala,
        packageName: packageName ?? this.packageName,
        unit: unit ?? this.unit);
  }

  @override
  List<Object> get props => [
        selectedItem,
        selectedSector,
        amount,
        rate,
        packageName,
        description,
        unit,
      ];
}
