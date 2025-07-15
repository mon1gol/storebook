import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFADC178)),
  primaryColor: Color(0xFFF0EAD2),

  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xFFA98467)),
    bodyMedium: TextStyle(color: Color(0xFFA98467)),
    bodySmall: TextStyle(color: Color(0xFFA98467)),
    
    titleLarge: TextStyle(
      color: Color.fromARGB(255, 72, 59, 51),
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: Color.fromARGB(255, 72, 59, 51),
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      color: Color.fromARGB(255, 72, 59, 51),
      fontWeight: FontWeight.bold,
    ),
  ),

  dividerColor: Color(0xFFDDE5B6),
  scaffoldBackgroundColor: Color(0xFFF0EAD2),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFF0EAD2),
    foregroundColor: Color.fromARGB(255, 72, 59, 51),
    centerTitle: true,
  ),
);
