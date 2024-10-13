import 'package:flutter/material.dart';
import 'package:islami/taps/quran/surah_content_screen.dart';

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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/quran_header_icn.png',
         height: MediaQuery.sizeOf(context).height*0.25,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (_,__)=>SizedBox(height: 12,),
itemBuilder: (_,index)=>InkWell(
  onTap: ()=>Navigator.of(context).pushNamed(SurahContentScreen.routeName,
      arguments:surahContentArgs(index: index, SurahName: suraNames[index]),
  ),
  child: Text(suraNames[index],textAlign: TextAlign.center,
    style:Theme.of(context).textTheme.headlineSmall,),
),
            itemCount: suraNames.length,
          ),
        )
      ],
    );
  }
}
class surahContentArgs
{
  String SurahName;
  int index;
  surahContentArgs({required this.index,required this.SurahName});
}