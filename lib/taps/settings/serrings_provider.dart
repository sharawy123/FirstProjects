import 'package:flutter/material.dart';
class SettingsProvider with ChangeNotifier{
  ThemeMode themeMode =ThemeMode.light;
  String LangCode ='en';
  bool get isDark =>themeMode ==ThemeMode.dark;

  String get backgroudImageName =>isDark? 'darkbg' : 'background1' ;
  void changeTheme(ThemeMode selectedTheme)
  {
    themeMode=selectedTheme;
    notifyListeners();
  }
  void changeLang(String SelectedLang)
  {
    if(SelectedLang==LangCode)return;
    LangCode=SelectedLang;
    notifyListeners();

  }
}