class RegistrationForm {
  final String email;
  final String password;
  final String confirmedPassword;
  bool confirmedTerms;

  RegistrationForm(
      {required this.email,
      required this.password,
      required this.confirmedPassword,
      required this.confirmedTerms});

  @override
  String toString() {
    return 'Type: RegistrationForm, email: $email, password: $password, confirmedPassword: $confirmedPassword, confirmedTerms: $confirmedTerms';
  }

  RegistrationForm copyWith(
      {String? email,
      String? password,
      String? confirmedPassword,
      bool? confirmedTerms}) {
    return RegistrationForm(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      confirmedTerms: confirmedTerms ?? this.confirmedTerms,
    );
  }
}
