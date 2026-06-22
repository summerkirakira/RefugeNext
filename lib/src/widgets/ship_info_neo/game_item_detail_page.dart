import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/blueprint.dart';
import 'package:refuge_next/src/repo/translation.dart';
import 'package:refuge_next/src/widgets/ship_info/ship_info_menu.dart';
import 'package:refuge_next/src/widgets/ship_info/ship_info_title.dart'
    show ShipPriceDisplay;

// 通用样式常量(仿 vehicle_detail_page)。
const kItemValueStyle = TextStyle(fontSize: 13);
const kItemValueStyleBold =
    TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

/// 某物品类型独有「参数」页的规格:页签标题 + 卡片构造器。
///
/// 通用 [GameItemDetailPage] 只负责头部与 总览/系统/购买 三页;
/// 「参数」页由各物品类型(护盾、冷却器、电厂…)通过本规格注入,
/// 卡片用本文件顶层 helper(`itemCard`/`itemRow`/`fmtNum`…)构造即可。
class GameItemParamSpec {
  const GameItemParamSpec({required this.tabTitle, required this.buildCards});

  /// 横向菜单上该页的标题(护盾用「参数」)。
  final String tabTitle;

  /// 构造该物品类型独有的卡片列表(无需自加间距)。
  final List<Widget> Function(GameItem item) buildCards;
}

/// 通用 GameItem 详情页:头部 + 4 个横向页签(总览 / <参数> / 系统 / 购买)。
///
/// 总览(信息/物理属性/技术信息)、系统(资源网络/信号)、购买(游戏内购买)对任意
/// `GameItem` 通用;「参数」页由 [paramSpec] 按物品类型注入。仿 [VehicleDetailPage]
/// 的头部与卡片样式。仅作开发调试用。
class GameItemDetailPage extends StatefulWidget {
  const GameItemDetailPage({
    super.key,
    required this.loadItems,
    required this.paramSpec,
    this.initialItem,
    this.allowSwitch = true,
    this.title = '物品详情',
    this.fallbackIcon = Icons.widgets_outlined,
    this.extraTabs = const [],
    this.showSystemTab = true,
    this.fullDescriptionData = false,
    this.descriptionLastLine = false,
    this.enrichSelected,
  });

  /// 拉取本地物品列表(如 `ShieldRepo().getShields`)。
  final Future<List<GameItem>> Function() loadItems;

  /// 「参数」页规格(物品类型独有)。
  final GameItemParamSpec paramSpec;

  /// 指定展示的物品;为 null 时取列表第一条。
  final GameItem? initialItem;

  /// 是否显示「切换物品」按钮。
  final bool allowSwitch;

  /// AppBar / 空态标题。
  final String title;

  /// 题图加载失败时的占位图标。
  final IconData fallbackIcon;

  /// 主「参数」页之后追加的额外页签(如 FPS 武器的「弹药」「配件」)。
  final List<GameItemParamSpec> extraTabs;

  /// 是否显示「系统」页签(资源网络/信号)。
  final bool showSystemTab;

  /// 「总览」首卡用全量描述数据(所有 descriptionData 键值)还是精简「信息」卡
  /// (类别/等级/尺寸)。
  final bool fullDescriptionData;

  /// 头部简介取值方式:
  /// - false(默认):去掉前 5 行元数据后的正文(组件类用);
  /// - true:去掉首尾空白/换行后的**最后一行**(FPS 武器类用)。
  final bool descriptionLastLine;

  /// 可选:选中物品后异步补拉并写回详情(如 FPS 武器补拉含已装配件的 ports)。
  /// 返回更新后的物品则替换当前展示;为 null 表示不补拉(默认)。
  final Future<GameItem?> Function(GameItem item)? enrichSelected;

  @override
  State<GameItemDetailPage> createState() => _GameItemDetailPageState();
}

class _GameItemDetailPageState extends State<GameItemDetailPage> {
  List<GameItem> _all = [];
  GameItem? _selected;
  bool _loading = true;

  /// 蓝图详情缓存(按蓝图 uuid):列表端点不含 unlockingMissions,
  /// 按需补拉详情后缓存,供「蓝图」页签展示解锁任务。
  final Map<String, Blueprint> _bpDetailCache = {};
  final Set<String> _bpFetching = {};

  /// 已尝试补拉详情(enrichSelected)的物品 uuid(本会话去重)。
  final Set<String> _enrichFetched = {};

