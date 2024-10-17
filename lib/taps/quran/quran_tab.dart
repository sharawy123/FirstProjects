import 'package:flutter/material.dart';
import 'package:islami/taps/quran/surah_content_screen.dart';
import 'package:islami/taps/settings/serrings_provider.dart';
import 'package:provider/provider.dart';

import '../../app_theme.dart';

class QuranTap extends StatelessWidget {
  final List<String> suraNames = [
    "الفاتحه", "البقرة", "آل عمران", "النساء", "المائدة", "الأنعام", "الأعراف",
    // ... (rest of the surah names)
    "الإخلاص", "الفلق", "الناس",
  ];

  final List<int> surahAyatCount = [
    7, 286, 200, 176, 120, 165, 206,
    // ... (rest of the ayat counts)
    5, 4, 6
  ];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return Column(
      children: [
        Image.asset(
          'assets/images/quran_header_icn.png',
          height: MediaQuery.sizeOf(context).height * 0.25,
        ),
        Divider(
          color: settingsProvider.isDark ? AppTheme.gold : AppTheme.lightPrimary,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'عدد الآيات',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: settingsProvider.isDark
                      ? AppTheme.whitee
                      : AppTheme.black),
            ),
            Text(
              'إسم السورة',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
        Divider(
          color: settingsProvider.isDark ? AppTheme.gold : AppTheme.lightPrimary,
        ),
        Expanded(
          child: Stack(
            children: [
              ListView.separated(
                separatorBuilder: (_, __) => SizedBox(
                  height: 12,
                ),
                itemBuilder: (_, index) => InkWell(
                  onTap: () => Navigator.of(context).pushNamed(
                    SurahContentScreen.routeName,
                    arguments: surahContentArgs(
                        index: index, SurahName: suraNames[index]),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "${surahAyatCount[index]}",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        suraNames[index],
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
                itemCount: suraNames.length,
              ),
              // Adding the vertical divider
              Positioned(
                left: MediaQuery.sizeOf(context).width / 2 - 1, // Center the divider
                top: 0,
                bottom: 0,
                child: Container(
                  width: 2,
                  color: settingsProvider.isDark
                      ? AppTheme.gold
                      : AppTheme.lightPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class surahContentArgs {
  String SurahName;
  int index;

  surahContentArgs({required this.index, required this.SurahName});
}
