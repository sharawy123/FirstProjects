import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:islami/taps/settings/serrings_provider.dart';

import '../../app_theme.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Column(
    //  crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 105),
        Image.asset('assets/images/Radiologo.png',width: 412,height: 222,fit: BoxFit.fill,),
        SizedBox(height: 57),
        Text('إذاعة القرآن الكريم',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25,color:settingsProvider.isDark ? AppTheme.whitee : AppTheme.black, ),),
        SizedBox(height: 57),
        Row(
            children: [
              Container(
                  margin:EdgeInsets.only(left: 92),
    child: Icon(Icons.skip_previous,color:settingsProvider.isDark ? AppTheme.gold : AppTheme.lightPrimary,size: 35,)),
              Container( margin: EdgeInsets.only(left: 39),
                  child: Icon(Icons.play_arrow,color:settingsProvider.isDark ? AppTheme.gold : AppTheme.lightPrimary,size: 50,)),
              Container(margin: EdgeInsets.only(left: 50),
                  child: Icon(Icons.skip_next,color:settingsProvider.isDark ? AppTheme.gold : AppTheme.lightPrimary,size: 35,)),

            ],
        )
      ],
    )
    ;
  }
}