  @override
  void initState() {
    super.initState();
    Future.wait([
      widget.loadItems(),
      TranslationRepo().getTranslations(),
      // 预载蓝图缓存(读本地,供「蓝图」页签按 outputItemUuid 关联;未下载则空)
      BlueprintRepo().getBlueprints(),
    ]).then((results) {
      if (!mounted) return;
      final items = results[0] as List<GameItem>;
      setState(() {
        _all = items;
        _selected = widget.initialItem ??
            (items.isNotEmpty ? items.first : null);
        _loading = false;
      });
      _enrichSelectedBlueprint();
      _enrichSelectedItem();
    });
  }

  /// 选中物品后异步补拉详情(若提供 [GameItemDetailPage.enrichSelected]),
  /// 返回更新后的物品则替换当前展示与列表。本会话按 uuid 去重。
  void _enrichSelectedItem() {
    final enrich = widget.enrichSelected;
    final uuid = _selected?.uuid;
    if (enrich == null || uuid == null) return;
    if (_enrichFetched.contains(uuid)) return;
    _enrichFetched.add(uuid);
    enrich(_selected!).then((updated) {
      if (!mounted || updated == null) return;
      setState(() {
        final i = _all.indexWhere((e) => e.uuid == uuid);
        if (i >= 0) _all[i] = updated;
        if (_selected?.uuid == uuid) _selected = updated;
      });
    });
  }

  /// 当前选中物品若有对应蓝图且含解锁任务(列表数据未带),按需补拉蓝图详情并缓存。
  void _enrichSelectedBlueprint() {
    final uuid = _selected?.uuid;
    if (uuid == null) return;
    final base = BlueprintRepo().findByOutputItemUuidSync(uuid);
    final id = base?.uuid;
    if (base == null || id == null) return;
    if ((base.unlockingMissionsCount ?? 0) <= 0) return; // 无解锁任务,无需拉详情
    if ((base.unlockingMissions ?? const []).isNotEmpty) return; // 已自带
    if (_bpDetailCache.containsKey(id) || _bpFetching.contains(id)) return;
    _bpFetching.add(id);
    BlueprintRepo().fetchDetail(id).then((detail) {
      if (!mounted) return;
      _bpFetching.remove(id);
      if (detail != null) {
        setState(() => _bpDetailCache[id] = detail);
      }
    });
  }

