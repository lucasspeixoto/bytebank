import 'dart:async';

import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/http/webclients/transaction_webclient.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/widgets/progress.dart';
import 'package:bytebank/widgets/response_dialog.dart';
import 'package:bytebank/widgets/transaction_auth_dialog.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TransactionForm extends StatefulWidget {
  final Contact contact;

  const TransactionForm({required this.contact, Key? key}) : super(key: key);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController _valueController = TextEditingController();
  final TransactionWebClient _webClient = TransactionWebClient();
  final String transactionId = const Uuid().v4();

  bool _sending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New transaction'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Visibility(
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ProgressLoading(message: 'Sending...'),
                ),
                visible: _sending,
              ),
              Text(
                widget.contact.name,
                style: const TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  widget.contact.accountNumber.toString(),
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _valueController,
                  style: const TextStyle(fontSize: 24.0),
                  decoration: const InputDecoration(labelText: 'Value'),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    child: const Text('Transfer'),
                    onPressed: () {
                      final double value = double.parse(_valueController.text);
                      final transactionCreated =
                          Transaction(transactionId, value, widget.contact);
                      showDialog(
                        context: context,
                        builder: (contextDialog) {
                          return TransactionAuthDialog(
                            onConfirm: (String password) {
                              _save(transactionCreated, password, context);
                            },
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _save(
    Transaction transactionCreated,
    String password,
    BuildContext context,
  ) async {
    setState(() {
      _sending = true;
    });
    await _webClient.save(transactionCreated, password).then((transaction) {
      _showSuccessfulMessage(transaction, context);
    }).catchError((error) {
      _showFailureMessage(context, message: error.message);
    }, test: (error) => error is HttpException).catchError((error) {
      _showFailureMessage(context,
          message: 'timeout submitting the transaction');
    }, test: (error) => error is TimeoutException).catchError(
      (error) {
        _showFailureMessage(context);
      },
    ).whenComplete(() {
      setState(() {
        _sending = false;
      });
    }); // Só executa o catchError se receber uma Expection
  }

  Future _showSuccessfulMessage(
      Transaction transaction, BuildContext context) async {
    await showDialog(
        context: context,
        builder: (contextDialog) {
          return const SuccessDialog('successful transaction');
        });

    Navigator.pop(context);
  }

  void _showFailureMessage(
    BuildContext context, {
    String message = 'Unknown error',
  }) async {
    await showDialog(
        context: context,
        builder: (contextDialog) {
          return FailureDialog(message);
        });
  }
}
