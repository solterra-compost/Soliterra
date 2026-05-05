import 'package:flutter/material.dart';
import 'package:solterra/core/router/app_router.dart';
import 'package:solterra/core/theme/app_theme.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  runApp(const MyApp());
  usePathUrlStrategy();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.theme,
      routerConfig: AppRouter.router(),
    );
  }
}
