/* import 'package:bytebank/database/dao/contacts.dart';
import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/transaction.dart'; */
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';

/* import 'database/app_database.dart';
import 'models/contact.dart'; */

/* import 'database/app_database.dart';
import 'models/contact.dart'; */

void main() {
  runApp(const BytebankApp());
  /*  save(Contact(5, 'Lucas Peixoto', 23000)).then((id) {
    debugPrint('Id: $id');
  }); */
  /*  save(
    Transaction(
      12350.0,
      const Contact(id: 0, name: 'Fulano', accountNumber: 8500),
    ),
  ).then((transaction) {
    debugPrint('transaction: $transaction');
  }); */
  /*  findAll().then((transactions) {
    debugPrint('transactions: $transactions');
  }); */
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
