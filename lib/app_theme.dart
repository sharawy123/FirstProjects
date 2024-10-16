import 'package:flutter/material.dart';

class AppTheme {
  static const Color lightPrimary = Color(0xFFB7935F);
  static const Color darkPrimary = Color(0xFF141A2E);
  static const Color whitee = Color(0xFFF8F8F8);
  static const Color black = Color(0xFF242424);
  static const Color gold = Color(0xFFFACC1D);

  static ThemeData lightTheme = ThemeData(
      primaryColor: lightPrimary,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
          backgroundColor: Colors.transparent,
          foregroundColor: black,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: black,
          )),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: black,
        unselectedItemColor: whitee,
        backgroundColor: lightPrimary,
      ),
      textTheme: TextTheme(
        headlineSmall:
            TextStyle(
                fontSize: 25, fontWeight: FontWeight.w400, color: black),
        titleLarge: TextStyle(
          fontSize: 20,fontWeight: FontWeight.w400,color: black,
        )
      ));
  static ThemeData darkTheme = ThemeData(
    primaryColor: darkPrimary,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: whitee,
          ),
          backgroundColor: Colors.transparent,
          foregroundColor: whitee,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: whitee,
          )),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: gold,
        unselectedItemColor: whitee,
        backgroundColor: darkPrimary,
      ),
      textTheme: TextTheme(
          headlineSmall:
          TextStyle(
              fontSize: 25, fontWeight: FontWeight.w400, color: whitee),
          titleLarge: TextStyle(
            fontSize: 20,fontWeight: FontWeight.w400,color: gold,
          )
      ),

  );
}
