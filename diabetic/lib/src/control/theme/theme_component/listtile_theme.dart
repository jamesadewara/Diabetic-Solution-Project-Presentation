import 'package:flutter/material.dart';
import '../assets/index.dart';

class CustomListTileThemeData {
  ListTileThemeData build({required ThemeDeserializer theme}) {
    return ListTileThemeData(
      dense: false,
      // tileColor: theme.surface,
      // textColor: theme.outline,
      // iconColor: theme.outlineVariant,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(theme.radius.toDouble()),
      ),
      // style: ListTileStyle.list,
      // contentPadding: EdgeInsets.all(theme.sm.toDouble()),
      // horizontalTitleGap: theme.md.toDouble(),
      // minVerticalPadding: theme.sm.toDouble(),
      // minLeadingWidth: theme.lg.toDouble(),
      enableFeedback: true,
      mouseCursor: MaterialStateMouseCursor.clickable,
      // visualDensity: VisualDensity.standard,
      // titleAlignment: ListTileTitleAlignment.top,
    );
  }
}
