import 'package:flutter/material.dart';
import './colors.dart';

class AppTheme {
  static ThemeData getDefaultTheme() {
    return ThemeData(
      primarySwatch: Colors.brown,
      useMaterial3: true,
      scaffoldBackgroundColor: MFColors.white,
      primaryColor: MFColors.primaryColor,
      errorColor: MFColors.error,
      colorScheme: ColorScheme.fromSeed(
        seedColor: MFColors.primaryColor,
        brightness: Brightness.light,
        primary: MFColors.primaryColor,
        onPrimary: MFColors.white,
        primaryContainer: MFColors.primaryContainer,
        onPrimaryContainer: MFColors.onBackground,
        secondary: MFColors.secondary,
        onSecondary: MFColors.white,
        secondaryContainer: MFColors.secondaryContainer,
        onSecondaryContainer: MFColors.onSecondaryContainer,
        tertiary: MFColors.tertiary,
        onTertiary: MFColors.white,
        tertiaryContainer: MFColors.tertiaryContainer,
        onTertiaryContainer: MFColors.onTertiaryContainer,
        error: MFColors.error,
        onError: MFColors.white,
        errorContainer: MFColors.errorContainer,
        onErrorContainer: MFColors.onErrorContainer,
        background: MFColors.background,
        onBackground: MFColors.onBackground,
        surface: MFColors.white,
        onSurface: MFColors.onBackground,
        surfaceVariant: MFColors.surfaceVariant,
        onSurfaceVariant: MFColors.onSurfaceVariant,
        outline: MFColors.primaryColor,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'Barlow',
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: MFColors.white,
        selectedItemColor: MFColors.primaryColor,
        unselectedItemColor: MFColors.primaryColor.withOpacity(.2),
        selectedIconTheme: const IconThemeData(
          size: 26,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: MFColors.primaryColor,
          fontWeight: FontWeight.w400,
          fontFamily: 'DMSerifDisplay',
          fontStyle: FontStyle.normal,
          fontSize: 57.0,
        ),
        displayMedium: TextStyle(
          color: MFColors.primaryColor,
          fontWeight: FontWeight.w400,
          fontFamily: 'DMSerifDisplay',
          fontStyle: FontStyle.normal,
          fontSize: 45.0,
        ),
        displaySmall: TextStyle(
          color: MFColors.primaryColor,
          fontWeight: FontWeight.w400,
          fontFamily: 'DMSerifDisplay',
          fontStyle: FontStyle.normal,
          fontSize: 36.0,
        ),
        headlineLarge: TextStyle(
          color: MFColors.primaryColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'Barlow',
          fontStyle: FontStyle.normal,
          fontSize: 32.0,
        ),
        headlineMedium: TextStyle(
          color: MFColors.primaryColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'Barlow',
          fontStyle: FontStyle.normal,
          fontSize: 28.0,
        ),
        headlineSmall: TextStyle(
          color: MFColors.primaryColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'Barlow',
          fontStyle: FontStyle.normal,
          fontSize: 24.0,
        ),
        titleLarge: TextStyle(
          color: MFColors.primaryColor,
          fontWeight: FontWeight.w400,
          fontFamily: 'DMSerifDisplay',
          fontStyle: FontStyle.normal,
          fontSize: 22.0,
        ),
        titleMedium: TextStyle(
          color: MFColors.primaryColor,
          fontWeight: FontWeight.w700,
          fontFamily: 'Barlow',
          fontStyle: FontStyle.normal,
          fontSize: 16.0,
        ),
        titleSmall: TextStyle(
          color: MFColors.primaryColor,
          fontWeight: FontWeight.w500,
          fontFamily: 'Barlow',
          fontStyle: FontStyle.normal,
          fontSize: 14.0,
        ),
        bodyLarge: TextStyle(
          color: MFColors.primaryColor,
          fontWeight: FontWeight.w400,
          fontFamily: 'Barlow',
          fontStyle: FontStyle.normal,
          fontSize: 16.0,
        ),
        bodyMedium: TextStyle(
          color: MFColors.primaryColor,
          fontWeight: FontWeight.w400,
          fontFamily: 'Barlow',
          fontStyle: FontStyle.normal,
          fontSize: 14.0,
        ),
        bodySmall: TextStyle(
          color: MFColors.primaryColor,
          fontWeight: FontWeight.w400,
          fontFamily: 'Barlow',
          fontStyle: FontStyle.normal,
          fontSize: 12.0,
        ),
        labelLarge: TextStyle(
          color: MFColors.primaryColor,
          fontWeight: FontWeight.w700,
          fontFamily: 'Barlow',
          fontStyle: FontStyle.normal,
          fontSize: 14.0,
        ),
        labelMedium: TextStyle(
          color: MFColors.primaryColor,
          fontWeight: FontWeight.w700,
          fontFamily: 'Barlow',
          fontStyle: FontStyle.normal,
          fontSize: 12.0,
        ),
        labelSmall: TextStyle(
          color: MFColors.primaryColor,
          fontWeight: FontWeight.w700,
          fontFamily: 'Barlow',
          fontStyle: FontStyle.normal,
          fontSize: 11.0,
        ),
      ),
      iconTheme: const IconThemeData(
        size: 24,
        color: MFColors.primaryColor,
      ),
      pageTransitionsTheme: PageTransitionsTheme(
        // makes all platforms that can run Flutter apps display routes without any animation
        builders: {
          for (var k in TargetPlatform.values.toList())
            k: const _InanimatePageTransitionsBuilder()
        },
      ),
      outlinedButtonTheme: outlinedButton(),
      elevatedButtonTheme: elevatedButton(),
      textButtonTheme: textButton(),
      floatingActionButtonTheme: floatingActionButton(),
      cardTheme: const CardTheme(
        elevation: 0,
        color: MFColors.surfaceVariant,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      dialogTheme: const DialogTheme(
        backgroundColor: MFColors.primaryContainer,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: MFColors.onBackground,
          fontWeight: FontWeight.bold,
          fontFamily: 'Barlow',
          fontStyle: FontStyle.normal,
          fontSize: 24.0,
        ),
        contentTextStyle: TextStyle(
          color: MFColors.onSurfaceVariant,
          fontWeight: FontWeight.w400,
          fontFamily: 'Barlow',
          fontStyle: FontStyle.normal,
          fontSize: 14.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(28)),
        ),
      ),
      chipTheme: const ChipThemeData(
        elevation: 0,
        backgroundColor: MFColors.secondary,
        padding: EdgeInsets.symmetric(
          vertical: 6.0,
          horizontal: 12.0,
        ),
        labelStyle: TextStyle(
          color: MFColors.onSurfaceVariant,
          fontWeight: FontWeight.w700,
          fontFamily: 'Barlow',
          fontStyle: FontStyle.normal,
          fontSize: 14.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }

  static OutlinedButtonThemeData outlinedButton() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: MFColors.white,
        textStyle: const TextStyle(
            fontSize: 14.0,
            fontFamily: 'Barlow',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700),
        primary: MFColors.primaryColor,
        minimumSize: const Size(100, 36),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        side: const BorderSide(width: 1),
      ),
    );
  }

  // This is the original ElevatedButton
  static ElevatedButtonThemeData elevatedButton() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shadowColor: MFColors.gray,
        textStyle: const TextStyle(
            fontSize: 14.0,
            fontFamily: 'Barlow',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700),
        minimumSize: const Size(100, 36),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        onPrimary: MFColors.primaryColor,
        primary: MFColors.background,
        elevation: 3,
      ),
    );
  }

  //This is the FilledTonal version of the ElevatedButton
  static ElevatedButtonThemeData elevatedButtonFilledTonal() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 14.0,
          fontFamily: 'Barlow',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
        ),
        minimumSize: const Size(100, 36),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        onPrimary: MFColors.primaryColor,
        primary: MFColors.secondary,
        elevation: 0.0,
      ),
    );
  }

  //This is the FilledButton version of ElevatedButton
  static ElevatedButtonThemeData elevatedButtonFilledButton() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
            fontSize: 14.0,
            fontFamily: 'Barlow',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700),
        minimumSize: const Size(100, 36),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        elevation: 0.0,
        primary: MFColors.primaryColor,
        onPrimary: MFColors.white,
      ),
    );
  }

  static TextButtonThemeData textButton() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
            fontSize: 14.0,
            fontFamily: 'Barlow',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700),
        primary: MFColors.primaryColor,
        minimumSize: const Size(100, 36),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
      ),
    );
  }

  static FloatingActionButtonThemeData floatingActionButton() {
    return const FloatingActionButtonThemeData(
      iconSize: 24,
      extendedTextStyle: TextStyle(
          fontFamily: 'Barlow', fontWeight: FontWeight.w700, fontSize: 14.0),
      elevation: 1,
      extendedSizeConstraints: BoxConstraints(minHeight: 36),
    );
  }

  static CardTheme elevatedCardTheme() {
    return const CardTheme(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  static CardTheme outlinedCardTheme() {
    return const CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: MFColors.primaryColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  static ChipThemeData outlinedChipTheme() {
    return const ChipThemeData(
      elevation: 0,
      backgroundColor: MFColors.white,
      padding: EdgeInsets.symmetric(
        vertical: 6.0,
        horizontal: 12.0,
      ),
      labelStyle: TextStyle(
        color: MFColors.onSurfaceVariant,
        fontWeight: FontWeight.w700,
        fontFamily: 'Barlow',
        fontStyle: FontStyle.normal,
        fontSize: 14.0,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: MFColors.primaryColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }

  static ThemeData hamburguerMenuTheme() {
    return ThemeData(
      primaryColor: MFColors.primaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: const TextTheme(
        headline6: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: MFColors.white,
        ),
        bodyText1: TextStyle(
          fontSize: 18,
          fontFamily: 'Gotham-Book',
        ),
      ),
      dividerColor: MFColors.gray,
    );
  }
}

class _InanimatePageTransitionsBuilder extends PageTransitionsBuilder {
  const _InanimatePageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return child;
  }
}
