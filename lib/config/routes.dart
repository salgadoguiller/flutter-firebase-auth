import 'package:auth/screens/home.dart';
import 'package:flutter/material.dart';
import '../blocs/app/app_bloc.dart';
import '../screens/home.dart';

List<Page> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page('Home Page')];
    case AppStatus.unauthenticated:
      return [HomePage.page('Login')];
  }
}
