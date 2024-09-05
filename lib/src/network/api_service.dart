import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'utils.dart';
import '../datasource/models/login/login_property.dart';
import 'dart:io';
import 'hangar/property.dart';

class RsiApiClient {
  static final RsiApiClient _instance = RsiApiClient._internal();
  late final Dio _dio;

  String rsiDevice = "";
  String rsiToken = "";
  String xsrfToken = "";
  String rsiCookieContent =
      "{stamp:%27OxTvKGMly/MLoYR3VVQb40QHQbh68uSc2ORKIfKGhLQyPGB71fbjEA==%27%2Cnecessary:true%2Cpreferences:false%2Cstatistics:false%2Cmarketing:true%2Cmethod:%27explicit%27%2Cver:1%2Cutc:1698762520261%2Cregion:%27gb%27}; _ga=GA1.2.789579038.1698763289; wsc_view_count=1; wsc_hide=true";

  String baseUrl = "https://robertsspaceindustries.com/";

  String get rsiCookie =>
      "CookieConsent=$rsiCookieContent;_rsi_device=$rsiDevice;Rsi-Token=$rsiToken";

  factory RsiApiClient() => _instance;

  RsiApiClient._internal() {
    _dio = Dio();

    (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (client) {
      // client.findProxy = (uri) {
      //   // 设置代理地址和端口
      //   return "PROXY 192.168.133.154:8866";
      // };
      // 忽略证书错误（如果使用 HTTPS 代理）
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // 在请求头中添加 cookie
        if (rsiToken.isNotEmpty) {
          options.headers["x-rsi-token"] = rsiToken;
        }
        if (rsiDevice.isNotEmpty) {
          options.headers["x-rsi-device"] = rsiDevice;
        }

        if (options.path.contains('launcher')) {
          // options.headers["cookie"] = rsiCookie;
        } else {
          options.headers["cookie"] = rsiCookie;
          options.headers["User-Agent"] =
              "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3";
          options.headers["Referer"] = "https://robertsspaceindustries.com/";
          options.headers["x-csrf-token"] = xsrfToken;
        }

        // for (var header in options.headers.entries) {
        //   print("requheader-----${header.key}: ${header.value}");
        // }
        handler.next(options); // 继续处理请求
      },
      onResponse: (response, handler) {
        // 访问响应头中的 Set-Cookie 变量
        if (response.headers['set-cookie'] != null) {
          List<String> cookies = response.headers['set-cookie']!;
          for (var cookie in cookies) {
            if (cookie.contains("Rsi-Token")) {
              final token = cookie.split(";")[0].split("=")[1];
              rsiToken = token;
            }
            if (cookie.contains("_rsi_device")) {
              final device = cookie.split(";")[0].split("=")[1];
              rsiDevice = device;
            }
            // print('Set-Cookie: $cookie');
            // 您可以在这里处理 cookie，例如存储到本地存储
          }
        }
        handler.next(response); // 继续处理响应
      },
    ));
  }

  void setRSIDevice({required String device}) {
    rsiDevice = device;

    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('vip.kirakira.user.device', device);
    });
  }

  void setRSIToken({required String token}) {
    rsiToken = token;
  }

  Future<void> refreshCsrfToken() async {
    final response = await basicGet(endpoint: "");
    final csrfToken = extractCsrfToken(response.data);
    if (csrfToken == null) {
      // Error log
      return;
    }
    xsrfToken = csrfToken;
  }

  Map<String, String> get basicHeaders => {
        "Cookie": rsiCookie,
        "x-rsi-token": rsiToken,
        "x-rsi-device": rsiDevice,
        "User-Agent":
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3",
        "Referer": "https://robertsspaceindustries.com/",
        "x-csrf-token": xsrfToken,
      };

  Future<Response> basicGet({required String endpoint}) async {
    final response = await _dio.get("$baseUrl$endpoint", options: Options());
    return response;
  }

  Future<Response> basicPost({required String endpoint, required Map<String, dynamic> data}) async {
    final response = await _dio.post("$baseUrl$endpoint", data: data, options: Options());
    return response;
  }

  Future<Response> graphql({required Map<String, dynamic> data}) async {
    final response =
        await _dio.post("${baseUrl}graphql", data: data, options: Options());
    return response;
  }

  Future<LauncherLoginProperty> login(
      {required String email,
      required String password,
      String? captcha}) async {
    final response = await _dio.post("${baseUrl}api/launcher/v3/signin", data: {
      "username": email,
      "password": password,
      "captcha": captcha,
      "remember": true,
    });
    return LauncherLoginProperty.fromJson(response.data);
  }

  Future<LauncherLoginProperty> loginWithCode({required String code}) async {
    final response =
        await _dio.post("${baseUrl}api/launcher/v3/signin/multiStep", data: {
      "code": code,
      "device_name": "Refuge",
      "device_type": "computer",
      "duration": "year",
    });
    return LauncherLoginProperty.fromJson(response.data);
  }

  Future<Uint8List?> getCaptchaImage() async {
    final response = await _dio.post("${baseUrl}api/launcher/v3/signin/captcha",
        data: {},
        options: Options(
          responseType: ResponseType.bytes,
        ));
    if (response.data == null) {
      return null;
    }
    return Uint8List.fromList(response.data);
  }

  Future<String> getPage(String endpoint) async {
    final response = await basicGet(endpoint: endpoint);
    return response.data;
  }

  Future<BasicResponseBody> reclaimItem({required String pledge, required String password}) async {
    final reclaimRequestBody = ReclaimRequestBody(pledgeId: pledge, currentPassword: password);
    final response = await basicPost(endpoint: "api/account/reclaimPledge", data: reclaimRequestBody.toJson());
    return BasicResponseBody.fromJson(response.data);
  }

  Future<BasicResponseBody> giftItem({required String pledge, required String password, required String email, String name = "避难所App用户"}) async {
    final giftPledgeRequestBody = GiftPledgeRequestBody(pledgeId: pledge, currentPassword: password, email: email, name: name);
    final response = await basicPost(endpoint: "api/account/giftPledge", data: giftPledgeRequestBody.toJson());
    return BasicResponseBody.fromJson(response.data);
  }

  Future<BasicResponseBody> recallGift({required String pledge}) async {
    final response = await basicPost(endpoint: "api/account/cancelGift", data: {"pledge_id": pledge});
    return BasicResponseBody.fromJson(response.data);
  }
}
