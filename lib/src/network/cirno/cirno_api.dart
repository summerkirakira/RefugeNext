import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/cupertino.dart';
import 'package:http_parser/http_parser.dart';
import 'package:refuge_next/src/datasource/models/cirno/promote_property.dart';
import '../../datasource/models/cirno/upgrade_path.dart';
import '../../datasource/models/cirno/upgrade_response.dart';
import 'property/property.dart';
import 'dart:convert';
import 'package:refuge_next/src/funcs/cirno_auth.dart';
import 'package:refuge_next/src/datasource/models/cirno/property.dart';
import 'package:refuge_next/src/datasource/models/cirno/account.dart';
import 'package:refuge_next/src/repo/refuge_account.dart';


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
      onRequest: (options, handler) async {
        options.headers["User-Agent"] =
            "RefugeNext/1.0.0 (iPhone; iOS 14.5; Scale/2.00)";
        options.headers["cirno-token"] = CirnoAuth.instance!.uuid;

        // 自动添加 JWT token（如果已登录）
        final jwtToken = await RefugeAccountRepo().getJwtToken();
        if (jwtToken != null && jwtToken.isNotEmpty) {
          options.headers["Authorization"] = "Bearer $jwtToken";
        }

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
    final response = await _dio.post("$baseUrl$endpoint", data: jsonEncode(data), options: Options());
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


  Future<List<PromotionCode>> getAllPromotionCodes() async {
    final response = await _dio.get("${baseUrl}promotion/all");
    final data = response.data;
    return List<PromotionCode>.from(data.map((e) => PromotionCode.fromJson(e)));
  }

  String getSubscriptionUrl() {
    return "${baseUrl}subscribe";
  }

  Future<ShipUpgradeResponse> getShipUpgradePath({required ShipUpgradeConfig config}) async {
    final data = config.toJson();
    final response = await basicPost(endpoint: 'v2/upgrade/path', data: data);
    return ShipUpgradeResponse.fromJson(response.data);
  }

  Future<void> uploadNotTranslatedTexts(List<String> texts) async {
    final data = {
      'texts': texts,
    };
    await basicPost(endpoint: 'v2/addTranslation', data: data);
  }

  Future<void> uploadNotFindShip(List<UpgradeShip> upgradeShips) async {
    final data = {
      'ships': upgradeShips,
    };
    await basicPost(endpoint: 'v2/addUpgradeShipRecord', data: data);
  }

  Future<void> updateClientInfo(String message) async {
    final data = {
      'primaryUser': message,
    };
    await basicPost(endpoint: 'client/info', data: data);
  }

  // ==================== 避难所账号相关 API ====================

  /// 注册账号
  Future<void> registerAccount({
    required String email,
    required String password,
    required String username,
  }) async {
    final request = AccountRegisterRequest(
      email: email,
      password: password,
      username: username,
    );
    await basicPost(endpoint: 'account/register', data: request.toJson());
  }

  /// 登录账号（自动保存 JWT token）
  Future<AccountLoginResponse> loginAccount({
    required String email,
    required String password,
  }) async {
    final request = AccountLoginRequest(
      email: email,
      password: password,
    );
    final response = await basicPost(endpoint: 'account/login', data: request.toJson());

    final loginResponse = AccountLoginResponse.fromJson(response.data);

    // 自动保存 JWT token 和邮箱
    await RefugeAccountRepo().saveLoginInfo(
      token: loginResponse.accessToken,
      email: loginResponse.email,
    );

    return loginResponse;
  }

  /// 绑定当前设备到账号
  Future<void> bindDeviceToAccount() async {
    // 此接口依赖 JWT，会自动从拦截器中添加 Authorization header
    await basicPost(endpoint: 'account/bind', data: {});
  }

  /// 获取账号信息
  Future<AccountInfoResponse> getAccountInfo() async {
    // 此接口依赖 JWT，会自动从拦截器中添加 Authorization header
    final response = await _dio.get("${baseUrl}account/info");
    return AccountInfoResponse.fromJson(response.data);
  }

  /// 解绑设备
  Future<void> unbindDevice(String uuid) async {
    // 此接口依赖 JWT，会自动从拦截器中添加 Authorization header
    await _dio.delete("${baseUrl}account/unbind/$uuid");
  }

  /// 获取账号详细信息
  Future<AccountDetailResponse> getAccountDetail() async {
    // 此接口依赖 JWT，会自动从拦截器中添加 Authorization header
    final response = await _dio.get("${baseUrl}account/detail");
    return AccountDetailResponse.fromJson(response.data);
  }

  /// 更新账号详细信息
  Future<void> updateAccountDetail({
    String? username,
    String? avatar,
    String? extraInfo,
  }) async {
    // 此接口依赖 JWT，会自动从拦截器中添加 Authorization header
    final request = UpdateAccountDetailRequest(
      username: username,
      avatar: avatar,
      extraInfo: extraInfo,
    );
    await _dio.put(
      "${baseUrl}account/detail",
      data: request.toJson(),
    );
  }

  /// 上传头像图片
  Future<Map<String, dynamic>> uploadAvatar(String filePath) async {
    // 此接口依赖 JWT，会自动从拦截器中添加 Authorization header

    // 根据文件扩展名确定 MIME 类型
    String? contentType;
    final extension = filePath.toLowerCase().split('.').last;

    switch (extension) {
      case 'jpg':
      case 'jpeg':
        contentType = 'image/jpeg';
        break;
      case 'png':
        contentType = 'image/png';
        break;
      case 'gif':
        contentType = 'image/gif';
        break;
      case 'webp':
        contentType = 'image/webp';
        break;
      default:
        throw Exception('不支持的图片格式: .$extension\n仅支持: jpg, jpeg, png, gif, webp');
    }

    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        filePath,
        contentType: MediaType.parse(contentType),
      ),
    });

    final response = await _dio.post(
      "${baseUrl}account/upload-avatar",
      data: formData,
    );

    return response.data as Map<String, dynamic>;
  }

  /// 批量添加游戏日志
  Future<GameLogResult> addGameLogBatch(List<GameLogRequest> logs) async {
    // 此接口依赖 JWT，会自动从拦截器中添加 Authorization header
    final request = GameLogBatchRequest(logs: logs);
    final response = await basicPost(endpoint: 'gamelog/add', data: request.toJson());
    return GameLogResult.fromJson(response.data);
  }

  /// 查询游戏日志
  Future<Map<String, dynamic>> queryGameLogs({
    String? logType,
    String? startTime,
    String? endTime,
    int page = 0,
    int perPage = 20,
  }) async {
    // 此接口依赖 JWT，会自动从拦截器中添加 Authorization header
    final queryParams = <String, dynamic>{
      'page': page,
      'per_page': perPage,
    };

    if (logType != null) queryParams['log_type'] = logType;
    if (startTime != null) queryParams['start_time'] = startTime;
    if (endTime != null) queryParams['end_time'] = endTime;

    final response = await _dio.get(
      "${baseUrl}gamelog/query",
      queryParameters: queryParams,
    );

    return response.data as Map<String, dynamic>;
  }

  /// 获取游戏日志同步信息
  Future<GameLogSyncInfoResponse> getGameLogSyncInfo() async {
    // 此接口依赖 JWT，会自动从拦截器中添加 Authorization header
    final response = await _dio.get("${baseUrl}gamelog/sync-info");
    return GameLogSyncInfoResponse.fromJson(response.data);
  }

  /// 登出（清除本地 JWT token）
  Future<void> logout() async {
    await RefugeAccountRepo().clearAll();
  }


}