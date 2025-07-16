import 'package:flutter/material.dart';
import 'package:storebook/presentation/routes/app_routes.dart';
import 'package:storebook/theme/app_theme.dart';

class StoreBookApp extends StatelessWidget {
  const StoreBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store Book App',
      theme: darkTheme,
      routes: routes,
    );
  }
}