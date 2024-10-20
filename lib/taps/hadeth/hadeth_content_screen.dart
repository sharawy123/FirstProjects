import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/taps/hadeth/hadeth.dart';
import 'package:islami/taps/quran/quran_tab.dart';
import 'package:flutter/services.dart';
import 'package:islami/taps/settings/serrings_provider.dart';
import 'package:islami/widgets/loading_indecator.dart';
import 'package:provider/provider.dart';

class HadethContentScreen extends StatelessWidget {
  static const String routeName = '/hadethContent';

  @override
  Widget build (BuildContext context)  {
    Hadeth hadith = ModalRoute.of(context)!.settings.arguments as Hadeth;
    SettingsProvider settingsProvider =Provider.of<SettingsProvider>(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/${Provider.of<SettingsProvider>(context).backgroudImageName}.png'),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(hadith.title),
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
          child:
          ListView.builder(
              itemBuilder: (_, index) => Text(
                hadith.content[index],
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              itemCount: hadith.content.length),
        ),
      ),
    );
  }
}
