import 'package:flutter/material.dart';
import 'package:solterra/core/responsive/breakpoints.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget? tablet;
  final Widget desktop;
  final Widget mobile;

  const ResponsiveLayout({
    required this.desktop,
    required this.mobile,
    this.tablet,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        if (width >= Breakpoints.desktop) {
          return desktop;
        } else if (width >= Breakpoints.tablet) {
          return tablet ?? desktop;
        } else {
          return mobile;
        }
      },
    );
  }
}
