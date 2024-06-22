import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Dio dio() {
  final apiKey = dotenv.env['API_KEY'];
  Dio dio = Dio();
  dio.options.baseUrl = 'http://api.weatherapi.com/v1';
  dio.options.queryParameters = {'key': apiKey};
  return dio;
}
