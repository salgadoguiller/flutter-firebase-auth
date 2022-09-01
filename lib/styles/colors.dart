import 'package:flutter/material.dart';

class MFColors {
  static Color? fromHex(String hexColor) {
    var regex = RegExp(r'^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$');
    if (!regex.hasMatch(hexColor)) {
      return null;
    }

    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  static const Color primaryColor = Color(0xff372224);
  static const Color primaryContainer = Color(0xfff7f2f3);

  static const Color secondary = Color(0xfffae4ec);
  static const Color secondaryContainer = Color(0xfff9dde7);
  static const Color onSecondaryContainer = Color(0xff56102a);

  static const Color tertiary = Color(0xff498467);
  static const Color tertiaryContainer = Color(0xffe5f1eb);
  static const Color onTertiaryContainer = Color(0xff070d0a);

  static const Color error = Color(0xffce0606);
  static const Color errorContainer = Color(0xffffd6d7);
  static const Color onErrorContainer = Color(0xff290001);

  static const Color surfaceVariant = Color(0xfff7f2f3);
  static const Color onSurfaceVariant = Color(0xff653e42);

  static const Color background = Color(0xfffef2c3);
  static const Color onBackground = Color(0xff261719);

  static const Color white = Color(0xffffffff);
  static const Color gray = Color(0xffE2E2E2);
}
