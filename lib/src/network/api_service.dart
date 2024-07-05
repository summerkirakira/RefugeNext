import 'package:dio/dio.dart';
import 'utils.dart';

class RsiApiClient {
  static final RsiApiClient _instance = RsiApiClient._internal();
  late final Dio _dio;

  String rsiDevice = "xyki5iqw0wyj6tnoyqpgpfuqn7";
  String rsiToken = "19e21962f042165295b670cc84fb8f4f";
  String xsrfToken = "";
  String rsiCookieContent = "{stamp:%27OxTvKGMly/MLoYR3VVQb40QHQbh68uSc2ORKIfKGhLQyPGB71fbjEA==%27%2Cnecessary:true%2Cpreferences:false%2Cstatistics:false%2Cmarketing:true%2Cmethod:%27explicit%27%2Cver:1%2Cutc:1698762520261%2Cregion:%27gb%27}; _ga=GA1.2.789579038.1698763289; wsc_view_count=1; wsc_hide=true;";

  String baseUrl = "https://robertsspaceindustries.com/";



  String get rsiCookie => "CookieConsent=$rsiCookieContent;_rsi_device=$rsiDevice;Rsi-Token=$rsiToken";

  factory RsiApiClient() => _instance;
  RsiApiClient._internal() {
    _dio = Dio();
  }

  void setRSIDevice({required String device}) {
    rsiDevice = device;
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
    "x-rsi-token": xsrfToken,
    "x-rsi-device": rsiDevice,
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3",
    "Referer": "https://robertsspaceindustries.com/",
    "X-Csrf-Token": xsrfToken,
  };


  Future<Response> basicGet({required String endpoint}) async {
    final response = await _dio.get("$baseUrl$endpoint", options: Options(headers: basicHeaders));
    return response;
  }


}
