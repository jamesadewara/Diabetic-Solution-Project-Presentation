import 'package:flutter/material.dart';
import '../../assets/index.dart';

class CustomFilledButtonThemeData {
  FilledButtonThemeData build({required ThemeDeserializer theme}) {
    return FilledButtonThemeData(
        style: ButtonStyle(
            elevation: MaterialStatePropertyAll(theme.elevation),
            shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(theme.radius.toDouble()))))));
  }
}
