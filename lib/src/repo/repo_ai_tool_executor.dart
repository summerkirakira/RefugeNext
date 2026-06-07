import '../datasource/data_model.dart';
import '../datasource/models/hangar.dart';
import '../funcs/search.dart';
import 'ai_chat.dart';

/// 端侧工具的真实实现：把工具名映射到本地 repo / MainDataModel，
/// 让服务端能查询用户本地缓存的库存/账号数据。
/// 工具契约见 planning/docs/ai_module_contract.md §4。第一批：只读库存类 4 个工具。
class RepoAiToolExecutor implements AiToolExecutor {
  final MainDataModel _model;

  RepoAiToolExecutor(this._model);

  static const List<String> _names = [
    'get_hangar',
    'get_user_ships',
    'get_user_info',
    'get_buyback',
    'show_hangar_cards',
    'show_buyback_cards',
  ];

  @override
  List<String> get allowedToolNames => _names;

  @override
  Future<Map<String, dynamic>> runTool(
    String name,
    Map<String, dynamic> arguments,
  ) async {
    try {
      switch (name) {
        case 'get_hangar':
          return shapeHangarItems(_model.rawHangarItems, arguments);
        case 'get_user_ships':
          return shapeUserShips(_model.rawHangarItems);
        case 'get_user_info':
          return await _getUserInfo();
        case 'get_buyback':
          return await _getBuyback(arguments);
        case 'show_hangar_cards':
          return _showHangarCards(arguments);
        case 'show_buyback_cards':
          return _showBuybackCards(arguments);
        default:
          return {'is_error': true, 'error': 'tool not allowed: $name'};
      }
    } catch (e) {
      return {'is_error': true, 'error': '$e'};
    }
  }

  /// 让客户端内联展示机库卡片：仅校验 ids 并 ack；真正渲染由 UI 从 transcript 读取 tool_calls 完成。
  Map<String, dynamic> _showHangarCards(Map<String, dynamic> args) {
    final raw = (args['ids'] is List) ? args['ids'] as List : const [];
    final shown = <int>[];
    final missing = <int>[];
    for (final e in raw) {
      final id = _asInt(e, -1);
      if (id >= 0 && _model.getHangarItemById(id) != null) {
        shown.add(id);
      } else {
        missing.add(id);
      }
    }
    return {'ok': true, 'shown': shown, 'missing': missing};
  }

  /// 让客户端内联展示回购卡片：仅校验 ids 并 ack；渲染由 UI 从 transcript 读取。
  Map<String, dynamic> _showBuybackCards(Map<String, dynamic> args) {
    final raw = (args['ids'] is List) ? args['ids'] as List : const [];
    final shown = <int>[];
    final missing = <int>[];
    for (final e in raw) {
      final id = _asInt(e, -1);
      if (id >= 0 && _model.getBuybackItemById(id) != null) {
        shown.add(id);
      } else {
        missing.add(id);
      }
    }
    return {'ok': true, 'shown': shown, 'missing': missing};
  }

  Future<Map<String, dynamic>> _getUserInfo() async {
    final user = await _model.userRepo.getCurrentUser();
    if (user == null) return {'isVIP': _model.isVIP};
    // 暴露除敏感字段外的全部 User 信息（toJson 自动覆盖未来新增字段）。
    final info = user.toJson();
    info.remove('password'); // 密码
    info.remove('email'); // 邮箱
    info.remove('rsiToken'); // RSI 登录凭证，发给云端 LLM 即泄露，安全起见排除
    info['isVIP'] = _model.isVIP;
    return info;
  }

  Future<Map<String, dynamic>> _getBuyback(Map<String, dynamic> args) async {
    final limit = _asInt(args['limit'], 100);
    final items = await _model.buybackRepo.readBuybackItems();
    final shaped = items.take(limit < 0 ? 0 : limit).map((b) {
      final cn = b.chinesName;
      return {
        'id': b.id,
        'name': (cn != null && cn.isNotEmpty) ? cn : b.title,
        'qty': b.number,
      };
    }).toList();
    return {'total': items.length, 'items': shaped};
  }
}

