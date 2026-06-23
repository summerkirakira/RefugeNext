import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

/// 游戏内物品名翻译(打包资产 `assets/data/item_names.json`)。
///
/// 资产是扁平 map,key 形如 `item_Name{className}` 或 `item_Name_{className}`
/// (两种前缀混用),value 为中文名。查表大小写不敏感。
class GameItemTranslationRepo {
  static final GameItemTranslationRepo _instance =
      GameItemTranslationRepo._internal();
  GameItemTranslationRepo._internal();
  factory GameItemTranslationRepo() => _instance;

  /// 全小写 key → 中文名。
  final Map<String, String> _index = {};
  bool _loaded = false;

  /// 应用启动时调用:读取资产、建立大小写不敏感索引(只加载一次)。
  Future<void> load() async {
    if (_loaded) return;
    try {
      final raw = await rootBundle.loadString('assets/data/item_names.json');
      final map = jsonDecode(raw) as Map<String, dynamic>;
      _index.clear();
      map.forEach((k, v) {
        if (v is String && v.isNotEmpty) _index[k.toLowerCase()] = v;
      });
      _loaded = true;
    } catch (_) {
      // 资产缺失/解析失败:留空,getSync 回退英文原名
    }
  }

  /// 查表(大小写不敏感):先剥掉末尾 `_SCItem`(组件 class_name 常带,资产键不含),
  /// 再用 `item_Name{name}` 与 `item_Name_{name}` 两种前缀都试;未命中回退英文原名 [itemName]。
  String getSync(String itemName) {
    var n = itemName.toLowerCase();
    if (n.endsWith('_scitem')) n = n.substring(0, n.length - 7);
    return _index['item_name$n'] ?? _index['item_name_$n'] ?? itemName;
  }

  /// 商品/材料名翻译(资产键 `items_commodities_<lower_snake>`)。
  /// 规则:小写 → 去括号 → 空格转下划线 → 前缀;部分键带 `,P` 后缀,加 `,p` 回退;
  /// 未命中回退英文原名 [name]。
  String getCommodities(String name) {
    final n = name
        .toLowerCase()
        .replaceAll(RegExp(r'[()]'), '')
        .trim()
        .replaceAll(RegExp(r'\s+'), '_');
    final base = 'items_commodities_$n';
    return _index[base] ?? _index['$base,p'] ?? name;
  }
}
