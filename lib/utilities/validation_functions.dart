String? stringValidator(String? input) {
  if (input!.isEmpty) return 'Please provide a valid value.';
  return null;
}

String? emailValidator(String? input) {
  if (input!.isEmpty) return 'This field should not be empty.';
  final RegExp regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if (!regex.hasMatch(input)) {
    return 'Please, provide a valid email.';
  }
  return null;
}

// Should contain at least one upper case,
// Should contain at least one lower case,
// Should contain at least one digit
// Should contain at least one Special character,
// Must be at least 8 characters in length
// Example: $teevG111
String? passwordValidator(String? password) {
  if (password!.isEmpty) return 'This field should not be empty.';

  final RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (!regex.hasMatch(password)) {
    return 'The password doesn\'t meet the requirements.';
  }
  return null;
}

String? passwordMatch(
  bool? passwordIsValid,
  String? password,
  String? passwordConfirmed,
) {
  if (passwordIsValid == false || passwordIsValid == null) {
    return 'The password doesn\'t meet the requirements.';
  }
  if (passwordConfirmed!.isEmpty) return 'This field should not be empty.';
  if (password != passwordConfirmed) return 'The passwords don\'t match';
  return null;
}

String? isMarked(bool? selection) {
  return selection! ? null : 'This field is mandatory';
}
