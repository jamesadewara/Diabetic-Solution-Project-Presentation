import 'package:diabetic/src/control/theme/assets/index.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeDeserializer {
  ThemeDeserializer({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.tertiary,
    required this.onTertiary,
    required this.surface,
    required this.outline,
    required this.outlineVariant,
    required this.background,
    required this.accent,
    required this.shadow,
    required this.disabled,
    required this.information,
    required this.error,
    required this.success,
    required this.radius,
    required this.elevation,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.smMd,
    required this.smLg,
    required this.smXl,
    required this.brightness,
    required this.material,
    required this.fontFamily,
    required this.fontFamilyFallback,
    required this.display,
    required this.headline,
    required this.title,
    required this.body,
    required this.label,
  });

  final HexColor primary;
  final HexColor onPrimary;
  final HexColor secondary;
  final HexColor onSecondary;
  final HexColor tertiary;
  final HexColor onTertiary;
  final HexColor surface;

  final HexColor outline;
  final HexColor outlineVariant;
  final HexColor background;
  final HexColor accent;
  final HexColor shadow;
  final HexColor disabled;
  final HexColor information;
  final HexColor error;
  final HexColor success;
  final double radius;
  final double elevation;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double smMd;
  final double smLg;
  final double smXl;
  final bool brightness;
  final bool material;
  final String fontFamily;
  final List<String> fontFamilyFallback;
  final String display;
  final String headline;
  final String title;
  final String body;
  final String label;
}

class ThemeIdentifier {
  static ThemeDeserializer daylight = daylightThemeObject;
  static ThemeDeserializer nightfall = nightfallThemeObject;
}
