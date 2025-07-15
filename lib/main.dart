import 'package:flutter/material.dart';
import 'package:storebook/routes/app_router.dart';
import 'package:storebook/theme/app_theme.dart';

void main() {
  runApp(const StoreBookApp());
}

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
