import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';

ThemeData themeDataLight = ThemeData(
  primarySwatch: CustomColor.primarySwatchColor,
  scaffoldBackgroundColor: Colors.white,
  iconTheme: const IconThemeData(
    color: Colors.grey,
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,

    titleTextStyle: TextStyle(
      fontFamily: "Tajawal",
      color: Colors.white,
      fontSize: 18.0.sp,
      fontWeight: FontWeight.bold,
    ),
    elevation: 0,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: CustomColor.primaryColor,
    elevation: 1.0,
    selectedLabelStyle: TextStyle(
      fontSize: 12.0.sp,
      fontWeight: FontWeight.w800,
    ),
    unselectedItemColor: Colors.grey,
  ),
  dividerColor: Colors.grey.shade300,
  fontFamily: "Tajawal",
);