  /// 「蓝图」页签:按 item.uuid 关联蓝图;命中则用(已补拉的)详情构造卡片,
  /// 未命中显示占位提示。
  List<Widget> _buildBlueprintTab(GameItem item) {
    final uuid = item.uuid;
    final base =
        uuid == null ? null : BlueprintRepo().findByOutputItemUuidSync(uuid);
    if (base == null) {
      return const [
        Padding(
          padding: EdgeInsets.only(top: 24),
          child: Center(
            child: Text(
              '未找到该物品对应的蓝图\n(需先在 Blueprint 测试页拉取蓝图数据)',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ];
    }
    // 优先用补拉的详情(含解锁任务),否则用列表数据。
    final id = base.uuid;
    final bp = (id != null ? _bpDetailCache[id] : null) ?? base;
    return blueprintCards(bp);
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    final selected = _selected;
    if (selected == null) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: const Center(child: Text('本地暂无数据,请先拉取')),
      );
    }
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(child: _buildTitle(selected)),
          ],
          body: Column(
            children: [
              _buildMenu(selected),
            ],
          ),
        ),
      ),
    );
  }

  /// 动态拼装横向页签:总览 → 参数 → …extraTabs… → (系统?) → 蓝图 → 购买。
  Widget _buildMenu(GameItem selected) {
    final titles = <String>['总览', widget.paramSpec.tabTitle];
    final children = <Widget>[
      _tabPage(buildOverviewCards(selected,
          fullDescriptionData: widget.fullDescriptionData)),
      _tabPage(widget.paramSpec.buildCards(selected)),
    ];
    for (final spec in widget.extraTabs) {
      titles.add(spec.tabTitle);
      children.add(_tabPage(spec.buildCards(selected)));
    }
    if (widget.showSystemTab) {
      titles.add('系统');
      children.add(_tabPage(buildSystemCards(selected)));
    }
    titles
      ..add('蓝图')
      ..add('购买');
    children
      ..add(_tabPage(_buildBlueprintTab(selected)))
      ..add(_tabPage(buildPurchaseCards(selected)));
    return ShipInfoMenu(
      barWidth: titles.length * 68.0, // 每 2 字页签约 68;5 页签→340,6→408
      titles: titles,
      children: children,
    );
  }

  /// 页签内容:每张卡之间留 12 间距,套外层滚动(与 NestedScrollView 联动)。
  Widget _tabPage(List<Widget> cards) {
    return SingleChildScrollView(
      primary: true,
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: cards
              .map((c) =>
                  Padding(padding: const EdgeInsets.only(top: 12), child: c))
              .toList(),
        ),
      ),
    );
  }

  // ============ 头部(仿 vehicle_detail_page) ============

  String? _headerImage(GameItem item) {
    final images = item.images;
    if (images == null || images.isEmpty) return null;
    final first = images.first;
    return first.originalUrl ?? first.thumbnailUrl;
  }

  Widget _buildTitle(GameItem item) {
    final thumbUrl = _headerImage(item);
    final tags = <String>[
      if ((item.typeLabel ?? item.type) != null) (item.typeLabel ?? item.type)!,
      if (item.grade != null) 'Grade ${item.grade}',
      if (item.size != null) 'Size ${item.size}',
    ];

    // aUEC:取 UEX 各终端最高购买价。
    int? auec;
    final purchases = item.uexPrices?.purchase;
    if (purchases != null) {
      for (final p in purchases) {
        final buy = p.priceBuy;
        if (buy != null && (auec == null || buy > auec)) {
          auec = buy.toInt();
        }
      }
    }

    return Container(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final narrow = constraints.maxWidth < 500;
              if (narrow) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (thumbUrl != null) ...[
                      _titleImage(thumbUrl,
                          aspectRatio: 16 / 9, showBack: true),
                      const SizedBox(height: 12),
                    ],
                    _titleInfo(item, tags, auec),
                  ],
                );
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (thumbUrl != null) ...[
                    Expanded(
                      flex: 9,
                      child: _titleImage(thumbUrl,
                          aspectRatio: 3 / 2, showBack: true),
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    flex: 11,
                    child: _titleInfo(item, tags, auec),
                  ),
                ],
              );
            },
          ),
          if (thumbUrl == null)
            Positioned(top: 0, left: 0, child: _backButton()),
        ],
      ),
    );
  }

  Widget _backButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.4),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        iconSize: 20,
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget _titleImage(String url,
      {required double aspectRatio, bool showBack = false}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover,
              placeholder: (context, _) =>
                  Container(color: Colors.black12),
              errorWidget: (context, _, __) => Container(
                color: Colors.black12,
                child: Icon(widget.fallbackIcon,
                    size: 48, color: Colors.white54),
              ),
            ),
            if (showBack)
              Positioned(top: 8, left: 8, child: _backButton()),
          ],
        ),
      ),
    );
  }

  Widget _titleInfo(GameItem item, List<String> tags, int? auec) {
    // 简介前 5 行是制造商/类型等元数据(已在描述数据里),过滤掉只留正文。
    final rawDesc = item.description?.zhCN ?? item.description?.enEN;
    final String? desc;
    if (rawDesc == null) {
      desc = null;
    } else if (widget.descriptionLastLine) {
      // 去掉首尾空白/换行后取最后一行(FPS 武器:正文在末行)
      desc = rawDesc.trim().split('\n').last.trim();
    } else {
      // 去掉前 5 行元数据后的正文(组件类)
      desc = rawDesc.split('\n').skip(5).join('\n').trim();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name ?? item.className ?? '未知',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          item.manufacturer?.name ?? '',
                          style: const TextStyle(
                              fontSize: 14, color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (widget.allowSwitch && _all.isNotEmpty)
                        SizedBox(
                          width: 32,
                          height: 32,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            iconSize: 20,
                            icon: const Icon(Icons.swap_horiz),
                            onPressed: () => _showItemSelector(context),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            if (auec != null)
              FittedBox(
                fit: BoxFit.scaleDown,
                child: ShipPriceDisplay(auecPrice: auec),
              ),
          ],
        ),
        if (tags.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Wrap(
              spacing: 6,
              runSpacing: 4,
              children: tags
                  .map((t) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade50,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          t,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.orange.shade700,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        if (desc != null && desc.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              desc,
              style: TextStyle(
                fontSize: 14,
                height: 1.4,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
    );
  }

  // ============ 切换物品 modal ============

  void _showItemSelector(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        var filtered = List<GameItem>.of(_all);
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.7,
              maxChildSize: 0.95,
              builder: (context, scrollController) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: TextField(
                        autofocus: false,
                        decoration: const InputDecoration(
                          hintText: '搜索名称 / Class Name',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(),
                          isDense: true,
                        ),
                        onChanged: (value) {
                          final lower = value.toLowerCase();
                          setSheetState(() {
                            filtered = _all.where((s) {
                              return (s.name?.toLowerCase().contains(lower) ??
                                      false) ||
                                  (s.className?.toLowerCase().contains(lower) ??
                                      false);
                            }).toList();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: filtered.length,
                        itemBuilder: (context, index) {
                          final s = filtered[index];
                          return ListTile(
                            dense: true,
                            title: Text(s.name ?? s.className ?? '未知'),
                            subtitle: Text(
                              '${s.manufacturer?.name ?? ''} · '
                              'S${s.size ?? '-'} · '
                              '${s.typeLabel ?? s.type ?? ''}',
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                              setState(() => _selected = s);
                              _enrichSelectedBlueprint();
                              _enrichSelectedItem();
                            },
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}

// ============ 通用页签构造(顶层纯函数) ============

/// descriptionData 英文键 → 中文(全量「信息」卡用)。未命中的键保持原英文。
const Map<String, String> kDescDataKeyCn = {
  'Attachments': '配件',
  'Attachment Point': '挂载点',
  'Magnification': '倍率',
  'Type': '类型',
  'Class': '类别',
  'Effective Range': '有效射程',
  'Item Type': '物品类型',
  'Magazine Size': '弹匣容量',
  'Manufacturer': '制造商',
  'Rate Of Fire': '射速',
  'Damage': '伤害',
  'Ammo': '弹药',
  'Fire Modes': '射击模式',
  'Fire Mode': '射击模式',
  'Size': '尺寸',
  'Grade': '等级',
  'Capacity': '容量',
  'Weight': '重量',
  'Battery Size': '电池尺寸',
  'Area of Effect': '作用范围',
  'Damage Type': '伤害类型',
};

/// descriptionData 中「Item Type」/「Type」的值 → 中文。未命中保持原英文。
/// (由 personal_weapons / weapon_attachments 本地数据统计而来。)
const Map<String, String> kItemTypeValueCn = {
  // —— 武器(Item Type)——
  'Assault Rifle': '突击步枪',
  'Crossbow': '弩',
  'Fire Extinguisher': '灭火器',
  'Frag Pistol': '破片手枪',
  'Grenade': '手榴弹',
  'Grenade Launcher': '榴弹发射器',
  'Knife': '近战刀',
  'LMG': '轻机枪',
  'Launcher': '发射器',
  'Medical Device': '医疗设备',
  'Missile Launcher': '导弹发射器',
  'Pistol': '手枪',
  'Railgun': '电磁炮',
  'SMG': '冲锋枪',
  'Shotgun': '霰弹枪',
  'Sniper Rifle': '狙击步枪',
  'Toy Pistol': '玩具手枪',
  'Tractor Beam': '牵引光束',
  'Utility': '多功能',
  'Multi-Tool Attachment': '多功能工具配件',
  // —— 配件(Type)——
  'Ballistic Compensator': '弹道补偿器',
  'Compensator': '补偿器',
  'Energy Stabilizer': '能量稳定器',
  'Flash Hider': '消焰器',
  'Flashlight': '手电',
  'Holographic': '全息瞄具',
  'Laser Pointer': '激光指示器',
  'Monitor': '监视瞄具',
  'Projection': '投影瞄具',
  'Red Dot': '红点瞄具',
  'Reflex': '反射瞄具',
  'Suppressor': '消音器',
  'Telescopic': '望远瞄具',
};

/// descriptionData 中「Class」的值 → 中文(武器/配件类别)。未命中保持原英文。
const Map<String, String> kItemClassValueCn = {
  // —— 武器类别 ——
  'Ballistic': '实弹',
  'Laser': '激光',
  'Electron': '电子',
  'Energy (Electron)': '能量(电子)',
  'Energy (Laser)': '能量(激光)',
  'Energy (Plasma)': '能量(等离子)',
  'Rocket': '火箭',
  'Melee': '近战',
  'Gadget': '器具',
  'Foam Dart': '泡棉软胶弹',
  // —— 配件类别 ——
  'Cutter': '切割器',
  'Medical': '医疗',
  'Mining': '采矿',
  'Salvage and Repair': '回收维修',
  'Tractor Beam': '牵引光束',
};

/// 武器射击模式(`personalWeapon.fireMode`)→ 中文。未命中保持原英文。
const Map<String, String> kFireModeCn = {
  'Single': '单发',
  'Burst': '点射',
  'Rapid': '速射',
  'Charge': '蓄力',
  'Shotgun': '霰弹',
  'Damage Beam': '伤害光束',
  'Heal': '治疗',
  'Salvage': '回收',
  'Detach': '投掷',
};

/// 挂点/槽位名 → 中文(用于「Attachment Point」单值与「Attachments」串解析)。未命中保持原英文。
const Map<String, String> kPortSlotCn = {
  'Optic': '瞄具',
  'Optics': '瞄具',
  'Barrel': '枪管',
  'Underbarrel': '下挂',
  'Magazine': '弹匣',
};

/// 解析武器 descriptionData 的「Attachments」串:
/// "Optics (S3), Barrel (S2)" → "瞄具 (S3), 枪管 (S2)";整值 N/A → "无"。
String _attachmentsCn(String value) {
  final v = value.trim();
  if (v.isEmpty || v.toUpperCase() == 'N/A' || v.toUpperCase() == 'NA') {
    return '无';
  }
  final out = <String>[];
  for (final raw in v.split(',')) {
    final p = raw.trim();
    if (p.isEmpty) continue;
    final m = RegExp(r'^(.*?)\s*\((.*)\)\s*$').firstMatch(p);
    if (m != null) {
      final nameCn = kPortSlotCn[m.group(1)!.trim()] ?? m.group(1)!.trim();
      final s = m.group(2)!.trim();
      final sizeCn = (s.toUpperCase() == 'N/A' || s.toUpperCase() == 'NA') ? '-' : s;
      out.add('$nameCn ($sizeCn)');
    } else {
      out.add(kPortSlotCn[p] ?? p);
    }
  }
  return out.join(', ');
}

/// descriptionData 某条目的值按其键名做中文化(类型 / 挂载点 / 配件);其余原样返回。
String? descDataValueCn(String? name, String? value) {
  if (value == null) return null;
  if (name == 'Item Type' || name == 'Type') {
    return kItemTypeValueCn[value] ?? value;
  }
  if (name == 'Class') {
    return kItemClassValueCn[value] ?? value;
  }
  if (name == 'Attachment Point') {
    return kPortSlotCn[value] ?? value;
  }
  if (name == 'Attachments') {
    return _attachmentsCn(value);
  }
  return value;
}

/// 总览:信息 · 物理属性 · 技术信息。
///
/// [fullDescriptionData] 为 true 时「信息」卡列出全部 descriptionData 键值
/// (键名经 [kDescDataKeyCn] 中文化,未命中保持原英文);否则只取 类别/等级/尺寸 三项。
List<Widget> buildOverviewCards(GameItem item,
    {bool fullDescriptionData = false}) {
  final dim = item.dimension;
  return [
    // Info
    if (fullDescriptionData)
      itemCard('信息', itemRows([
        for (final d in item.descriptionData ?? const <ItemDescriptionData>[])
          itemSmallRow(
            kDescDataKeyCn[d.name] ?? d.name ?? '-',
            // 类型 / 挂载点等的值按键名再中文化(未命中保持原值)。
            descDataValueCn(d.name, d.value),
          ),
      ]))
    else
      itemCard('信息', itemRows([
        for (final e
            in const {'Class': '类别', 'Grade': '等级', 'Size': '尺寸'}.entries)
          itemRow(e.value, descValue(item, e.key)),
      ])),
    // Physical
    itemCard('物理属性', itemRows([
      itemRow('质量', fmtNum(item.mass), unit: 'kg'),
      // volume 即以 SCU 为单位的体积(spec: "Cubic volume ... (SCU)")。
      itemRow('体积', fmtNum(dim?.volume), unit: 'SCU'),
      if (dim?.dimensions != null)
        itemStatRow(
          '尺寸',
          itemDimText(dim!.dimensions!.length, dim.dimensions!.width,
              dim.dimensions!.height, 'm'),
        ),
      if (dim?.cargoDimension != null)
        itemStatRow(
          '货物尺寸',
          itemDimText(dim!.cargoDimension!.length, dim.cargoDimension!.width,
              dim.cargoDimension!.height, 'm'),
        ),
      itemRow('货舱体积', fmtNum(item.inventory?.scu), unit: 'SCU'),
    ])),
    // 技术信息(全部 _smallRow + 中文标签)
    itemCard('技术信息', itemRows([
      itemSmallRow('分类', item.classification),
      itemSmallRow('类名', item.className),
      itemSmallRow('UUID', item.uuid),
      itemSmallRow('类型', item.typeLabel ?? item.type),
      itemSmallRow('子类型', item.subTypeLabel ?? item.subType),
    ])),
  ];
}

/// 系统:资源网络 · 信号。
List<Widget> buildSystemCards(GameItem item) {
  return [
    resourceNetworkCard(item.resourceNetwork),
    // 信号(emission)
    itemCard('信号', itemRows([
      itemRow('IR 信号', fmtNum(item.emission?.ir)),
      itemStatRow(
          'EM 信号', itemRangeText(item.emission?.emMin, item.emission?.emMax)),
      itemRow('EM 衰减', fmtNum(item.emission?.emDecay)),
      itemRow('每段 EM', fmtNum(item.emission?.emPerSegment)),
    ])),
  ];
}

/// 购买:游戏内购买。
List<Widget> buildPurchaseCards(GameItem item) {
  final purchases = item.uexPrices?.purchase ?? const <UexPrice>[];
  return [
    if (purchases.isNotEmpty) uexPurchaseCard(purchases),
  ];
}

/// 蓝图卡片:制造时间 / 材料表 / 解锁任务(传入的 [bp] 最好是含解锁任务的详情)。
List<Widget> blueprintCards(Blueprint bp) {
  return [
    itemCard('制造', itemRows([
      itemRow(
          '制造时间', fmtDurationCn(bp.craftTimeSeconds)),
      itemRow('原料数', bp.ingredientCount?.toString()),
    ])),
    if ((bp.ingredients ?? const <BlueprintIngredient>[]).isNotEmpty)
      _blueprintIngredientsCard(bp.ingredients!),
    if ((bp.unlockingMissions ?? const <BlueprintUnlockingMission>[]).isNotEmpty)
      _blueprintMissionsCard(bp.unlockingMissions!),
  ];
}

/// 所需材料表:表头(材料 | 数量)+ 每行 名称 | 数量。
/// 数量:物品用「×N」(quantity),资源用「N SCU」(quantityScu)。
Widget _blueprintIngredientsCard(List<BlueprintIngredient> ings) {
  final headerStyle = TextStyle(fontSize: 12, color: Colors.grey[600]);
  const nameStyle = TextStyle(fontSize: 13);
  const qtyStyle = TextStyle(fontSize: 13, fontWeight: FontWeight.bold);

  String qty(BlueprintIngredient i) {
    if (i.quantity != null) return '×${fmtNum(i.quantity)}';
    if (i.quantityScu != null) return '${fmtNum(i.quantityScu)} SCU';
    return '-';
  }

  Widget tr(Widget a, Widget b) => Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 7, child: a),
            Expanded(flex: 3, child: b),
          ],
        ),
      );

  return itemCard('所需材料(${ings.length})', [
    tr(
      Text('材料', style: headerStyle),
      Text('数量', style: headerStyle, textAlign: TextAlign.right),
    ),
    for (final i in ings)
      tr(
        Text(i.name ?? '-', style: nameStyle),
        Text(qty(i), style: qtyStyle, textAlign: TextAlign.right),
      ),
  ]);
}

/// 解锁任务卡:每行 任务名(可换行)+ 右侧获取概率(若有,按 0-1 显示百分比)。
Widget _blueprintMissionsCard(List<BlueprintUnlockingMission> missions) {
  return itemCard('解锁任务(${missions.length})', [
    for (final m in missions)
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(m.title ?? m.debugName ?? '-',
                  style: const TextStyle(fontSize: 13)),
            ),
            if (m.chance != null) ...[
              const SizedBox(width: 12),
              Text('${(m.chance! * 100).toStringAsFixed(0)}%',
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold)),
            ],
          ],
        ),
      ),
  ]);
}

// ============ 通用区块/卡片 helper(顶层纯函数) ============

/// 伤害图(六类)→ 每类一行,值用 min–max 百分比区间。
List<Widget> damageRows(ShieldDamageMap? map) {
  if (map == null) return const [];
  final entries = <String, ShieldDamageRange?>{
    '物理': map.physical,
    '能量': map.energy,
    '畸变': map.distortion,
    '热能': map.thermal,
    '生化': map.biochemical,
    '眩晕': map.stun,
  };
  return itemRows([
    for (final e in entries.entries)
      itemRow(e.key, fmtPctRange(e.value?.min, e.value?.max)),
  ]);
}

Widget resourceNetworkCard(ResourceNetwork? rn) {
  if (rn == null) return const SizedBox.shrink();
  final rows = itemRows([
    itemStatRow('功率用量',
        itemRangeText(rn.usage?.power?.min, rn.usage?.power?.max, unit: '段')),
    itemStatRow('冷却用量',
        itemRangeText(rn.usage?.coolant?.min, rn.usage?.coolant?.max,
            unit: '段')),
    itemRow('自修复次数', rn.repair?.maxRepairCount?.toString(), unit: 'x'),
    itemRow('修复耗时', fmtNum(rn.repair?.timeToRepair), unit: 's'),
    itemRow('血量比', fmtPctRatio(rn.repair?.healthRatio)),
    itemRow('生成功率', fmtNum(rn.generation?.power)),
    itemRow('生成冷却', fmtNum(rn.generation?.coolant)),
  ]);

  final stateWidgets = <Widget>[];
  for (final state in rn.states ?? const <ResourceNetworkState>[]) {
    final stateRows = itemRows([
      itemRow('EM 信号', fmtNum(state.signature?.em)),
      itemRow('IR 信号', fmtNum(state.signature?.ir)),
      for (final pr in state.powerRanges ??
          const <ResourceNetworkStatePowerRangesInner>[])
        itemRow('档位 @${fmtNum(pr.start) ?? '-'}', fmtMult(pr.modifier)),
      for (final d in state.deltas ?? const <ResourceNetworkDelta>[])
        itemSmallRow(
          d.generatedResource ?? d.resource ?? d.type ?? '转换',
          [
            if (d.rate != null) '速率 ${fmtNum(d.rate)}',
            if (d.minimumFraction != null)
              '最小比例 ${fmtPctRatio(d.minimumFraction)}',
            if (d.generatedRate != null) '生成 ${fmtNum(d.generatedRate)}',
          ].join('  ·  '),
        ),
    ]);
    if (stateRows.isEmpty) continue;
    stateWidgets
      ..addAll(itemGroupHeader(state.name ?? '状态'))
      ..addAll(stateRows);
  }

  return itemCard('资源网络', [...rows, ...stateWidgets]);
}

/// 游戏内购买:按星系分组的表格(地点 | 终端 | 价格),地点/终端/星系接入翻译。
Widget uexPurchaseCard(List<UexPrice> purchases) {
  final groups = <String, List<UexPrice>>{};
  for (final p in purchases) {
    final system = p.starmapLocation?.starSystemName ?? '其它';
    groups.putIfAbsent(system, () => []).add(p);
  }
  final headerStyle = TextStyle(fontSize: 12, color: Colors.grey[600]);
  const cellStyle = TextStyle(fontSize: 13);
  const priceStyle = TextStyle(fontSize: 13, fontWeight: FontWeight.bold);

  // 地点/终端接入 TranslationRepo 同步翻译;未命中返回原文。
  String t(String? s) =>
      (s == null || s.isEmpty) ? '-' : TranslationRepo().getTranslationSync(s);

  Widget tableRow(Widget loc, Widget terminal, Widget price) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: loc),
          Expanded(flex: 3, child: terminal),
          Expanded(flex: 3, child: price),
        ],
      ),
    );
  }

  final keys = groups.keys.toList()..sort();
  return itemCard('游戏内购买(${purchases.length})', [
    for (final system in keys) ...[
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 14),
        child: Text(t(system),
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.orange.shade700)),
      ),
      tableRow(
        Text('地点', style: headerStyle),
        Text('终端', style: headerStyle),
        Text('价格', style: headerStyle, textAlign: TextAlign.right),
      ),
      ...groups[system]!.map((p) => tableRow(
            Text(
                t(p.starmapLocation?.parentName ?? p.starmapLocation?.name),
                style: cellStyle),
            Text(t(p.terminalName), style: cellStyle),
            Text(
                p.priceBuy == null ? '-' : '${fmtNum(p.priceBuy)} aUEC',
                style: priceStyle,
                textAlign: TextAlign.right),
          )),
    ],
  ]);
}

