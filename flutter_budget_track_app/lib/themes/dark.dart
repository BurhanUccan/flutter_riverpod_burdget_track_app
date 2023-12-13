import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.black87,
    brightness: Brightness.dark,
    primary: Colors.grey[900]!,
    secondary: Colors.grey[800]!,
    onBackground: Colors.white,
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusColor: Colors.white,
    hoverColor: Colors.white,
  ),
);
