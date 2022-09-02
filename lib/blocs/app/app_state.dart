part of 'app_bloc.dart';

enum AppAuthStatus {
  authenticated,
  unauthenticated,
}

enum AppCurrentPage {
  login,
  signup,
  home,
}

class AppState extends Equatable {
  final AppAuthStatus status;
  final AppCurrentPage currentPage;
  final User user;

  const AppState._({
    required this.status,
    this.currentPage = AppCurrentPage.login,
    this.user = User.empty,
  });

  const AppState.authenticated(User user)
      : this._(
          status: AppAuthStatus.authenticated,
          currentPage: AppCurrentPage.home,
          user: user,
        );

  const AppState.unauthenticated()
      : this._(
          status: AppAuthStatus.unauthenticated,
        );

  const AppState.signup()
      : this._(
          status: AppAuthStatus.unauthenticated,
          currentPage: AppCurrentPage.signup,
        );

  AppState copyWith({
    AppAuthStatus? status,
    AppCurrentPage? currentPage,
    User? user,
  }) {
    return AppState._(
      status: status ?? this.status,
      currentPage: currentPage ?? this.currentPage,
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [status, user, currentPage];
}
