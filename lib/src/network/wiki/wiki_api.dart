import 'package:dio/dio.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

export 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

/// Star Citizen Wiki API 客户端封装。
///
/// 基于 OpenAPI 规范 `api/starcitizen_wiki.yaml`,由 openapi-generator
/// (dart-dio + json_serializable)生成,产物为独立包 `starcitizen_wiki_api`
/// (位于 `packages/starcitizen_wiki_api`,勿手改;改 spec 后运行
/// `./tool/regen_wiki_api.sh` 重新生成)。
///
/// 大多数端点公开无需鉴权;少数端点(如相似图片搜索)需要 Sanctum Bearer token,
/// 通过 [setBearerToken] 注入即可。
///
/// 用法与项目其它客户端(如 `CirnoApiClient()`)一致,单例:
/// ```dart
/// final res = await WikiApiClient().api.getGameVersionsApi().listGameVersions();
/// final versions = res.data?.data;
/// ```
class WikiApiClient {
  static final WikiApiClient _instance = WikiApiClient._internal();

  factory WikiApiClient() => _instance;

  static const String baseUrl = 'https://api.star-citizen.wiki';

  /// 当前 Sanctum Bearer token(仅鉴权端点需要)。
  String? _bearerToken;

  late final StarcitizenWikiApi _api;

  /// 生成的强类型 Dio 客户端,通过其上的 `getXxxApi()` 获取各分组端点。
  StarcitizenWikiApi get api => _api;

  WikiApiClient._internal() {
    _api = StarcitizenWikiApi(
      basePathOverride: baseUrl,
      interceptors: [
        InterceptorsWrapper(
          onRequest: (options, handler) {
            options.headers['Accept'] = 'application/json';
            options.headers['User-Agent'] = 'RefugeNext/1.0.0';
            final token = _bearerToken;
            if (token != null && token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
            }
            handler.next(options);
          },
        ),
      ],
    );
  }

  /// 设置 Sanctum Bearer token(登录/获取后调用);传 null 清除。
  void setBearerToken(String? token) {
    _bearerToken = token;
  }
}
