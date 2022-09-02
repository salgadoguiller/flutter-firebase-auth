part of 'signup_cubit.dart';

enum SignupStatus {
  initial,
  loading,
  success,
  error,
}

class SignupState extends Equatable {
  final SignupStatus status;

  const SignupState({
    this.status = SignupStatus.initial,
  });

  factory SignupState.initial() => const SignupState(
        status: SignupStatus.initial,
      );

  @override
  List<Object> get props => [status];

  SignupState copyWith({
    SignupStatus? status,
  }) {
    return SignupState(
      status: status ?? this.status,
    );
  }
}
