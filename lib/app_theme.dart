import 'package:flutter/material.dart';

class AppTheme
{
  static const Color lightPrimary =Color(0xFFB7935F);
  static const Color darkPrimary =Color(0xFF141A2E);
  static const Color whitee =Color(0xFFF8F8F8);
  static const Color black =Color(0xFF242424);
  static const Color gold =Color(0xFFFACC1D);

  static ThemeData lightTheme =ThemeData(
    primaryColor: lightPrimary,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: black,
      )
    ),
    scaffoldBackgroundColor:Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: black,
      unselectedItemColor: whitee,
      backgroundColor: lightPrimary,
    )

  );
  static ThemeData darkTheme =ThemeData(
    primaryColor: darkPrimary,
  );

}