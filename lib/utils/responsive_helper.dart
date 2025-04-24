import 'package:flutter/material.dart';

class ResponsiveHelper {
  static const double mobileBreakpoint = 650;
  static const double tabletBreakpoint = 1100;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint &&
          MediaQuery.of(context).size.width < tabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint;

  // Optional: A convenience widget builder
  static Widget builder({
    required BuildContext context,
    required Widget mobile,
    Widget? tablet,
    required Widget desktop,
  }) {
    if (isDesktop(context)) {
      return desktop;
    } else if (isTablet(context)) {
      return tablet ?? mobile; // Use mobile layout if tablet layout is not provided
    } else {
      return mobile;
    }
  }

  // Helper for adjusting padding based on screen size
  static EdgeInsets getHorizontalPadding(BuildContext context) {
    if (isDesktop(context)) {
      return const EdgeInsets.symmetric(horizontal: 80.0);
    } else if (isTablet(context)) {
      return const EdgeInsets.symmetric(horizontal: 40.0);
    } else {
      return const EdgeInsets.symmetric(horizontal: 20.0);
    }
  }
}