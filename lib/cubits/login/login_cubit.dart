import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(LoginState.initial());

  Future<void> logInWithCredentials(String email, String password) async {
    if (state.status == LoginStatus.loading) return;

    emit(state.copyWith(status: LoginStatus.loading));

    try {
      await _authRepository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(state.copyWith(status: LoginStatus.success));
    } catch (error) {
      emit(state.copyWith(status: LoginStatus.error));
    }
  }
}
