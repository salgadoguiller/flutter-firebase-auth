import 'package:auth/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../blocs/app/app_bloc.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';

List<Page> onGenerateAppViewPages(
  AppState state,
  List<Page<dynamic>> pages,
) {
  if (state.status == AppAuthStatus.authenticated) {
    return [HomeScreen.page('Home Page')];
  }

  if (state.status == AppAuthStatus.unauthenticated) {
    if (state.currentPage == AppCurrentPage.login) {
      return [LoginScreen.page()];
    }

    if (state.currentPage == AppCurrentPage.signup) {
      return [SignupScreen.page()];
    }
  }

  return [LoginScreen.page()];
}
