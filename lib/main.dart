import 'package:flutter/material.dart';
import 'package:flutter_counter/screens/city_screen.dart';
import 'package:flutter_counter/screens/loading_screen.dart';
import 'package:flutter_counter/screens/report_screen.dart';


void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(),
      home: LoadingScreen()
    );
  }
}