import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFADC178)),
  primaryColor: Color(0xFFF0EAD2),

  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xFF483B33)),
    bodyMedium: TextStyle(color: Color(0xFF483B33)),
    bodySmall: TextStyle(color: Color(0xFF483B33)),

    labelLarge: TextStyle(color: Color(0xFFA98467)),
    labelMedium: TextStyle(color: Color(0xFFA98467)),
    labelSmall: TextStyle(color: Color(0xFFA98467)),
    
    titleLarge: TextStyle(
      color: Color(0xFF483B33),
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: Color(0xFF483B33),
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      color: Color(0xFF483B33),
      fontWeight: FontWeight.bold,
    ),
  ),

  dividerColor: Color(0xFFDDE5B6),
  scaffoldBackgroundColor: Color(0xFFF0EAD2),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFF0EAD2),
    foregroundColor: Color(0xFF483B33),
    centerTitle: true,
  ),
);
