import 'package:flutter/material.dart';

void main(){
  runApp(IslamiApp());
}
class IslamiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
appBar: AppBar(
  title: Text('app'),
),
      ),
    );
  }
}
