import 'package:flutter/material.dart';
import 'package:flutter_app/ui/page/home_page.dart';

void main() => runApp(
    MyApp()
);

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter_app",
      theme: new ThemeData.light(),
      home: new HomePage()
    );
  }
}


