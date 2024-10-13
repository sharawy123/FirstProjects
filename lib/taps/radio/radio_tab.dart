import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
    //  crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 105),
        Image.asset('assets/images/Radiologo.png',width: 412,height: 222,fit: BoxFit.fill,),
        SizedBox(height: 57),
        Text('إذاعة القرآن الكريم',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25),),
        SizedBox(height: 57),
        Row(
            children: [
              Container(
                  margin:EdgeInsets.only(left: 92),
    child: Icon(Icons.skip_previous,color: Color(0xFFB7935F),size: 35,)),
              Container( margin: EdgeInsets.only(left: 39),
                  child: Icon(Icons.play_arrow,color: Color(0xFFB7935F),size: 50,)),
              Container(margin: EdgeInsets.only(left: 50),
                  child: Icon(Icons.skip_next,color: Color(0xFFB7935F),size: 35,)),

            ],
        )
      ],
    )
    ;
  }
}
