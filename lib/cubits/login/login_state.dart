part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  error,
}

class LoginState extends Equatable {
  final LoginStatus status;

  const LoginState({
    this.status = LoginStatus.initial,
  });

  factory LoginState.initial() => const LoginState(
        status: LoginStatus.initial,
      );

  @override
  List<Object> get props => [status];

  LoginState copyWith({
    LoginStatus? status,
  }) {
    return LoginState(
      status: status ?? this.status,
    );
  }
}