/// 双栏对比表卡片:标题 + 表头(空 | colA | colB) + 数据行(label | a | b)。
/// a、b 都为 null 的整行跳过;全表为空时返回 SizedBox。
Widget itemTwoColCard(String title, String colA, String colB,
    List<(String, String?, String?)> rows) {
  final visible = rows.where((r) => r.$2 != null || r.$3 != null).toList();
  if (visible.isEmpty) return const SizedBox.shrink();
  final headerStyle = TextStyle(fontSize: 12, color: Colors.grey[600]);
  const labelStyle = TextStyle(fontSize: 14);
  const valStyle = TextStyle(fontSize: 13, fontWeight: FontWeight.bold);

  Widget tr(Widget l, Widget a, Widget b) => Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 4, child: l),
            Expanded(flex: 3, child: a),
            Expanded(flex: 3, child: b),
          ],
        ),
      );

  return itemCard(title, [
    tr(
      const SizedBox.shrink(),
      Text(colA, style: headerStyle, textAlign: TextAlign.right),
      Text(colB, style: headerStyle, textAlign: TextAlign.right),
    ),
    for (final (label, a, b) in visible)
      tr(
        Text(label, style: labelStyle),
        Text(a ?? '-', style: valStyle, textAlign: TextAlign.right),
        Text(b ?? '-', style: valStyle, textAlign: TextAlign.right),
      ),
  ]);
}

