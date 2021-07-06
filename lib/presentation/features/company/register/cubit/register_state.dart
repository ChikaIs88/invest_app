part of 'register_cubit.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.firstName = '',
    this.buttonState = ButtonState.idle,
    this.state = '',
    this.lastName = '',
    this.username = '',
    this.city = '',
    this.phoneNumber = '',
    this.emailAddress = '',
    this.isoCode = '+234',
    this.dateTime,
    this.accountType,
    this.btnColor,
    this.password = '',
    this.showPassword = true,
    this.status = AuthStatus.initial,
  });

  final String? firstName;
    final ButtonState buttonState;
  final String? lastName;
  final String? isoCode;
  final String? username;
  final DateTime? dateTime;
  final String? phoneNumber;
  final String? emailAddress;
  final String? password;
  final String? accountType;
  final bool? showPassword;
  final Color? btnColor;
  final AuthStatus? status;
  final String state;
  final String city;

  RegisterState copyWith({
    String? firstName,
    String? lastName,
    String? username,
    String? phoneNumber,
    String? emailAddress,
    String? password,
    String? accountType,
    String? state,
    String? city,
    bool? showPassword,
    DateTime? dateTime,
    String? isoCode,
    AuthStatus? status,
    Color? btnColor,
    ButtonState? buttonState,
  }) {
    return RegisterState(
      city: city ?? this.city,
      state: state ?? this.state,
      isoCode: isoCode ?? this.isoCode,
      buttonState: buttonState ?? this.buttonState,
      btnColor: btnColor,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      username: username ?? this.username,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      emailAddress: emailAddress ?? this.emailAddress,
      accountType: accountType ?? this.accountType,
      password: password ?? this.password,
      dateTime: dateTime ?? this.dateTime,
      status: status ?? this.status,
      showPassword: showPassword ?? this.showPassword,
    );
  }

  @override
  List<Object?> get props => [
        firstName,
        username,
        phoneNumber,
        emailAddress,
        password,
        accountType,
        status,
        showPassword,
        dateTime,
        btnColor,
        buttonState,
        lastName,
        isoCode, 
        city,
        state
      ];
}
