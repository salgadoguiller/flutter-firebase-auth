import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/auth_repository.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository _authRepository;

  SignupCubit(this._authRepository) : super(SignupState.initial());

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    if (state.status == SignupStatus.loading) return;

    emit(state.copyWith(status: SignupStatus.loading));

    try {
      await _authRepository.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(state.copyWith(status: SignupStatus.success));
    } catch (error) {
      emit(state.copyWith(status: SignupStatus.error));
    }
  }
}
