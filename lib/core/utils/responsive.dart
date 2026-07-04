import 'package:flutter/material.dart';

/// Breakpoints and helpers for responsive layout across
/// mobile / tablet / web-desktop.
class Responsive {
  Responsive._();

  static const double mobileMax = 640;
  static const double tabletMax = 1024;

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < mobileMax;

  static bool isTablet(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return w >= mobileMax && w < tabletMax;
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= tabletMax;

  /// Horizontal page padding that grows with screen size.
  static double pagePadding(BuildContext context) {
    if (isMobile(context)) return 20;
    if (isTablet(context)) return 40;
    return 80;
  }

  /// Number of grid columns for card grids (projects, services, skills).
  static int gridColumns(BuildContext context, {int desktop = 3, int tablet = 2, int mobile = 1}) {
    if (isDesktop(context)) return desktop;
    if (isTablet(context)) return tablet;
    return mobile;
  }

  /// Clamp content to a max width and center it on very wide screens.
  static double contentMaxWidth(BuildContext context) => 1200;
}

/// A convenience wrapper that centers its child and caps its width,
/// used at the top of every screen body.
class ResponsiveCenter extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const ResponsiveCenter({super.key, required this.child, this.maxWidth = 1200});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
