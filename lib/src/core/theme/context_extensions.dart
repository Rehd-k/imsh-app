import 'package:flutter/material.dart';

import 'app_design_tokens.dart';
import 'imsh_theme_extension.dart';

extension ImshBuildContextTheme on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  ImshThemeExtension get imshTheme => theme.imsh;

  List<BoxShadow> get cardShadow =>
      AppDesignTokens.cardShadow(theme.brightness);

  List<BoxShadow> get buttonShadow =>
      AppDesignTokens.buttonShadow(theme.brightness);
}
