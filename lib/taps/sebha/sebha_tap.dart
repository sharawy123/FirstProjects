import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:islami/taps/settings/serrings_provider.dart';

import '../../app_theme.dart';

class SebhaTap extends StatefulWidget {
  @override
  State<SebhaTap> createState() => _SebhaTapState();
}
List <String> tsabeh =["سبحان الله","الحمد الله","استغفر الله"];
int index =0;
class _SebhaTapState extends State<SebhaTap> {
  double rotationAngle = 0.0;
  int  counter =0;

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider =Provider.of<SettingsProvider>(context);

    return Column(
      children: [
        Expanded(
          flex:4,
          child: Container(
            //  color: Colors.red,
            child: Stack(
              alignment: Alignment.center, // Center everything horizontally and vertically in the Stack
              children: [
                Positioned(
                  top: 45, // Adjust this value to position the body just below the head
                  child: GestureDetector(
                    onTap: rotateImage,
                    child: Transform.rotate(
                      angle: rotationAngle,
                      alignment: Alignment.center,
                      child: Container(
                        child: Image.asset(
                          'assets/images/bodyofsebha.png',
                          width: 232,
                          height: 234,
                        ),
                      ),
                    ),
                  ),
                ),
                // Head of Sebha (remains fixed, no rotation applied)
                Positioned(
                  top: 0, // Center it at the top
                  child: Container(
                    margin: EdgeInsets.only(left: 37),
                    child: Image.asset(
                      'assets/images/headofsebha.png',
                      width: 73,
                      height: 105,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // SizedBox(height: 12),
        Expanded(
            flex:5,
            child: Column(
              children: [
                Text("عدد التسبيحات",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color:settingsProvider.isDark ? AppTheme.whitee : AppTheme.black),),
                Container(alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 26),
                  width: 69,
                  height: 81,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Theme.of(context).primaryColor,
                    border: Border.all(color: Theme.of(context).primaryColor,
                    ),

                  ) ,
                  child: Text("$counter",style: TextStyle(fontSize: 25,fontWeight: FontWeight.normal,color:settingsProvider.isDark ? AppTheme.whitee : AppTheme.black,
                  ),),
                ),
                Container(alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 22),
                  width: 137,
                  height: 51,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color:settingsProvider.isDark ? AppTheme.gold : AppTheme.lightPrimary,
                    border: Border.all(color: Theme.of(context).primaryColor,
                    ),

                  ) ,
                  child: Text("${tsabeh[index]}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.normal,color:settingsProvider.isDark ? AppTheme.black : AppTheme.whitee,),
                  ),

                )],
            ))
      ],
    );
  }

  // Increment rotation angle on tap
  void rotateImage() {
    setState(() {
      rotationAngle += 0.04;
      counter++;
      if(counter%30==0)
      {
        index++;
      }
      if(index==3){
        index=0;
      }
    });
  }
}
