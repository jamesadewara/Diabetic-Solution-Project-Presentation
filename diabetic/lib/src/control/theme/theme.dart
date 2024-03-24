import 'package:diabetic/src/control/theme/assets/index.dart';
import 'package:diabetic/src/control/theme/provider.dart';
import 'package:flutter/material.dart';

class CustomThemes {
  ThemeDeserializer name;

  CustomThemes({required this.name});

  ThemeData currentTheme() {
    return ThemeProvider.getTheme(name);
  }
}
