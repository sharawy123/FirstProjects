import 'package:flutter/material.dart';
import 'package:islami/taps/quran/surah_content_screen.dart';
import 'package:islami/taps/settings/serrings_provider.dart';
import 'package:provider/provider.dart';

import '../../app_theme.dart';

class QuranTap extends StatelessWidget {
  final List<String>suraNames=[
    "الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
    ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
    ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
    ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
    ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
    ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
    ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
    ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
    ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
    "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس",
  ];

  final List<int> surahAyatCount = [
    7, 286, 200, 176, 120, 165, 206, 75, 129, 109, 123,
    111, 43, 52, 99, 128, 111, 110, 98, 135, 112, 78, 118,
    64, 77, 227, 93, 88, 69, 60, 34, 30, 73, 54, 45,
    83, 182, 88, 75, 85, 54, 53, 89, 59, 37, 35, 38,
    29, 18, 45, 60, 49, 62, 55, 78, 96, 29, 22, 24,
    13, 14, 11, 11, 18, 12, 12, 30, 52, 52, 44, 28,
    28, 20, 56, 40, 31, 50, 40, 46, 42, 29, 19, 36,
    25, 22, 17, 19, 26, 30, 20, 15, 21, 11, 8, 8,
    19, 5, 8, 8, 11, 11, 8, 3, 9, 5, 4, 7,
    3, 6, 3, 5, 4, 5, 6
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
