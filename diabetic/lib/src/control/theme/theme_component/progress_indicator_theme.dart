import 'package:flutter/material.dart';
import '../assets/index.dart';

class CustomProgressIndicatorThemeData {
  ProgressIndicatorThemeData build({required ThemeDeserializer theme}) {
    return ProgressIndicatorThemeData(color: theme.primary);
  }
}
