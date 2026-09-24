import 'package:flutter/material.dart';

/// Shared app-wide layout breakpoints (mobile / tablet / desktop).
enum AppBreakpointSize { mobile, tablet, desktop }

/// Width-derived layout flags and padding for all screens.
@immutable
class AppBreakpoints {
  const AppBreakpoints._(this.size, this.maxWidth);

  final AppBreakpointSize size;
  final double maxWidth;

  bool get isMobile => size == AppBreakpointSize.mobile;
  bool get isTablet => size == AppBreakpointSize.tablet;
  bool get isDesktop => size == AppBreakpointSize.desktop;

  /// Max content width for centered panels.
  static const double maxContentWidth = 1280;

  static const double tabletMin = 600;
  static const double desktopMin = 1100;

  factory AppBreakpoints.fromWidth(double width) {
    final AppBreakpointSize s;
    if (width >= desktopMin) {
      s = AppBreakpointSize.desktop;
    } else if (width >= tabletMin) {
      s = AppBreakpointSize.tablet;
    } else {
      s = AppBreakpointSize.mobile;
    }
    return AppBreakpoints._(s, width);
  }

  factory AppBreakpoints.of(BuildContext context) {
    return AppBreakpoints.fromWidth(MediaQuery.sizeOf(context).width);
  }

  double get paddingH => isMobile ? 16 : 24;
  double get paddingV => isMobile ? 16 : 24;

  EdgeInsets get padding =>
      EdgeInsets.fromLTRB(paddingH, paddingV, paddingH, paddingV);

  /// KPI / tile grid columns.
  int gridColumns({int mobile = 1, int tablet = 2, int desktop = 3}) {
    if (isDesktop) return desktop;
    if (isTablet) return tablet;
    return mobile;
  }

  int kpiCrossAxisCount({int mobile = 2, int tablet = 3, int desktop = 4}) {
    return gridColumns(mobile: mobile, tablet: tablet, desktop: desktop);
  }

  double get kpiSpacing => isMobile ? 8 : 10;

  /// Minimum width for horizontally scrollable tables.
  double get tableMinWidth {
    if (isMobile) return 720;
    if (isTablet) return 960;
    return 1100;
  }

  double dialogWidth(BuildContext context, {double max = 560}) {
    final screenW = MediaQuery.sizeOf(context).width;
    return max.clamp(0, screenW - 32).toDouble();
  }

  bool get stackPanels => isMobile;

  bool get showSidebar => isDesktop;
}
