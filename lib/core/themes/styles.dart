import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData get appTheme => ThemeData(
    useMaterial3: false,
    colorScheme: ColorScheme.fromSeed(
      seedColor: kBackgroundColor,
      primary: kBackgroundColor,
      secondary: kSecondaryColor,
      brightness: Brightness.light,
      onPrimary: Colors.white,
    ),
    scaffoldBackgroundColor: kBackgroundColor,
    cardColor: Colors.white,
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 1,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    dividerColor: Colors.black26,
    disabledColor: Colors.grey.shade700,
    hintColor: Colors.grey.shade500,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
      ),
    ),
    appBarTheme: const AppBarTheme(
      // centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black87),
      actionsIconTheme: IconThemeData(color: Colors.black87),
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: 'Glory',
        color: Colors.white,
        letterSpacing: 3,
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      elevation: 0.0,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontFamily: 'Glory',
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Glory',
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Glory',
        color: Color(0xFF363636),
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    ));
