import 'package:flutter/material.dart';
import 'package:soccerapp/screens/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soccer App',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "ComicSans"),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
