import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/cupertino.dart';
import 'property/property.dart';
import 'dart:convert';


class CirnoApiClient {
  static final CirnoApiClient _instance = CirnoApiClient._internal();
  late final Dio _dio;
  final String baseUrl = "https://biaoju.site:6188";


  CirnoApiClient._internal() {
    _dio = Dio();

    (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (client) {
          return null;
        };

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {

        handler.next(options);
      },
    ));

  }

  factory CirnoApiClient() => _instance;

  Future<Map<String, String>> getTranslationMap(String url) async {
    final response = await _dio.get(url);
    final data = response.data;

    return Map<String, String>.from(data.map((key, value) => MapEntry(key, value.toString())));
  }

  Future<List<ShipAlias>> getShipAliases(String url) async {
    final response = await _dio.get(url);
    final data = response.data;

    return List<ShipAlias>.from(data.map((e) => ShipAlias.fromJson(e)));
  }


}