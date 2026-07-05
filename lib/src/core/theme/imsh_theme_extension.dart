import 'package:flutter/material.dart';

import 'app_design_tokens.dart';

/// Semantic colors beyond [ColorScheme] for status badges and highlights.
@immutable
class ImshThemeExtension extends ThemeExtension<ImshThemeExtension> {
  const ImshThemeExtension({
    required this.successContainer,
    required this.onSuccessContainer,
    required this.warningContainer,
    required this.onWarningContainer,
    required this.infoContainer,
    required this.onInfoContainer,
    required this.primaryHighlight,
  });

  final Color successContainer;
  final Color onSuccessContainer;
  final Color warningContainer;
  final Color onWarningContainer;
  final Color infoContainer;
  final Color onInfoContainer;
  final Color primaryHighlight;

  static ImshThemeExtension light = const ImshThemeExtension(
    successContainer: AppDesignTokens.successContainer,
    onSuccessContainer: AppDesignTokens.onSuccessContainer,
    warningContainer: AppDesignTokens.warningContainer,
    onWarningContainer: AppDesignTokens.onWarningContainer,
    infoContainer: AppDesignTokens.infoContainer,
    onInfoContainer: AppDesignTokens.onInfoContainer,
    primaryHighlight: AppDesignTokens.primaryFixed,
  );

  static ImshThemeExtension dark = const ImshThemeExtension(
    successContainer: AppDesignTokens.darkSuccessContainer,
    onSuccessContainer: AppDesignTokens.darkOnSuccessContainer,
    warningContainer: AppDesignTokens.darkWarningContainer,
    onWarningContainer: AppDesignTokens.darkOnWarningContainer,
    infoContainer: AppDesignTokens.darkInfoContainer,
    onInfoContainer: AppDesignTokens.darkOnInfoContainer,
    primaryHighlight: AppDesignTokens.darkInfoContainer,
  );

  static ImshThemeExtension forBrightness(Brightness brightness) =>
      brightness == Brightness.dark ? dark : light;

  @override
  ImshThemeExtension copyWith({
    Color? successContainer,
    Color? onSuccessContainer,
    Color? warningContainer,
    Color? onWarningContainer,
    Color? infoContainer,
    Color? onInfoContainer,
    Color? primaryHighlight,
  }) {
    return ImshThemeExtension(
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
      infoContainer: infoContainer ?? this.infoContainer,
      onInfoContainer: onInfoContainer ?? this.onInfoContainer,
      primaryHighlight: primaryHighlight ?? this.primaryHighlight,
    );
  }

  @override
  ImshThemeExtension lerp(ImshThemeExtension? other, double t) {
    if (other is! ImshThemeExtension) return this;
    return ImshThemeExtension(
      successContainer:
          Color.lerp(successContainer, other.successContainer, t)!,
      onSuccessContainer:
          Color.lerp(onSuccessContainer, other.onSuccessContainer, t)!,
      warningContainer:
          Color.lerp(warningContainer, other.warningContainer, t)!,
      onWarningContainer:
          Color.lerp(onWarningContainer, other.onWarningContainer, t)!,
      infoContainer: Color.lerp(infoContainer, other.infoContainer, t)!,
      onInfoContainer:
          Color.lerp(onInfoContainer, other.onInfoContainer, t)!,
      primaryHighlight:
          Color.lerp(primaryHighlight, other.primaryHighlight, t)!,
    );
  }
}

extension ImshThemeExtensionGetter on ThemeData {
  ImshThemeExtension get imsh => extension<ImshThemeExtension>()!;
}
