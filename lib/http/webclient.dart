import 'dart:convert';

import 'package:bytebank/database/dao/contacts.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}

Future<List<Transaction>> findAll() async {
  final Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);
  final Response response = await client
      .get(Uri.http(
        '192.168.1.14:8080',
        'transactions',
      ))
      .timeout(
        const Duration(seconds: 1),
      );

  if (response.statusCode == 200) {
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Transaction> transactions = [];

    for (Map<String, dynamic> transactionJson in decodedJson) {
      final Map<String, dynamic>? contactJson = transactionJson['contact'];
      final Transaction transaction = Transaction(
          transactionJson['value'],
          Contact(
            id: 0,
            name: contactJson!['name'],
            accountNumber: contactJson['accountNumber'],
          ));
      transactions.add(transaction);
    }
    return transactions;
  }
  return [];
}
