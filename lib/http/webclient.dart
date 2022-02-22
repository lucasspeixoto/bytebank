import 'package:bytebank/http/interceptors/logging_interceptors.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

final Client client = InterceptedClient.build(
  interceptors: [
    LoggingInterceptor(),
  ],
);

final Uri uri = Uri.http(
  '192.168.1.14:8080',
  'transactions',
);
