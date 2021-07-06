part of 'investorregistercomplete_cubit.dart';

class InvestorregistercompleteState extends Equatable {
  const InvestorregistercompleteState(
      {this.buttonState = ButtonState.idle,
      this.years = '',
      this.description = '',
      this.website = '',
      this.profileImage});

  final dynamic profileImage;
  final String years;
  final String description;
  final String website;
  final ButtonState buttonState;

  InvestorregistercompleteState copyWith(
      {dynamic profileImage,
      String? years,
      String? description,
      ButtonState? buttonState,
      String? website}) {
    return InvestorregistercompleteState(
        buttonState: buttonState ?? this.buttonState,
        website: website ?? this.website,
        years: years ?? this.years,
        description: description ?? this.description,
        profileImage: profileImage ?? this.profileImage);
  }

  @override
  List<Object> get props => [profileImage, years, website, buttonState, description];
}
