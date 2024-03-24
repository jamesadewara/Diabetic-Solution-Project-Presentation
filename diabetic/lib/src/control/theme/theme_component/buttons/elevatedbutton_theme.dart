import 'package:flutter/material.dart';
import '../../assets/index.dart';

class CustomElevatedButtonThemeData {
  ElevatedButtonThemeData build({required ThemeDeserializer theme}) {
    return ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            elevation: theme.elevation,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(theme.radius))));
  }
}
