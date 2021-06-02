import 'package:flutter/material.dart';
import 'package:infugion_ui/screens/change_page.dart';
import './screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        ChangePage.routeName: (ctx) => ChangePage(),
        HomePage.routeName: (ctx) => HomePage(),
      },
      home: ChangePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
