import 'package:flutter/material.dart';
import 'package:scoreboard/screens/home_new.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "ComicSans"),
      debugShowCheckedModeBanner: false,
      home: HomeNew(),
    );
  }
}
