// import 'package:flutter/cupertino.dart';
import 'package:diabetic/src/control/theme/index.dart';
import 'package:flutter/material.dart';
import 'assets/index.dart';

class ThemeProvider {
  static ThemeData getTheme(ThemeDeserializer theme) {
    return customThemeData(theme.brightness).copyWith(
      // // brightness: theme.brightness ? Brightness.light : Brightness.dark,
      primaryColor: theme.primary,
      // primaryColorLight: theme.primary,
      // primaryColorDark: theme.primary,
      scaffoldBackgroundColor: theme.background,
      // // canvasColor: theme.surface,
      cardColor: theme.surface,
      // // dialogBackgroundColor: theme.accent,
      // // disabledColor: theme.disabled,
      // // dividerColor: theme.outlineVariant,
      // // focusColor: theme.onPrimary,
      // // highlightColor: theme.primary,
      // // hintColor: theme.outlineVariant,
      // // hoverColor: theme.accent,
      // // indicatorColor: theme.primary,
      // // primaryColorDark: theme.onPrimary,
      // // primaryColorLight: theme.primary,
      // // secondaryHeaderColor: theme.secondary,
      // // shadowColor: theme.shadow,
      // // splashColor: theme.background,
      // // unselectedWidgetColor: theme.disabled,
      // // colorScheme: CustomColorSchemeTheme().build(theme: theme),
      // // applyElevationOverlayColor: true,
      // chipTheme: CustomChipTheme().build(theme: theme),
      inputDecorationTheme: CustomInputDecorationTheme().build(theme: theme),
      // // cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(),
      // // extensions: const <ThemeExtension<dynamic>>[],
      // // inputDecorationTheme: const InputDecorationTheme(),
      // // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      // // pageTransitionsTheme: const PageTransitionsTheme(),
      // // platform: TargetPlatform.android,
      scrollbarTheme: CustomScrollBarTheme().build(theme: theme),
      // // splashFactory: InkSplash.splashFactory,
      // // visualDensity: VisualDensity(horizontal: 8, vertical: 8),
      // // actionIconTheme: const ActionIconThemeData(),
      appBarTheme: CustomAppBarTheme().build(theme: theme),
      // bottomNavigationBarTheme:
      //     CustomBottomNavigationBarThemeData().build(theme: theme),
      // bottomSheetTheme: const BottomSheetThemeData(),
      // buttonBarTheme: const ButtonBarThemeData(),
      // iconTheme: CustomIconThemeData().build(theme: theme),
      // // primaryIconTheme: const IconThemeData(color: Colors.blue),
      // primaryTextTheme: CustomTextTheme().get(theme: theme),
      // textTheme: CustomTextTheme().get(theme: theme),
      // typography: Typography.material2021(),
      // // tabBarTheme: const TabBarTheme(),
      // // textButtonTheme: const TextButtonThemeData(),
      // // textSelectionTheme: const TextSelectionThemeData(),
      // // timePickerTheme: const TimePickerThemeData(),
      // // toggleButtonsTheme: const ToggleButtonsThemeData(),
      // // tooltipTheme: const TooltipThemeData(),
      // // snackBarTheme: const SnackBarThemeData(),
      // // switchTheme: const SwitchThemeData(),
      // // menuTheme: const MenuThemeData(),
      // // navigationBarTheme: const NavigationBarThemeData(),
      // // navigationDrawerTheme: const NavigationDrawerThemeData(),
      // // navigationRailTheme: CustomNavigationRailThemeData().build(theme: theme),
      // // outlinedButtonTheme: const OutlinedButtonThemeData(),
      // // popupMenuTheme: const PopupMenuThemeData(),

      progressIndicatorTheme: const ProgressIndicatorThemeData(),
      // // radioTheme: const RadioThemeData(),
      // // searchBarTheme: const SearchBarThemeData(),
      // // searchViewTheme: const SearchViewThemeData(),
      // // segmentedButtonTheme: const SegmentedButtonThemeData(),
      // // sliderTheme: const SliderThemeData(),
      // dialogTheme: CustomDialogTheme().build(theme: theme),
      // // dividerTheme: const DividerThemeData(),
      // // bottomAppBarTheme: const BottomAppBarTheme(color: Colors.blue),
      // // drawerTheme: const DrawerThemeData(),
      // // dropdownMenuTheme: const DropdownMenuThemeData(),

      // // elevatedButtonTheme: const ElevatedButtonThemeData(),
      // // expansionTileTheme: const ExpansionTileThemeData(),
      // // filledButtonTheme: const FilledButtonThemeData(),
      // // floatingActionButtonTheme: const FloatingActionButtonThemeData(),
      // // iconButtonTheme: const IconButtonThemeData(),
      listTileTheme: CustomListTileThemeData().build(theme: theme),
      // // menuBarTheme: const MenuBarThemeData(),
      // // menuButtonTheme: const MenuButtonThemeData(),
      // // badgeTheme: const BadgeThemeData(),
      // // bannerTheme: const MaterialBannerThemeData(),
      filledButtonTheme: CustomFilledButtonThemeData().build(theme: theme),
      elevatedButtonTheme: CustomElevatedButtonThemeData().build(theme: theme),
      cardTheme: CustomCardTheme().build(theme: theme),
      // // checkboxTheme: const CheckboxThemeData(),
      // // chipTheme: const ChipThemeData(),
      // // dataTableTheme: const DataTableThemeData(),
      // // datePickerTheme: const DatePickerThemeData(),
    );
  }

  static ThemeData customThemeData(bool mode) {
    if (mode == true) {
      return ThemeData.light();
    } else {
      return ThemeData.dark();
    }
  }
}
