import 'package:flutter/material.dart';
import 'package:islami/taps/hadeth/hadeth_tab.dart';
import 'package:islami/taps/quran/quran_tab.dart';
import 'package:islami/taps/radio/radio_tab.dart';
import 'package:islami/taps/sebha/sebha_tap.dart';
import 'package:islami/taps/settings/serrings_provider.dart';
import 'package:islami/taps/settings/settings_tap.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTapIndex = 0;
  List<Widget> Tabs = [
    QuranTap(),
    HadethTap(),
    SebhaTap(),
    RadioTab(),
    Settingstap(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/${Provider.of<SettingsProvider>(context).backgroudImageName}.png'),
            fit: BoxFit.fill),
      ),
      child: Scaffold(

        appBar: AppBar(
          title: Text('إسلامي'),
        ),
        body: Tabs[selectedTapIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedTapIndex,
          onTap: (Index) {
            selectedTapIndex = Index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/quran.png')),
              label: 'Quran',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                  AssetImage('assets/images/quran-quran-svgrepo-com.png')),
              label: 'Hadeth',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/sebha.png')),
              label: 'Sebha',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/radio.png')),
              label: 'Radio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