// ---------------------------------------------------------------------------
// 纯函数（顶层，便于单测，不依赖 MainDataModel）
// ---------------------------------------------------------------------------

int _asInt(Object? v, int fallback) {
  if (v is int) return v;
  if (v is num) return v.toInt();
  if (v is String) return int.tryParse(v) ?? fallback;
  return fallback;
}

String _displayName(HangarItem item) {
  final cn = item.chineseName;
  return (cn != null && cn.isNotEmpty) ? cn : item.name;
}

String _subName(HangarSubItem s) {
  final cn = s.chineseTitle;
  return (cn != null && cn.isNotEmpty) ? cn : s.title;
}

int _displayPrice(HangarItem item) =>
    item.currentPrice > 0 ? item.currentPrice : item.price;

/// 机库 item 的精简类型：upgrade / ship / paint / other。
String hangarItemType(HangarItem item) {
  if (item.isUpgrade) return 'upgrade';
  for (final sub in item.items) {
    if (sub.kind == 'Ship') return 'ship';
  }
  for (final sub in item.items) {
    if (sub.kind == 'Paint') return 'paint';
  }
  return 'other';
}

/// null 安全的关键字匹配（不复用 search.dart 的 isContainSearchKey——它对中文字段强解包，翻译关闭会 NPE）。
/// 匹配 name / chineseName / alsoContains / chineseAlsoContains 以及子项 title / chineseTitle。
bool matchesHangarKeyword(HangarItem item, String key) {
  final k = key.toLowerCase().trim();
  if (k.isEmpty) return true;
  bool hit(String? s) => s != null && s.toLowerCase().contains(k);
  if (hit(item.name) ||
      hit(item.chineseName) ||
      hit(item.alsoContains) ||
      hit(item.chineseAlsoContains)) {
    return true;
  }
  for (final sub in item.items) {
    if (hit(sub.title) || hit(sub.chineseTitle)) return true;
  }
  return false;
}

/// get_hangar 的精简结果。type 过滤复用 search.dart 的 isSearchedType（null 安全）。
Map<String, dynamic> shapeHangarItems(
  List<HangarItem> items,
  Map<String, dynamic> args,
) {
  final type = args['type'] as String?;
  final filter = args['filter'] as String?;
  final limit = _asInt(args['limit'], 20);
  final offset = _asInt(args['offset'], 0);

  var list = items;
  if (type != null && type.isNotEmpty && type != 'all') {
    list = list.where((i) => isSearchedType(i, [type])).toList();
  }
  if (filter != null && filter.trim().isNotEmpty) {
    list = list.where((i) => matchesHangarKeyword(i, filter)).toList();
  }

  final total = list.length;
  final page = list
      .skip(offset < 0 ? 0 : offset)
      .take(limit < 0 ? 0 : limit)
      .map((i) {
        // 额外内容（# 分隔），优先中文，回退英文。
        final extras = (i.chineseAlsoContains ?? i.alsoContains)
            .split('#')
            .map((e) => e.trim())
            .where((e) => e.isNotEmpty)
            .toList();
        return {
          'id': i.id,
          'name': _displayName(i),
          'type': hangarItemType(i),
          'qty': i.number,
          'price': _displayPrice(i),
          // 包内容：结构化子项（船/涂装等）
          'contents': i.items
              .map((s) => {'name': _subName(s), 'kind': s.kind})
              .toList(),
          if (extras.isNotEmpty) 'alsoContains': extras,
        };
      })
      .toList();

  return {'total': total, 'items': page};
}

/// get_user_ships：取实际拥有的船（subitem.kind=="Ship"），按显示名聚合数量。
Map<String, dynamic> shapeUserShips(List<HangarItem> items) {
  final counts = <String, int>{};
  for (final i in items) {
    if (!isSearchedType(i, ['ship'])) continue;
    final name = _displayName(i);
    counts[name] = (counts[name] ?? 0) + i.number;
  }
  final ships = counts.entries
      .map((e) => {'name': e.key, 'count': e.value})
      .toList();
  return {'ships': ships};
}
