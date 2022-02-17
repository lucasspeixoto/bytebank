import 'package:flutter/material.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Contact'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                    ),
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 2),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Account Number',
                  ),
                  style: TextStyle(
                    fontSize: 24,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: null,
                    child: Text('Create'),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  int _createAccount() {
    return 1;
  }
}
