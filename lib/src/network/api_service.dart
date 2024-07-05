import 'package:dio/dio.dart';
import 'utils.dart';

class RsiApiClient {
  static final RsiApiClient _instance = RsiApiClient._internal();
  late final Dio _dio;

  String rsiDevice = "";
  String rsiToken = "";
  String xsrfToken = "";
  String rsiCookieContent = "";

  String baseUrl = "https://robertsspaceindustries.com/";



  String get rsiCookie => "CookieConsent=$rsiCookieContent;_rsi_device=$rsiDevice;Rsi-Token=$rsiToken";

  factory RsiApiClient() => _instance;
  RsiApiClient._internal() {
    _dio = Dio();
  }

  void setRSIDevice(String device) {
    rsiDevice = device;
  }

  void setRSIToken(String token) {
    rsiToken = token;
  }

  Future<void> refreshCsrfToken() async {
    final response = await _dio.get(baseUrl);
    final csrfToken = extractCsrfToken(response.data);
    if (csrfToken == null) {
      throw Exception("Failed to extract CSRF token");
    }
    xsrfToken = csrfToken;
  }


  Map<String, String> get basicHeaders => {
    "Cookie": rsiCookie,
    "x-rsi-token": xsrfToken,
    "x-rsi-device": rsiDevice,
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3",
    "Referer": "https://robertsspaceindustries.com/",
    "X-Csrf-Token": xsrfToken,
  };


  Future<Response> get(String endpoint) async {
    final response = await _dio.get("$baseUrl$endpoint", options: Options(headers: basicHeaders));
    return response;
  }


}
