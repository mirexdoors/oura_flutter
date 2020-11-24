import 'package:flutter/material.dart';
import 'screens/start.dart';

void main() => runApp(HealthboardApp());

class HealthboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Healthboard App',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(238, 238, 238, 1),
        textTheme: TextTheme(headline6: TextStyle(color: Color.fromRGBO(53, 104, 89,1))),
      ),
      home: StartScreen(),
    );
  }
}
