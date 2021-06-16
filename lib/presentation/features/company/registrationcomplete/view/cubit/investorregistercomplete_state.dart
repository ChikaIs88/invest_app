part of 'investorregistercomplete_cubit.dart';

class InvestorregistercompleteState extends Equatable {
  const InvestorregistercompleteState({this.profileImage});

  final dynamic profileImage;

  InvestorregistercompleteState copyWith({dynamic profileImage}) {
    return InvestorregistercompleteState(
        profileImage: profileImage ?? this.profileImage);
  }

  @override
  List<Object> get props => [profileImage];
}