// ============ 通用行/格式化 helper(顶层纯函数) ============

/// 分区 Card:标题 17 bold + 内容行;无内容行时返回 SizedBox(被外层过滤)。
Widget itemCard(String title, List<Widget> children) {
  if (children.isEmpty) {
    return const SizedBox.shrink();
  }
  return Card(
    margin: EdgeInsets.zero,
    child: Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(title,
                style: const TextStyle(
                    fontSize: 17, fontWeight: FontWeight.bold)),
          ),
          ...children,
          const SizedBox(height: 4),
        ],
      ),
    ),
  );
}

List<Widget> itemRows(List<Widget?> rows) =>
    rows.whereType<Widget>().toList();

/// 分组小标题(资源网络各状态用):大写标题 + 分隔线。
List<Widget> itemGroupHeader(String title) {
  return [
    Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 2),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 13,
          letterSpacing: 1.2,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade600,
        ),
      ),
    ),
    const Divider(height: 1),
  ];
}

Widget itemStatRow(String title, Widget trailing) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
    child: Row(
      children: [
        Text(title, style: const TextStyle(fontSize: 14)),
        const Spacer(),
        trailing,
      ],
    ),
  );
}

Widget? itemRow(String title, String? value,
    {String? unit, bool orange = false}) {
  if (value == null || value.isEmpty) {
    return null;
  }
  return itemStatRow(
    title,
    Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(value,
            style: orange
                ? kItemValueStyleBold.copyWith(color: Colors.orange)
                : kItemValueStyleBold),
        if (unit != null) Text(' $unit', style: kItemValueStyle),
      ],
    ),
  );
}

