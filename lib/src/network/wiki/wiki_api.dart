import 'package:dio/dio.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

import 'php_type_quirks.dart';

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

  /// 这些 JSON 字段按 spec 应为对象(map)或数值,但后端是 PHP,
  /// 空关联数组会被序列化成 `[]` 而非 `{}`,导致反序列化类型不匹配。
  /// 响应拦截器把这些字段上的空数组归一化为 null。
  static const Set<String> _phpEmptyArrayObjectKeys = {
    'acceleration',
    'armor',
    'em_groups_quantum',
    'em_groups_shields',
    'em_segment_groups_quantum',
    'em_segment_groups_shields',
    'used_segments_shields_grouped',
    'used_segments_quantum_grouped',
    'used_segments_grouped',
  };

  /// 递归归一化 PHP 后端的类型怪癖,在反序列化前把「错类型」的值修正到模型期望类型:
  /// 1. [_phpEmptyArrayObjectKeys] 中字段的值若为空数组 → null
  ///    (空关联数组被序列化成 [] 而非 {});
  /// 2. `penetration_multiplier.components`(数值字段)若为空数组 → null
  ///    (`components` 在别处是合法数组,故按父字段限定作用域);
  /// 3. 按 [phpBoolKeys]/[phpStringKeys]/[phpNumKeys](`php_type_quirks.dart`,
  ///    由 `tool/gen_php_type_quirks.sh` 从模型字段声明生成)把值统一到期望类型:
  ///    - 期望 bool:0/1 整数、"0"/"1"/"true" 字符串 → bool;
  ///    - 期望 String:数值/布尔 → toString(覆盖原 `grade` 数字→字符串);
  ///    - 期望数值:字符串 → num、布尔 → 1/0(覆盖原 `register_range`)。
  ///    这三个集合各自类型唯一、互不重叠且已剔除歧义键,故按键名归一化是安全的。
  static void normalizePhpEmptyArrays(Object? node, {String? parentKey}) {
    if (node is Map) {
      for (final key in node.keys.toList()) {
        final value = node[key];
        if (value is List && value.isEmpty) {
          if (_phpEmptyArrayObjectKeys.contains(key) ||
              (key == 'components' && parentKey == 'penetration_multiplier')) {
            node[key] = null;
            continue;
          }
        }
        if (phpBoolKeys.contains(key)) {
          if (value is num) {
            node[key] = value != 0;
            continue;
          }
          if (value is String) {
            final v = value.trim().toLowerCase();
            node[key] = v == '1' || v == 'true' || v == 'yes';
            continue;
          }
        } else if (phpStringKeys.contains(key)) {
          if (value is num || value is bool) {
            node[key] = value.toString();
            continue;
          }
        } else if (phpNumKeys.contains(key)) {
          if (value is String) {
            node[key] = num.tryParse(value.trim());
            continue;
          }
          if (value is bool) {
            node[key] = value ? 1 : 0;
            continue;
          }
        }
        normalizePhpEmptyArrays(value, parentKey: key is String ? key : null);
      }
    } else if (node is List) {
      for (final item in node) {
        normalizePhpEmptyArrays(item, parentKey: parentKey);
      }
    }
  }

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
          onResponse: (response, handler) {
            // dio 已把 JSON 解码为 Map/List,在反序列化前归一化空数组怪癖
            normalizePhpEmptyArrays(response.data);
            handler.next(response);
          },
        ),
      ],
    );
  }

  /// 设置 Sanctum Bearer token(登录/获取后调用);传 null 清除。
  void setBearerToken(String? token) {
    _bearerToken = token;
  }

  /// 获取当前默认游戏版本码(如 `4.2`);请求失败返回 null。
  ///
  /// 即版本敏感端点未传 `version` 参数时服务端使用的默认版本,
  /// 各版本化仓库(Ship Matrix / GameVehicle 等)用它做更新检测。
  Future<String?> getDefaultGameVersionCode() async {
    try {
      final res = await _api.getGameVersionsApi().getDefaultGameVersion();
      return res.data?.data?.code;
    } catch (e) {
      return null;
    }
  }
}
