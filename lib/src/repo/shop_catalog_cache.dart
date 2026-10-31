import '../datasource/models/shop/catalog_property.dart';

/// 商店目录 side-channel 缓存。
///
/// `CatalogProperty` 是 freezed 2.x 模型(禁止重生成),其 `nativePrice.discounted`
/// 与 `tags[].name` 字段虽被 GraphQL 拉取但解析时丢弃。这里在抓取目录时从原始
/// JSON 旁路取出这些字段,按商品 id 缓存,供卡片读取(不改动 freezed 模型)。
///
/// 刷新时覆盖；目录读写时将附加字段随商品一起恢复和保存。
class ShopCatalogCache {
  static final ShopCatalogCache _instance = ShopCatalogCache._internal();
  factory ShopCatalogCache() => _instance;
  ShopCatalogCache._internal();

  final Map<String, int> _discountedById = {};
  final Map<String, List<String>> _tagsById = {};

  /// 商品 id 对应的 `nativePrice.discounted`(分);无则返回 null。
  int? discountedFor(String id) => _discountedById[id];

  void putDiscounted(String id, int? value) {
    if (value == null) {
      _discountedById.remove(id);
    } else {
      _discountedById[id] = value;
    }
  }

  /// 商品 id 对应的 RSI 原生标签名列表;无则返回空列表。
  List<String> tagsFor(String id) => _tagsById[id] ?? const [];

  void putTags(String id, List<String> tags) {
    if (tags.isEmpty) {
      _tagsById.remove(id);
    } else {
      _tagsById[id] = tags;
    }
  }

  /// Shared by network responses and disk catalogs; absent values clear stale extras.
  void readItem(Map<dynamic, dynamic> item) {
    final id = item['id']?.toString();
    if (id == null) return;
    final native = item['nativePrice'];
    final discounted = native is Map ? native['discounted'] : null;
    putDiscounted(
        id,
        discounted is num &&
                discounted.isFinite &&
                discounted == discounted.roundToDouble()
            ? discounted.toInt()
            : null);
    final rawTags = item['tags'];
    putTags(
        id,
        rawTags is List
            ? rawTags
                .whereType<Map>()
                .map((tag) => tag['name'])
                .whereType<String>()
                .where((name) => name.isNotEmpty)
                .toSet()
                .toList()
            : []);
  }

  /// Keep the API shape so old catalogs and the generated model remain compatible.
  Map<String, dynamic> writeItem(CatalogProperty item) => {
        ...item.toJson(),
        'nativePrice': {
          ...item.nativePrice.toJson(),
          'discounted': discountedFor(item.id),
        },
        'tags': [
          for (final name in tagsFor(item.id)) {'name': name}
        ],
      };
}
