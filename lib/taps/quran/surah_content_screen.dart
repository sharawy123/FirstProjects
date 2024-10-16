import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/taps/quran/quran_tab.dart';
import 'package:flutter/services.dart';
import 'package:islami/widgets/loading_indecator.dart';
import 'package:provider/provider.dart';

import '../settings/serrings_provider.dart';

class SurahContentScreen extends StatefulWidget {
  static const String routeName = '/surahContent';

  @override
  State<SurahContentScreen> createState() => _SurahContentScreenState();
}

class _SurahContentScreenState extends State<SurahContentScreen> {
   List<String> ayat = [];

  late surahContentArgs args;

  @override
   Widget build (BuildContext context)  {
    args = ModalRoute.of(context)!.settings.arguments as surahContentArgs;
  if(ayat.isEmpty)  {
      loadSurahFile();
    }
  SettingsProvider settingsProvider =Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/${Provider.of<SettingsProvider>(context).backgroudImageName}.png'),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.SurahName),
          // leading: Icon(Icons.arrow_back,color: Colors.yellow,),
        ),
        body: Container(
          padding: EdgeInsets.all(24),
          margin: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: MediaQuery.sizeOf(context).height * 0.07),
          decoration: BoxDecoration(
              color: settingsProvider.isDark? AppTheme.darkPrimary : AppTheme.whitee,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              )),
          child:ayat.isEmpty?
          LoadingIndicator() :
          ListView.builder(
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

     Future <void> loadSurahFile () async  {
   // await Future.delayed(Duration(seconds: 2));
  String sura = await rootBundle.loadString('assets/files/${args.index+1}.txt');
   ayat = sura.split('\r\n');
   setState(() {

   });

  }
}
