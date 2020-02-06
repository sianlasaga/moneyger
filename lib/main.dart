import 'package:flutter/material.dart';

import 'package:moneyger/theme/style.dart';
import 'package:moneyger/screens/Home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moneyger',
      theme: appTheme(),
      home: HomeScreen(),
    );
  }
}
