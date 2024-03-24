import 'package:flutter/material.dart';
import '../assets/index.dart';

class CustomColorSchemeTheme {
  ColorScheme build({required ThemeDeserializer theme}) {
    return ColorScheme.fromSeed(
      seedColor: theme.primary,
      // primarySwatch: MaterialColor(theme.primary.value, <int, Color>{
      //   50: theme.primary.withOpacity(0.1),
      //   100: theme.primary.withOpacity(0.2),
      //   200: theme.primary.withOpacity(0.3),
      //   300: theme.primary.withOpacity(0.4),
      //   400: theme.primary.withOpacity(0.5),
      //   500: theme.primary.withOpacity(0.6),
      //   600: theme.primary.withOpacity(0.7),
      //   700: theme.primary.withOpacity(0.8),
      //   800: theme.primary.withOpacity(0.9),
      //   900: theme.primary.withOpacity(1.0),
      // }),
      // accentColor: theme.accent,
      // cardColor: theme.surface,

      // errorColor: theme.error);
      // seedColor: theme.background,
      outline: theme.outline,
      outlineVariant: theme.outlineVariant,
      secondary: theme.secondary,
      background: theme.background,
      error: theme.error,
      tertiary: theme.tertiary,
      onTertiary: theme.onTertiary,
      errorContainer: theme.error,
      surface: theme.surface,
      shadow: theme.shadow,
      scrim: theme.information.withOpacity(0.5),
    );
  }
}
