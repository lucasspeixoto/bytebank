import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BytebankApp());
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bytebank App',
      theme: ThemeData(
        primaryColor: Colors.green[900],
        fontFamily: 'Inter',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(27, 94, 32, 1),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.green[900],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: const Dashboard(),
    );
  }
}
