import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.teal, // Choose your primary color
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 1,
      iconTheme: IconThemeData(color: Colors.teal),
      titleTextStyle: TextStyle(
          color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w500),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black87),
      headlineMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black87),
      bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black87),
      bodyMedium: TextStyle(fontSize: 14.0, color: Colors.black54),
      labelLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white), // For buttons
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal, // Button background
        foregroundColor: Colors.white, // Button text
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: Colors.black12,
      thickness: 1,
    ),
    // Add other theme properties as needed
  );

// Define a dark theme if needed
// static final ThemeData darkTheme = ThemeData(...);
}

class AppColors {
  static const Color primary = Colors.teal;
  static const Color accent = Colors.amber; // Example accent color
  static const Color textPrimary = Colors.black87;
  static const Color textSecondary = Colors.black54;
  static const Color background = Colors.white;
  static const Color footerBackground = Color(0xFFF5F5F5);
}