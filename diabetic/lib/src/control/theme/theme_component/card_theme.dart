import 'package:flutter/material.dart';
import '../assets/index.dart';

class CustomCardTheme {
  CardTheme build({required ThemeDeserializer theme}) {
    return CardTheme(
      elevation: theme.elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(theme.radius),
      ),
    );
  }
}
