import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/taps/settings/lang.dart';
import 'package:islami/taps/settings/serrings_provider.dart';
import 'package:provider/provider.dart';

class Settingstap extends StatefulWidget {
  @override
  State<Settingstap> createState() => _SettingstapState();
}

class _SettingstapState extends State<Settingstap> {
  List<Lang> langs = [
    Lang(name: "English", code: "en"),
    Lang(name: "العربية", code: "ar"),
  ];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Dark mode',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.w500)),
              Switch(
                activeTrackColor: AppTheme.gold ,
               // thumbColor: ,
                value: settingsProvider.themeMode == ThemeMode.dark ?true : false,
                onChanged: (IsDark) => settingsProvider
                    .changeTheme(IsDark ? ThemeMode.dark : ThemeMode.light),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Language',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.w500)),
              DropdownButtonHideUnderline(
                child: DropdownButton<Lang>(
                  borderRadius: BorderRadius.circular(20),
                  value: langs.firstWhere((Lang) => Lang.code == settingsProvider.LangCode,),
                  items: langs.map((language) => DropdownMenuItem<Lang>(
                            child: Text(language.name,style:Theme.of(context).textTheme.titleLarge ,),
                            value: language,
                          ))
                      .toList(),
                  onChanged: (selectedLanguage) {
                    if(selectedLanguage!=null)
                      {
                        settingsProvider.changeLang(selectedLanguage.code);
                      }
                  },
                  dropdownColor: settingsProvider.isDark? AppTheme.darkPrimary : AppTheme.whitee,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
