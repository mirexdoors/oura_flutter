import 'package:flutter/material.dart';

import 'screens/auth.dart';

void main() => runApp(HealthboardApp());

class HealthboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Max Fitness',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(50, 65, 85, 1),
        textTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
      ),
      home: AuthorizationPage(),
    );
  }
}
