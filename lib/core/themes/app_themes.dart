import 'package:currency/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.grey,
    inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder()),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black87,
    inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder()),
  );
}
