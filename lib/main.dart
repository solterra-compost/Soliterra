import 'package:flutter/material.dart';
import 'package:solterra/core/theme/app_theme.dart';
import 'package:solterra/features/landing/presentation/pages/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
     home: LandingPage(),
    );
  }
}
