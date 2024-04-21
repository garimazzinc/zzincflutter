import 'package:flutter/material.dart';

class MyAppTheme {
  static ThemeData lightTheme = ThemeData(
    // Define the primary color for your app
    primaryColor: Colors.black,
    // const Color(0xFFBFD1EC),

    // Define the accent color that will be used for widgets like buttons, FABs, etc.
    brightness: Brightness.light,

    // Define the background color of your app
    scaffoldBackgroundColor: Colors.white,

    // Define text styles for the entire app
    textTheme: TextTheme(

      bodyLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      // Define more text styles as needed
    ),

    // Define button themes
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF1A8CD8), // Change button color here
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    ),



    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor:  const Color(0xFF1A8CD8),
        backgroundColor: Colors.transparent, // Change text color here
        side: BorderSide(color:  const Color(0xFF1A8CD8)), // Change border color here
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    ),

    // Define input decoration theme for TextFormField
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
      hintStyle: TextStyle(color: Colors.grey),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: const Color(0xFF1A8CD8)),
        borderRadius: BorderRadius.circular(8),
      ),
    ),

    textSelectionTheme: const TextSelectionThemeData(
      cursorColor:  Color(0xFF1A8CD8),
      selectionColor:  Colors.white24,
      selectionHandleColor:  Color(0xFF1A8CD8),
    ),


    // Define app bar theme
    appBarTheme: AppBarTheme(
      color: Colors.blue,
      // brightness is defined under AppBarTheme// or Brightness.dark as needed
    ),

    // Define card theme
    cardTheme: CardTheme(
      color: Colors.white,
    ),


    // Define other theme properties as needed
  );

  // Define a dark theme if needed
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    // Customize dark theme properties here
  );
}
