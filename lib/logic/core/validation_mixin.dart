// mixin for user validaion. It's a normal classes from which we can borrow methods(or variables) from without extending the class
mixin ValidationMixin {
  String? validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty';
    }
    return null;
  }

  String? validateFullName(String? fullName) {
    if (fullName!.length < 2) {
      return 'Enter a valid Name';
    }
    return null;
  }

  String? validateEmail(String? email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email!);
    if (!emailValid) {
      return 'Enter a Valid Email Address';
    }
    return null;
  }



  String? validatePhoneNumber(String? phoneNumber) {
    print(phoneNumber!.length);
    if (phoneNumber.length < 10) {
      return 'Enter a Valid Phone Number';
    }
    return null;
  }

  String? validateUserName(String? fullName) {
    if (fullName!.length < 2) {
      return 'Enter a valid Username';
    }
    return null;
  }

  String? validateBvn(String? phoneNumber) {
    print(phoneNumber!.length);
    if (phoneNumber.length < 11) {
      return 'Enter a Valid BVN';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password field cannot be empty';
    }

    // ignore: omit_local_variable_types
    bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(new RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(new RegExp(r'[a-z]'));

    bool hasMinLength = password.length > 8;

    if (hasDigits & hasUppercase & hasLowercase & hasMinLength) return null;
    return 'Please enter a valid password';
  }

  String? validatePIN(String? pin) {
    if (pin == null || pin.isEmpty) {
      return 'Password field cannot be empty';
    }

    // ignore: omit_local_variable_types
    bool hasDigits = pin.contains(RegExp(r'[0-9]'));

    // ignore: omit_local_variable_types
    bool hasMinLength = pin.length > 4;
    // ignore: omit_local_variable_types
    bool hasMaxLength = pin.length < 4;

    if (hasDigits & hasMinLength & hasMaxLength) return null;
    return 'Please enter a valid PIN';
  }
}
