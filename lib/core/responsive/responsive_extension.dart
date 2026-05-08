import 'package:flutter/material.dart';
import 'package:solterra/core/responsive/breakpoints.dart';

extension ResponsiveContext on BuildContext {
  // — raw values —
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  // — breakpoint booleans —
  bool get isMobile => screenWidth < Breakpoints.mobile;
  bool get isTablet =>
      screenWidth >= Breakpoints.mobile && screenWidth < Breakpoints.tablet;
  bool get isDesktop => screenWidth >= Breakpoints.tablet;

  // ★ THE MOST USEFUL METHOD — returns different values per breakpoint
  T responsive<T>({required T mobile, T? tablet, required T desktop}) {
    if (isDesktop) return desktop;
    if (isTablet) return tablet ?? desktop;
    return mobile;
  }

  // — device type enum —
  // DeviceType get deviceType {
  //   if (isDesktop) return DeviceType.desktop;
  //   if (isTablet) return DeviceType.tablet;
  //   return DeviceType.mobile;
  // }

  // — common responsive helpers (saves typing everywhere) —
  double get horizontalPadding =>
      responsive(mobile: 16, tablet: 32, desktop: 64);
  double get contentMaxWidth =>
      responsive(mobile: double.infinity, tablet: 720, desktop: 1200);

  // responsive column count for grids
  int get gridColumns => responsive(mobile: 1, tablet: 2, desktop: 4);
}
