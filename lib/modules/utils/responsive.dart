import 'package:flutter/material.dart';

enum ResponsiveSize {
  mobile,
  tablet,
  desktop,
}

class Responsive {
  static double mobileWidth = 475.0;
  static double tabletWidth = 768.0;
  static double desktopWidth = 1386.0;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletWidth;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletWidth &&
      MediaQuery.of(context).size.width < desktopWidth;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktopWidth;

  static ResponsiveSize responsiveSize(BuildContext context) {
    if (isMobile(context)) {
      return ResponsiveSize.mobile;
    } else if (isTablet(context)) {
      return ResponsiveSize.tablet;
    } else {
      return ResponsiveSize.desktop;
    }
  }
}
