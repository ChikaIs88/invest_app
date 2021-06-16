part of 'login_cubit.dart';

// ignore: must_be_immutable
class LoginState extends Equatable {
 LoginState({
    this.emailAddress = '',
    this.btnColor = kGreyColor,
    this.password = '',
    this.showPassword = true,
    this.isActive = false,
    this.status = AuthStatus.initial,
  });

  final String? emailAddress;
  final String? password;
  final bool? showPassword;
  final Color? btnColor;
  final AuthStatus? status;
  final bool? isActive;

  LoginState copyWith({
    String? emailAddress,
    String? password,
    bool? showPassword,
    AuthStatus? status,
    Color? btnColor,
    bool? isActive
  }) {
    return LoginState(
      isActive: isActive ?? this.isActive,
      btnColor: btnColor,
      emailAddress: emailAddress ?? this.emailAddress,
      password: password ?? this.password,
      status: status ?? this.status,
      showPassword: showPassword ?? this.showPassword,
    );
  }

  @override
  List<Object?> get props => [
        emailAddress,
        password,
        status,
        showPassword,
        btnColor,
        isActive
      ];
}
