part of 'packages_cubit.dart';

class PackageState extends Equatable {
  const PackageState({this.selectedItem});

  final dynamic selectedItem;

  PackageState copyWith({selectedItem}) {
    return PackageState(selectedItem: selectedItem ?? this.selectedItem);
  }

  @override
  List<Object?> get props => [selectedItem];
}
