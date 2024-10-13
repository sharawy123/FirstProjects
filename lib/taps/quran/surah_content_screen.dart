import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/taps/quran/quran_tab.dart';

class SurahContentScreen extends StatelessWidget {
  static const String routeName = '/surahContent';
  List<String> ayat = [
    "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ",
    "الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَِ",
    "الرَّحْمَنِ الرَّحِيمِ",
    "مَالِكِ يَوْمِ الدِّينِِ",
    "ِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ",
    "اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَِ",
    "صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينِ",
  ];
 late surahContentArgs args;
  @override
  Widget build(BuildContext context) {
   args =ModalRoute.of(context)!.settings.arguments as surahContentArgs;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background1.png'),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.SurahName),
          // leading: Icon(Icons.arrow_back,color: Colors.yellow,),
        ),
        body: Container(
          padding: EdgeInsets.all(24),
          margin: EdgeInsets.symmetric(horizontal: 30,vertical: MediaQuery.sizeOf(context).height*0.07),
          decoration: BoxDecoration(
            color: AppTheme.whitee.withOpacity(0.8),
            borderRadius: BorderRadius.all(Radius.circular(25),)
          ),
          child: ListView.builder(
              itemBuilder: (_, index) => Text(
                    ayat[index],
                    textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
                  ),
              itemCount: ayat.length),
        ),
      ),
    );
  }
void  loadSurahFile()
{
  print(args.index);
}
}