Widget? itemSmallRow(String title, String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 14)),
        const SizedBox(width: 16),
        Expanded(
          child: Text(value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                  fontSize: 13, fontWeight: FontWeight.bold)),
        ),
      ],
    ),
  );
}

Widget itemDimText(num? l, num? w, num? h, String unit) {
  const orangeX = TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, color: Colors.orange);
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(fmtNum(l) ?? '-', style: kItemValueStyleBold),
      const Text(' x ', style: orangeX),
      Text(fmtNum(w) ?? '-', style: kItemValueStyleBold),
      const Text(' x ', style: orangeX),
      Text(fmtNum(h) ?? '-', style: kItemValueStyleBold),
      Text(' $unit', style: kItemValueStyle),
    ],
  );
}

/// 数值区间文本(如 EM 630 – 1,800);两端相同或仅一端时退化为单值。
Widget itemRangeText(num? min, num? max, {String? unit}) {
  final suffix = unit != null ? ' $unit' : '';
  String body;
  if (min == null && max == null) {
    body = '-';
  } else if (min != null && max != null && min != max) {
    body = '${fmtNum(min)} – ${fmtNum(max)}';
  } else {
    body = fmtNum(min ?? max) ?? '-';
  }
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(body, style: kItemValueStyleBold),
      if (suffix.isNotEmpty) Text(suffix, style: kItemValueStyle),
    ],
  );
}

