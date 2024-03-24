import 'package:flutter/material.dart';
import '../assets/index.dart';

class CustomScrollBarTheme {
  ScrollbarThemeData build({required ThemeDeserializer theme}) {
    return ScrollbarThemeData(
      thumbColor: MaterialStateProperty.all<Color>(theme.surface),
      trackColor: MaterialStateProperty.all<Color>(theme.accent),
      trackBorderColor: MaterialStateProperty.all<Color>(Colors.transparent),
      thumbVisibility: MaterialStateProperty.resolveWith<bool?>(
        (Set<MaterialState> states) {
          // Customize the thumb visibility based on different states
          if (states.contains(MaterialState.hovered)) {
            return true; // Visible when hovered
          }
          return false; // Otherwise, not visible
        },
      ),
      thickness: MaterialStateProperty.resolveWith<double?>(
        (Set<MaterialState> states) {
          // Customize the thickness based on different states
          if (states.contains(MaterialState.hovered)) {
            return theme.md.toDouble(); // Thick when hovered
          }
          return theme.sm.toDouble(); // Otherwise, default thickness
        },
      ),
      trackVisibility: MaterialStateProperty.resolveWith<bool?>(
        (Set<MaterialState> states) {
          // Customize the track visibility based on different states
          if (states.contains(MaterialState.hovered)) {
            return true; // Visible when hovered
          }
          return false; // Otherwise, not visible
        },
      ),
      radius: Radius.circular(theme.radius.toDouble()),
      // crossAxisMargin: theme.sm.toDouble(),
      // mainAxisMargin: theme.sm.toDouble(),
      // minThumbLength: theme.lg.toDouble(),
      interactive: true,
    );
  }
}
