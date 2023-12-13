import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade300),
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade100,
    brightness: Brightness.light,
    primary: Colors
        .grey, // Örnek olarak mavi rengi kullandım, istediğiniz birincil rengi seçebilirsiniz
    secondary: Colors
        .grey, // Örnek olarak mavi tonunu kullandım, istediğiniz ikincil rengi seçebilirsiniz
    onBackground: Colors.black,
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusColor: Colors.black,
    hoverColor: Colors.black,
    // Diğer input dekorasyonu temalarını da buraya ekleyebilirsiniz
  ),
  // Diğer tema özelliklerini de buraya ekleyebilirsiniz
);
