import 'package:flutter/material.dart';
import '../assets/index.dart';

class CustomIconThemeData {
  IconThemeData build({required ThemeDeserializer theme}) {
    return const IconThemeData(
      size: 24.0, // Icon size
      grade: 1,
      opacity: 1.0, // Icon opacity
      shadows: [
        Shadow(
          // color: Colors.black,
          offset: Offset(1, 1),
          blurRadius: 2.0,
        ),
      ], // List of shadows
    );
  }
}
