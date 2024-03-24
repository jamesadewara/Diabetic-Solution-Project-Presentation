import 'package:flutter/material.dart';
import '../assets/index.dart';

class CustomBottomNavigationBarThemeData {
  BottomNavigationBarThemeData build({required ThemeDeserializer theme}) {
    return BottomNavigationBarThemeData(
      // backgroundColor:
      //     Color.fromARGB(255, 4, 12, 24), // Midnight background color
      elevation: theme.sm.toDouble(),
      // selectedIconTheme:
      //     IconThemeData(color: Colors.blue), // Selected icon color
      // unselectedIconTheme:
      //     IconThemeData(color: Colors.grey), // Unselected icon color
      // selectedItemColor: Colors.blue, // Selected item color
      // unselectedItemColor: Colors.grey, // Unselected item color
      // selectedLabelStyle: TextStyle(
      //   fontSize: 14.0,
      //   fontWeight: FontWeight.bold,
      //   color: Colors.white, // Selected label text color
      // ),
      // unselectedLabelStyle: TextStyle(
      //   fontSize: 14.0,
      //   fontWeight: FontWeight.normal,
      //   color: Colors.grey, // Unselected label text color
      // ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType
          .fixed, // Use 'fixed' for a consistent number of items
      mouseCursor: MaterialStateProperty.resolveWith<MouseCursor?>(
        (Set<MaterialState> states) {
          // Provide custom mouse cursor behavior if needed
          return MaterialStateMouseCursor.clickable;
        },
      ),
    );
  }
}
