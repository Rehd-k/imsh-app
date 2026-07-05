import 'package:flutter/material.dart';

/// Clinical Excellence design tokens from [MDs/login.md].
abstract final class AppDesignTokens {
  // Light palette
  static const surface = Color(0xFFF7F9FB);
  static const surfaceDim = Color(0xFFD8DADC);
  static const surfaceBright = Color(0xFFF7F9FB);
  static const surfaceContainerLowest = Color(0xFFFFFFFF);
  static const surfaceContainerLow = Color(0xFFF2F4F6);
  static const surfaceContainer = Color(0xFFECEEF0);
  static const surfaceContainerHigh = Color(0xFFE6E8EA);
  static const surfaceContainerHighest = Color(0xFFE0E3E5);
  static const onSurface = Color(0xFF191C1E);
  static const onSurfaceVariant = Color(0xFF424752);
  static const inverseSurface = Color(0xFF2D3133);
  static const inverseOnSurface = Color(0xFFEFF1F3);
  static const outline = Color(0xFF727783);
  static const outlineVariant = Color(0xFFC2C6D4);
  static const surfaceTint = Color(0xFF005DB6);
  static const primary = Color(0xFF00478D);
  static const onPrimary = Color(0xFFFFFFFF);
  static const primaryContainer = Color(0xFF005EB8);
  static const onPrimaryContainer = Color(0xFFC8DAFF);
  static const inversePrimary = Color(0xFFA9C7FF);
  static const secondary = Color(0xFF455C99);
  static const onSecondary = Color(0xFFFFFFFF);
  static const secondaryContainer = Color(0xFFA6BCFF);
  static const onSecondaryContainer = Color(0xFF334A86);
  static const tertiary = Color(0xFF004E61);
  static const onTertiary = Color(0xFFFFFFFF);
  static const tertiaryContainer = Color(0xFF006880);
  static const onTertiaryContainer = Color(0xFF9BE4FF);
  static const error = Color(0xFFBA1A1A);
  static const onError = Color(0xFFFFFFFF);
  static const errorContainer = Color(0xFFFFDAD6);
  static const onErrorContainer = Color(0xFF93000A);
  static const background = Color(0xFFF7F9FB);
  static const onBackground = Color(0xFF191C1E);
  static const surfaceVariant = Color(0xFFE0E3E5);

  // Fixed roles (login.md)
  static const primaryFixed = Color(0xFFD6E3FF);
  static const primaryFixedDim = Color(0xFFA9C7FF);
  static const onPrimaryFixed = Color(0xFF001B3D);
  static const onPrimaryFixedVariant = Color(0xFF00468C);
  static const secondaryFixed = Color(0xFFDAE2FF);
  static const onSecondaryFixed = Color(0xFF001849);
  static const tertiaryFixed = Color(0xFFB6EBFF);
  static const onTertiaryFixed = Color(0xFF001F28);

  // Dark palette
  static const darkSurface = Color(0xFF191C1E);
  static const darkSurfaceDim = Color(0xFF111416);
  static const darkSurfaceBright = Color(0xFF3F484B);
  static const darkSurfaceContainerLowest = Color(0xFF0E1012);
  static const darkSurfaceContainerLow = Color(0xFF1A1C1E);
  static const darkSurfaceContainer = Color(0xFF1E2022);
  static const darkSurfaceContainerHigh = Color(0xFF282A2C);
  static const darkSurfaceContainerHighest = Color(0xFF333537);
  static const darkOnSurface = Color(0xFFE1E3E5);
  static const darkOnSurfaceVariant = Color(0xFFC2C6D4);
  static const darkOutline = Color(0xFF8C919F);
  static const darkOutlineVariant = Color(0xFF424752);
  static const darkPrimary = Color(0xFFA9C7FF);
  static const darkOnPrimary = Color(0xFF003062);
  static const darkPrimaryContainer = Color(0xFF00468C);
  static const darkOnPrimaryContainer = Color(0xFFD6E3FF);
  static const darkSecondary = Color(0xFFB2C5FF);
  static const darkOnSecondary = Color(0xFF1A3366);
  static const darkSecondaryContainer = Color(0xFF334A86);
  static const darkOnSecondaryContainer = Color(0xFFDAE2FF);
  static const darkTertiary = Color(0xFF57D5FC);
  static const darkOnTertiary = Color(0xFF003543);
  static const darkTertiaryContainer = Color(0xFF004E60);
  static const darkOnTertiaryContainer = Color(0xFFB6EBFF);
  static const darkErrorContainer = Color(0xFF93000A);
  static const darkOnErrorContainer = Color(0xFFFFDAD6);

  // Semantic status (light)
  static const successContainer = Color(0xFFD1FAE5);
  static const onSuccessContainer = Color(0xFF065F46);
  static const warningContainer = Color(0xFFFEF3C7);
  static const onWarningContainer = Color(0xFF92400E);
  static const infoContainer = Color(0xFFD6E3FF);
  static const onInfoContainer = Color(0xFF00478D);

  // Semantic status (dark)
  static const darkSuccessContainer = Color(0xFF1B3D32);
  static const darkOnSuccessContainer = Color(0xFF6EE7B7);
  static const darkWarningContainer = Color(0xFF3D3018);
  static const darkOnWarningContainer = Color(0xFFFCD34D);
  static const darkInfoContainer = Color(0xFF1A3050);
  static const darkOnInfoContainer = Color(0xFFA9C7FF);

