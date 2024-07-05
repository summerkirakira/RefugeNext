import 'package:dio/dio.dart';

class RsiApiClient {
  static final RsiApiClient _instance = RsiApiClient._internal();
  late final Dio _dio;



  factory RsiApiClient() => _instance;
  RsiApiClient._internal() {
    _dio = Dio();

  }
}
