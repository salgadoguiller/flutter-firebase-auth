import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/auth_repository.dart';
import '../../models/user_model.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthRepository _authRepository;
  StreamSubscription<User>? _userSubscription;

  AppBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(
          authRepository.currentUser.isEmpty
              ? const AppState.unauthenticated()
              : AppState.authenticated(authRepository.currentUser),
        ) {
    on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    on<AppPageChanged>(_onAppPageChanged);

    _userSubscription = _authRepository.user.listen((user) {
      add(AppUserChanged(user));
    });
  }

  void _onUserChanged(
    AppUserChanged event,
    Emitter<AppState> emit,
  ) {
    emit(event.user.isEmpty
        ? const AppState.unauthenticated()
        : AppState.authenticated(event.user));
  }

  void _onLogoutRequested(
    AppLogoutRequested event,
    Emitter<AppState> emit,
  ) {
    unawaited(_authRepository.signOut());
  }

  void _onAppPageChanged(
    AppPageChanged event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(currentPage: event.currentPage));
  }

  @override
  Future<void> close() async {
    await _userSubscription?.cancel();
    return super.close();
  }
}