  // Spacing
  static const double spacingXs = 4;
  static const double spacingSm = 8;
  static const double spacingMd = 16;
  static const double spacingLg = 24;
  static const double spacingXl = 32;
  static const double spacing2xl = 48;
  static const double containerPadding = 16;
  static const double gutter = 16;

  // Border radius
  static const double radiusSm = 8;
  static const double radiusMd = 12;
  static const double radiusLg = 16;
  static const double radiusXl = 24;

  static List<BoxShadow> cardShadow(Brightness brightness) => [
        BoxShadow(
          color: brightness == Brightness.light
              ? const Color(0x0D000000)
              : const Color(0x33000000),
          offset: const Offset(0, 4),
          blurRadius: 20,
        ),
      ];

  static List<BoxShadow> buttonShadow(Brightness brightness) => [
        BoxShadow(
          color: brightness == Brightness.light
              ? const Color(0x1A00478D)
              : const Color(0x40000000),
          offset: const Offset(0, 2),
          blurRadius: 8,
        ),
      ];

  /// Login-only subtle gradient background.
  static LinearGradient loginBackgroundGradient(ColorScheme scheme) {
    if (scheme.brightness == Brightness.light) {
      return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          scheme.primaryContainer.withValues(alpha: 0.15),
          scheme.surface,
          scheme.surfaceContainerLowest,
        ],
      );
    }
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        scheme.primaryContainer.withValues(alpha: 0.35),
        scheme.surface,
        scheme.surfaceContainerLow,
      ],
    );
  }

  static ColorScheme get lightColorScheme => const ColorScheme(
        brightness: Brightness.light,
        primary: primary,
        onPrimary: onPrimary,
        primaryContainer: primaryContainer,
        onPrimaryContainer: onPrimaryContainer,
        primaryFixed: primaryFixed,
        primaryFixedDim: primaryFixedDim,
        onPrimaryFixed: onPrimaryFixed,
        onPrimaryFixedVariant: onPrimaryFixedVariant,
        secondary: secondary,
        onSecondary: onSecondary,
        secondaryContainer: secondaryContainer,
        onSecondaryContainer: onSecondaryContainer,
        secondaryFixed: secondaryFixed,
        onSecondaryFixed: onSecondaryFixed,
        tertiary: tertiary,
        onTertiary: onTertiary,
        tertiaryContainer: tertiaryContainer,
        onTertiaryContainer: onTertiaryContainer,
        tertiaryFixed: tertiaryFixed,
        onTertiaryFixed: onTertiaryFixed,
        error: error,
        onError: onError,
        errorContainer: errorContainer,
        onErrorContainer: onErrorContainer,
        surface: surface,
        onSurface: onSurface,
        surfaceDim: surfaceDim,
        surfaceBright: surfaceBright,
        surfaceContainerLowest: surfaceContainerLowest,
        surfaceContainerLow: surfaceContainerLow,
        surfaceContainer: surfaceContainer,
        surfaceContainerHigh: surfaceContainerHigh,
        surfaceContainerHighest: surfaceContainerHighest,
        onSurfaceVariant: onSurfaceVariant,
        outline: outline,
        outlineVariant: outlineVariant,
        shadow: Color(0xFF000000),
        scrim: Color(0xFF000000),
        inverseSurface: inverseSurface,
        onInverseSurface: inverseOnSurface,
        inversePrimary: inversePrimary,
        surfaceTint: surfaceTint,
      );

  static ColorScheme get darkColorScheme => const ColorScheme(
        brightness: Brightness.dark,
        primary: darkPrimary,
        onPrimary: darkOnPrimary,
        primaryContainer: darkPrimaryContainer,
        onPrimaryContainer: darkOnPrimaryContainer,
        primaryFixed: primaryFixed,
        primaryFixedDim: primaryFixedDim,
        onPrimaryFixed: onPrimaryFixed,
        onPrimaryFixedVariant: onPrimaryFixedVariant,
        secondary: darkSecondary,
        onSecondary: darkOnSecondary,
        secondaryContainer: darkSecondaryContainer,
        onSecondaryContainer: darkOnSecondaryContainer,
        secondaryFixed: secondaryFixed,
        onSecondaryFixed: onSecondaryFixed,
        tertiary: darkTertiary,
        onTertiary: darkOnTertiary,
        tertiaryContainer: darkTertiaryContainer,
        onTertiaryContainer: darkOnTertiaryContainer,
        tertiaryFixed: tertiaryFixed,
        onTertiaryFixed: onTertiaryFixed,
        error: error,
        onError: onError,
        errorContainer: darkErrorContainer,
        onErrorContainer: darkOnErrorContainer,
        surface: darkSurface,
        onSurface: darkOnSurface,
        surfaceDim: darkSurfaceDim,
        surfaceBright: darkSurfaceBright,
        surfaceContainerLowest: darkSurfaceContainerLowest,
        surfaceContainerLow: darkSurfaceContainerLow,
        surfaceContainer: darkSurfaceContainer,
        surfaceContainerHigh: darkSurfaceContainerHigh,
        surfaceContainerHighest: darkSurfaceContainerHighest,
        onSurfaceVariant: darkOnSurfaceVariant,
        outline: darkOutline,
        outlineVariant: darkOutlineVariant,
        shadow: Color(0xFF000000),
        scrim: Color(0xFF000000),
        inverseSurface: surface,
        onInverseSurface: onSurface,
        inversePrimary: primary,
        surfaceTint: surfaceTint,
      );
}
