import 'package:flutter/material.dart';

class CustomColor {
  static const Color primaryColor = Color(0xFFF59E0B);
  static Color secondaryColor = Color(0xFFD26324);
  static Color accentColor = Color(0xFFF19E5E);
  static Color bannerColor = Color(0xFFE48243);
  static Color yellowLightColor = Color(0xFFFDF5E6);
  static Color redDarkColor = Color(0xFF2B0100);
  static Color redColor = Color(0xFFD90404);
  static Color greyColor = Color(0xFF707070);
  static Color greenColor = Color(0xFF03A60F);
  static Color orangeLightColor = Color(0xFFFCF9F6);
  static Color blueColor = Color(0xFF307AFF);
  static Color blueContanier = Color(0xFF1B58AA);
  static const third = Color.fromARGB(255, 139, 163, 125);

  static MaterialColor primarySwatchColor =
      const MaterialColor(0xFFD26324, <int, Color>{
    50: Color(0xFFD26324),
    100: Color(0xFFD26324),
    200: Color(0xFFD26324),
    300: Color(0xFFD26324),
    400: Color(0xFFF19E5E),
    500: Color(0xFFF19E5E),
    600: Color(0xFFF19E5E),
    700: Color(0xFFF19E5E),
    800: Color(0xFFF19E5E),
    900: Color(0xFFF19E5E),
  });
  static LinearGradient blueLinearGradient = const LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      Color(0xFFD26324),
      Color(0xFFF19E5E),
    ],
  );

  static LinearGradient redLinearGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFD26324),
      Color(0xFFD26324),
    ],
  );
}
