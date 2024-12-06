import 'package:flutter/material.dart';

const TextTheme textTheme = TextTheme(
  // Display Styles
  displayLarge: TextStyle(
    fontSize: 57,
    fontWeight: FontWeight.w400, // Regular
    letterSpacing: 0.0,
  ),
  displayMedium: TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.w400, // Regular
    letterSpacing: 0.0,
  ),
  displaySmall: TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w400, // Regular
    letterSpacing: 0.0,
  ),

  // Headline Styles
  headlineLarge: TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400, // Regular
    letterSpacing: 0.0,
  ),
  headlineMedium: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w400, // Regular
    letterSpacing: 0.0,
  ),
  headlineSmall: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400, // Regular
    letterSpacing: 0.0,
  ),

  // Title Styles
  titleLarge: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500, // Medium
    letterSpacing: 0.0,
  ),
  titleMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500, // Medium
    letterSpacing: 0.15,
  ),
  titleSmall: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500, // Medium
    letterSpacing: 0.1,
  ),

  // Label Styles
  labelLarge: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500, // Medium
    letterSpacing: 0.1,
  ),
  labelMedium: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500, // Medium
    letterSpacing: 0.5,
  ),
  labelSmall: TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500, // Medium
    letterSpacing: 0.4,
  ),

  // Body Styles
  bodyLarge: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400, // Regular
    letterSpacing: 0.15,
  ),
  bodyMedium: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400, // Regular
    letterSpacing: 0.25,
  ),
  bodySmall: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400, // Regular
    letterSpacing: 0.4,
  ),
);
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  primaryColor: Colors.white,
  textTheme: textTheme,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  ),
);
