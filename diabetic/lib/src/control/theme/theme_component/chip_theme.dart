import 'package:flutter/material.dart';
import '../assets/index.dart';

class CustomChipTheme {
  ChipThemeData build({required ThemeDeserializer theme}) {
    return ChipThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(theme.radius)));
  }
}
