import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_design_tokens.dart';
import 'imsh_theme_extension.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme =>
      _buildTheme(AppDesignTokens.lightColorScheme);

  static ThemeData get darkTheme =>
      _buildTheme(AppDesignTokens.darkColorScheme);

  static ThemeData _buildTheme(ColorScheme colorScheme) {
    final brightness = colorScheme.brightness;
    final imshExtension = ImshThemeExtension.forBrightness(brightness);

    final baseTextTheme = GoogleFonts.interTextTheme(
      ThemeData(brightness: brightness).textTheme,
    );

    final textTheme = baseTextTheme.copyWith(
      displayLarge: baseTextTheme.displayLarge?.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        height: 36 / 28,
        letterSpacing: -0.02 * 28,
      ),
      displayMedium: baseTextTheme.displayMedium?.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 32 / 24,
      ),
      displaySmall: baseTextTheme.displaySmall?.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        height: 28 / 22,
      ),
      headlineLarge: baseTextTheme.headlineLarge?.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        height: 28 / 22,
      ),
      headlineMedium: baseTextTheme.headlineMedium?.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 26 / 20,
        letterSpacing: -0.01 * 20,
      ),
      headlineSmall: baseTextTheme.headlineSmall?.copyWith(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        height: 24 / 17,
      ),
      titleLarge: baseTextTheme.titleLarge?.copyWith(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        height: 24 / 17,
      ),
      titleMedium: baseTextTheme.titleMedium?.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        height: 22 / 15,
      ),
      titleSmall: baseTextTheme.titleSmall?.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        height: 18 / 13,
      ),
      bodyLarge: baseTextTheme.bodyLarge?.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        height: 22 / 15,
      ),
      bodyMedium: baseTextTheme.bodyMedium?.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 20 / 14,
      ),
      bodySmall: baseTextTheme.bodySmall?.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 16 / 12,
      ),
      labelLarge: baseTextTheme.labelLarge?.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 16 / 12,
        letterSpacing: 0.01 * 12,
      ),
      labelMedium: baseTextTheme.labelMedium?.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        height: 14 / 11,
      ),
      labelSmall: baseTextTheme.labelSmall?.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        height: 14 / 10,
      ),
    ).apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    );

    final inputBorderRadius = BorderRadius.circular(AppDesignTokens.radiusSm);
    final cardShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
      side: BorderSide(color: colorScheme.outlineVariant),
    );

    return ThemeData(
      colorScheme: colorScheme,
      textTheme: textTheme,
      useMaterial3: true,
      scaffoldBackgroundColor: colorScheme.surface,
      extensions: [imshExtension],
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surfaceContainerHighest,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: textTheme.titleMedium?.copyWith(
          color: colorScheme.onSurface,
        ),
        toolbarHeight: 52,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          elevation: 2,
          shadowColor: colorScheme.primary.withValues(alpha: 0.25),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDesignTokens.spacingLg,
            vertical: 12,
          ),
          textStyle: textTheme.labelLarge,
          shape: RoundedRectangleBorder(
            borderRadius: inputBorderRadius,
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          elevation: 2,
          shadowColor: colorScheme.primary.withValues(alpha: 0.25),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDesignTokens.spacingLg,
            vertical: 12,
          ),
          textStyle: textTheme.labelLarge,
          shape: RoundedRectangleBorder(
            borderRadius: inputBorderRadius,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: colorScheme.outlineVariant),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDesignTokens.spacingLg,
            vertical: 12,
          ),
          textStyle: textTheme.labelLarge,
          shape: RoundedRectangleBorder(
            borderRadius: inputBorderRadius,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
        elevation: 2,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerLowest,
        hintStyle: TextStyle(
          color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
        ),
        border: OutlineInputBorder(
          borderRadius: inputBorderRadius,
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: inputBorderRadius,
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: inputBorderRadius,
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: inputBorderRadius,
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: inputBorderRadius,
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
      ),
      cardTheme: CardThemeData(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        color: colorScheme.surfaceContainerLowest,
        shadowColor: brightness == Brightness.light
            ? const Color(0x0D000000)
            : const Color(0x33000000),
        shape: cardShape,
      ),
      listTileTheme: ListTileThemeData(
        iconColor: colorScheme.primary,
        textColor: colorScheme.onSurface,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.surfaceContainerLow,
        selectedColor: colorScheme.primaryContainer.withValues(alpha: 0.25),
        labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
        secondaryLabelStyle: TextStyle(color: colorScheme.primary),
        side: BorderSide(color: colorScheme.outlineVariant),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDesignTokens.radiusSm),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        thickness: 1,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.inverseSurface,
        contentTextStyle: TextStyle(color: colorScheme.onInverseSurface),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDesignTokens.radiusSm),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: colorScheme.surfaceContainerHigh,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surfaceContainerHigh,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppDesignTokens.radiusLg),
          ),
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: colorScheme.surfaceContainerHigh,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDesignTokens.radiusSm),
        ),
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: colorScheme.primary,
        unselectedLabelColor: colorScheme.onSurfaceVariant,
        indicatorColor: colorScheme.primary,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surfaceContainerHighest,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurfaceVariant,
        type: BottomNavigationBarType.fixed,
        elevation: 2,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorScheme.surfaceContainerHighest,
        height: 64,
        indicatorColor: colorScheme.primaryContainer.withValues(alpha: 0.2),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(
              color: colorScheme.primary,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            );
          }
          return TextStyle(
            color: colorScheme.onSurfaceVariant,
            fontSize: 11,
          );
        }),
      ),
    );
  }

  /// headline-lg-mobile: compact hero title for login and splash.
  static TextStyle headlineLgMobile(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      height: 28 / 22,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
