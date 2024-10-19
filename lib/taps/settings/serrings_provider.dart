import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SettingsProvider with ChangeNotifier{
  ThemeMode themeMode =ThemeMode.light;
  String LangCode ='en';
  bool get isDark =>themeMode ==ThemeMode.dark;

  String get backgroudImageName =>isDark? 'darkbg' : 'background1' ;
  //late  bool themeSave;

  SettingsProvider() {
    loadData(); // Call loadData when the provider is initialized
  }
  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? savedIsDark = prefs.getBool('dark');

    if (savedIsDark != null) {
      themeMode = savedIsDark ? ThemeMode.dark : ThemeMode.light;

      String? LangIsSaved =prefs.getString('lang');
     LangCode=LangIsSaved!;

    }
    notifyListeners();
  }
  void changeTheme(ThemeMode selectedTheme) async
  {
    themeMode=selectedTheme;
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setBool("dark", isDark);
    notifyListeners();
  }
  void changeLang(String SelectedLang)async
  {
    if(SelectedLang==LangCode)return;
    LangCode=SelectedLang;
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setString('lang',LangCode );
    notifyListeners();

  }


}
