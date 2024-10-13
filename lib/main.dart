import 'package:flutter/material.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/taps/quran/surah_content_screen.dart';
import 'app_theme.dart';
void main(){
  runApp(IslamiApp());
}
class IslamiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     routes: {
        HomeScreen.routeName:(_)=>HomeScreen(),
       SurahContentScreen.routeName:(_)=>SurahContentScreen(),
     },
     initialRoute: HomeScreen.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
