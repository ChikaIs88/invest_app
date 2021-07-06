part of 'login_cubit.dart';

// ignore: must_be_immutable
class LoginState extends Equatable {
  const LoginState({
    this.buttonState = ButtonState.idle,
    this.consultantName = '',
    this.companyName = '',
    this.emailAddress = '',
    this.username = '',
    this.btnColor = kGreyColor,
    this.password = '',
    this.pin = '',
    this.showPassword = true,
    this.showPIN = true,
    this.isActive = false,
    this.status = AuthStatus.initial,
  });

  final String? consultantName;
  final String? companyName;
  final String? username;
  final ButtonState buttonState;
  final String? emailAddress;
  final String? password;
  final String? pin;
  final bool? showPassword;
  final bool? showPIN;
  final Color? btnColor;
  final AuthStatus? status;
  final bool? isActive;

  LoginState copyWith(
      {String? consultantName,
      String? companyName,
      String? username,
      String? emailAddress,
      String? password,
      String? pin,
      bool? showPassword,
      bool? showPIN,
      ButtonState? buttonState,
      AuthStatus? status,
      Color? btnColor,
      bool? isActive}) {
    return LoginState(
      isActive: isActive ?? this.isActive,
      btnColor: btnColor,
      consultantName: consultantName ?? this.consultantName,
      companyName: companyName ?? this.companyName,
      username: username ?? this.username,
      emailAddress: emailAddress ?? this.emailAddress,
      pin: pin ?? this.pin,
      buttonState: buttonState ?? this.buttonState,
      password: password ?? this.password,
      status: status ?? this.status,
      showPassword: showPassword ?? this.showPassword,
      showPIN: showPIN ?? this.showPIN,
    );
  }

  @override
  List<Object?> get props => [
        consultantName,
        companyName,
        username,
        emailAddress,
        password,
        status,
        showPassword,
        btnColor,
        isActive,
        buttonState
      ];
}
