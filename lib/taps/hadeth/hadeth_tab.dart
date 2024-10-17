import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/taps/hadeth/hadeth.dart';
import 'package:islami/taps/hadeth/hadeth_content_screen.dart';
import 'package:islami/widgets/loading_indecator.dart';
import 'package:provider/provider.dart';
import 'package:islami/taps/settings/serrings_provider.dart';

class HadethTap extends StatefulWidget {
  @override
  State<HadethTap> createState() => _HadethTapState();
}

class _HadethTapState extends State<HadethTap> {
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
     if(ahadeth.isEmpty)loadHadithFile();
     SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return Column(
      children: [
        Image.asset(
          'assets/images/hadithlogo.png',
          height: MediaQuery.sizeOf(context).height * 0.25,
        ),
        Divider(
          color:settingsProvider.isDark? AppTheme.gold : AppTheme.lightPrimary,
        ),
        Text('الأحاديث',style:Theme.of(context).textTheme.headlineSmall?.copyWith(color:settingsProvider.isDark? AppTheme.whitee : AppTheme.black )),
        Divider(
          color:settingsProvider.isDark? AppTheme.gold : AppTheme.lightPrimary,
        ),
        Expanded(
          child:ahadeth.isEmpty?
              LoadingIndicator():
          ListView.separated(
            padding: EdgeInsets.only(top: 16),

            itemBuilder: (_, index) => InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(HadethContentScreen.routeName,
                arguments: ahadeth[index],
                );
              },
              child: Text(
                ahadeth [index].title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            itemCount: ahadeth.length, separatorBuilder: (_, __) => SizedBox(
            height: 12,
          ),
          ),
        )
      ],
    );
  }

  Future<void> loadHadithFile() async {
    String ahadethFileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');

    List<String> ahadethStrings = ahadethFileContent.split('#');
    ahadeth = ahadethStrings.map((HadithString) {
      List<String> HadethLines = HadithString.trim().split('\n');
      String title = HadethLines.first;
      HadethLines.removeAt(0);
      List<String> content = HadethLines;
      return Hadeth( title , content);
    }).toList();
    setState(() {});
  }
}
