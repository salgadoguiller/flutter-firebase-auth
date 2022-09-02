import 'package:auth/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../blocs/app/app_bloc.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';

List<Page> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomeScreen.page('Home Page')];
    case AppStatus.unauthenticated:
      return [LoginScreen.page()];
  }
}
