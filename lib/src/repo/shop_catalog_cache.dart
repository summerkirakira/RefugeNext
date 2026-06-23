/// 商店目录 side-channel 缓存。
///
/// `CatalogProperty` 是 freezed 2.x 模型(禁止重生成),其 `nativePrice.discounted`
/// 与 `tags[].name` 字段虽被 GraphQL 拉取但解析时丢弃。这里在抓取目录时从原始
/// JSON 旁路取出这些字段,按商品 id 缓存,供卡片读取(不改动 freezed 模型)。
///
/// 缓存值与同一次抓取同步;切换币种/刷新会重新抓取并覆盖。
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
}
