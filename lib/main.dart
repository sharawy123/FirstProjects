import 'package:flutter/material.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/taps/hadeth/hadeth_content_screen.dart';
import 'package:islami/taps/quran/surah_content_screen.dart';
import 'package:islami/taps/settings/serrings_provider.dart';
import 'app_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main(){
  runApp(ChangeNotifierProvider(
    create: (_)=> SettingsProvider(),
      child: IslamiApp()));
}
class IslamiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     routes: {
        HomeScreen.routeName:(_)=>HomeScreen(),
       SurahContentScreen.routeName:(_)=>SurahContentScreen(),
       HadethContentScreen.routeName:(_)=>HadethContentScreen(),
     },
     initialRoute: HomeScreen.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settingsProvider.themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale : Locale(settingsProvider.LangCode),
    );
  }
}
//final project
