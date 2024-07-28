import 'package:dev_zone/core/constants/colors.dart';
import 'package:dev_zone/core/constants/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DevZone',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: kPrimaryColor,
        fontFamily: kFontFamily,
        useMaterial3: true,
      ),
      home: const Scaffold(),
    );
  }
}