/// 从 descriptionData 取指定英文键(忽略大小写)的值。
String? descValue(GameItem item, String name) {
  for (final d in item.descriptionData ?? const <ItemDescriptionData>[]) {
    if ((d.name ?? '').toLowerCase() == name.toLowerCase()) {
      return d.value;
    }
  }
  return null;
}

/// 数值格式化:整数加千分位,小数保留 1-2 位。
String? fmtNum(num? value) {
  if (value == null) {
    return null;
  }
  String s;
  if (value == value.roundToDouble()) {
    s = value.round().toString();
  } else {
    s = value.toStringAsFixed(value.abs() < 10 ? 2 : 1);
  }
  final parts = s.split('.');
  parts[0] =
      parts[0].replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (m) => ',');
  return parts.join('.');
}

/// 倍率 → ±百分比(如 0.85 → -15%,1.0 → +0%)。
String? fmtMult(num? value) {
  if (value == null) {
    return null;
  }
  final pct = (value - 1) * 100;
  final sign = pct > 0 ? '+' : '';
  return '$sign${pct.toStringAsFixed(pct.abs() < 10 ? 1 : 0)}%';
}

/// 0-1 比例 → 单值百分比(如 0.2 → 20.0%)。
String? fmtPctRatio(num? value) {
  if (value == null) {
    return null;
  }
  return '${(value * 100).toStringAsFixed(1)}%';
}

/// 0-1 比例区间 → 百分比文本(取上界)。
String? fmtPctRange(num? min, num? max) {
  if (min == null && max == null) {
    return null;
  }
  String pct(num v) => '${(v * 100).toStringAsFixed(1)}%';
  return pct(max ?? min!);
}

/// 秒 → 中文时长(如「1 小时 30 分钟」「2 天」「45 秒」);0→「无」,null→null。
String? fmtDurationCn(int? seconds) {
  if (seconds == null) return null;
  if (seconds <= 0) return '无';
  final d = seconds ~/ 86400;
  final h = (seconds % 86400) ~/ 3600;
  final m = (seconds % 3600) ~/ 60;
  final s = seconds % 60;
  final parts = <String>[];
  if (d > 0) parts.add('$d 天');
  if (h > 0) parts.add('$h 小时');
  if (m > 0) parts.add('$m 分钟');
  if (s > 0 && d == 0 && h == 0) parts.add('$s 秒');
  return parts.isEmpty ? '无' : parts.join(' ');
}
