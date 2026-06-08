import 'dart:async';

import 'package:chopper/chopper.dart';

import 'generated/starcitizen_wiki.swagger.dart';

export 'generated/starcitizen_wiki.swagger.dart';

/// Star Citizen Wiki API 客户端封装。
///
/// 基于 OpenAPI 规范 `api/starcitizen_wiki.yaml` 由 swagger_dart_code_generator
/// 生成(产物在 `generated/`,勿手改;改 spec 后重跑 build_runner)。
///
/// 大多数端点公开无需鉴权;少数端点(如相似图片搜索)需要 Sanctum Bearer token,
/// 通过 [setBearerToken] 注入即可。
///
/// 用法与项目其它客户端(如 `CirnoApiClient()`)一致,单例:
/// ```dart
/// final res = await WikiApiClient().api.apiGameVersionsGet();
/// final versions = res.body;
/// ```
class WikiApiClient {
  static final WikiApiClient _instance = WikiApiClient._internal();

  factory WikiApiClient() => _instance;

  static const String baseUrl = 'https://api.star-citizen.wiki';

  /// 当前 Sanctum Bearer token(仅鉴权端点需要)。
  String? _bearerToken;

  late final StarcitizenWiki _api;

  /// 生成的强类型 Chopper service,直接调用其上的端点方法。
  StarcitizenWiki get api => _api;

  WikiApiClient._internal() {
    _api = StarcitizenWiki.create(
      baseUrl: Uri.parse(baseUrl),
      interceptors: [
        // 公共 header
        const HeadersInterceptor({
          'Accept': 'application/json',
          'User-Agent': 'RefugeNext/1.0.0',
        }),
        // 按需注入 Bearer token
        _BearerInterceptor(() => _bearerToken),
      ],
    );
  }

  /// 设置 Sanctum Bearer token(登录/获取后调用);传 null 清除。
  void setBearerToken(String? token) {
    _bearerToken = token;
  }
}

/// 当存在 token 时,为请求添加 `Authorization: Bearer <token>`。
class _BearerInterceptor implements Interceptor {
  _BearerInterceptor(this._tokenProvider);

  final String? Function() _tokenProvider;

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
    Chain<BodyType> chain,
  ) {
    final token = _tokenProvider();
    if (token == null || token.isEmpty) {
      return chain.proceed(chain.request);
    }
    final request = applyHeader(
      chain.request,
      'Authorization',
      'Bearer $token',
      override: false,
    );
    return chain.proceed(request);
  }
}
