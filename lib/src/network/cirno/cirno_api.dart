import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/cupertino.dart';
import '../../datasource/models/cirno/upgrade_path.dart';
import '../../datasource/models/cirno/upgrade_response.dart';
import 'property/property.dart';
import 'dart:convert';
import 'package:refuge_next/src/funcs/cirno_auth.dart';
import 'package:refuge_next/src/datasource/models/cirno/property.dart';


class CirnoApiClient {
  static final CirnoApiClient _instance = CirnoApiClient._internal();
  late final Dio _dio;
  final String baseUrl = "https://biaoju.site:6188/";


  CirnoApiClient._internal() {
    _dio = Dio();

    (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (client) {
          return null;
        };

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers["User-Agent"] =
            "RefugeNext/1.0.0 (iPhone; iOS 14.5; Scale/2.00)";
        options.headers["cirno-token"] = CirnoAuth.instance!.uuid;
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

  Future<Response> basicPost({required String endpoint, required Map<String, dynamic> data}) async {
    final response = await _dio.post("$baseUrl$endpoint", data: data, options: Options());
    return response;
  }

  Future<Response> basicPostList({required String endpoint, required List<String> data}) async {
    final response = await _dio.post("$baseUrl$endpoint", data: data, options: Options());
    return response;
  }

  Future<RefugeVersionProperty> getRefugeVersion(String version, String androidVersion, String systemModel) async {
    final data = {
      'version': version,
      'androidVersion': androidVersion,
      'systemModel': systemModel,
    };
    final response = await basicPost(endpoint: 'v2/version', data: data);
    return RefugeVersionProperty.fromJson(response.data);
  }

  String getSubscriptionUrl() {
    return "${baseUrl}subscribe";
  }

  Future<ShipUpgradeResponse> getShipUpgradePath({required ShipUpgradeConfig config}) async {
    final data = config.toJson();
    final testString = jsonEncode(data);
    final response = await basicPost(endpoint: 'v2/upgrade/path', data: data);
    return ShipUpgradeResponse.fromJson(response.data);
  }

  Future<void> uploadNotTranslatedTexts(List<String> texts) async {
    final data = texts;
    await basicPostList(endpoint: 'v2/translation/not-translated', data: data);
  }


}