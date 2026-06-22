import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/shield.dart';
import 'package:refuge_next/src/repo/translation.dart';
import 'package:refuge_next/src/widgets/ship_info/ship_info_menu.dart';
import 'package:refuge_next/src/widgets/ship_info/ship_info_title.dart'
    show ShipPriceDisplay;

/// 护盾详情测试页(仿 [VehicleDetailPage] 的头部与卡片样式)。
///
/// 用于核对 [ShieldRepo] 下载下来的护盾(`GameItem`,含嵌套 `shield`)数据
/// 是否完整、字段映射是否正确:头部展示题图/名称/制造商/标签/aUEC 价格,
/// 正文单列滚动逐区展示 Fitment / Physical / Stats / Description Data /
/// UEX Prices / Shield / Reserve Pool / Regen Delay / Absorption /
/// Resistance / Emission / Resource Network / Technical。仅作开发调试用。
class ShieldDetailPage extends StatefulWidget {
  const ShieldDetailPage({
    super.key,
    this.initialShield,
    this.allowSwitch = true,
  });

  /// 指定展示的护盾;为 null 时取本地第一条。
  final GameItem? initialShield;

  /// 是否显示「切换护盾」按钮(测试页为 true)。
  final bool allowSwitch;

  @override
  State<ShieldDetailPage> createState() => _ShieldDetailPageState();
}

class _ShieldDetailPageState extends State<ShieldDetailPage> {
  List<GameItem> _all = [];
  GameItem? _selected;
  bool _loading = true;

  static const _valueStyle = TextStyle(fontSize: 13);
  static const _valueStyleBold =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    Future.wait([
      ShieldRepo().getShields(),
      TranslationRepo().getTranslations(),
    ]).then((results) {
      if (!mounted) return;
      final shields = results[0] as List<GameItem>;
      setState(() {
        _all = shields;
        _selected = widget.initialShield ??
            (shields.isNotEmpty ? shields.first : null);
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Scaffold(
        appBar: AppBar(title: const Text('护盾详情')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    final selected = _selected;
    if (selected == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('护盾详情')),
        body: const Center(child: Text('本地暂无数据,请先在 Shield 测试页拉取')),
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
              ShipInfoMenu(
                barWidth: 320, // 5 个 2 字页签
                titles: const ['总览', '参数', '防护', '系统', '购买'],
                children: [
                  _tabPage(_overviewCards(selected)),
                  _tabPage(_shieldCards(selected)),
                  _tabPage(_defenseCards(selected)),
                  _tabPage(_systemCards(selected)),
                  _tabPage(_purchaseCards(selected)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabPage(List<Widget> cards) {
    return SingleChildScrollView(
      // 复用 NestedScrollView 注入的 primary 控制器,实现内外滚动联动
      primary: true,
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: cards,
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
                child: const Icon(Icons.shield_outlined,
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
    final desc = rawDesc?.split('\n').skip(5).join('\n').trim();
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
                            onPressed: () => _showShieldSelector(context),
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

  // ============ 切换护盾 modal ============

  void _showShieldSelector(BuildContext context) {
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
                          hintText: '搜索护盾名 / Class Name',
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
                              'HP ${_n(s.shield?.maxHealth) ?? '-'}',
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                              setState(() => _selected = s);
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

  // ============ 正文卡片(按页签分组) ============

  /// 每张卡之间留 12 间距。
  List<Widget> _spaced(List<Widget> cards) => cards
      .map((c) => Padding(padding: const EdgeInsets.only(top: 12), child: c))
      .toList();

  /// 总览:信息 · 物理 · 技术信息。
  List<Widget> _overviewCards(GameItem item) {
    final dim = item.dimension;
    return _spaced([
      // Info(从 descriptionData 取 类别/等级/尺寸 三项)
      _card('信息', _rows([
        for (final e
            in const {'Class': '类别', 'Grade': '等级', 'Size': '尺寸'}.entries)
          _row(e.value, _descValue(item, e.key)),
      ])),
      // Physical
      _card('物理属性', _rows([
        _row('质量', _n(item.mass), unit: 'kg'),
        _row('体积', _n(dim?.volume),
            unit: dim?.volumeConvertedUnit ?? 'µSCU'),
        if (dim?.dimensions != null)
          _statRow(
            '尺寸',
            _dimText(dim!.dimensions!.length, dim.dimensions!.width,
                dim.dimensions!.height, 'm'),
          ),
        if (dim?.cargoDimension != null)
          _statRow(
            '货物尺寸',
            _dimText(dim!.cargoDimension!.length, dim.cargoDimension!.width,
                dim.cargoDimension!.height, 'm'),
          ),
        _row('货舱体积', _n(item.inventory?.scu), unit: 'SCU'),
      ])),
      // 技术信息(同舰船详情页样式:全部 _smallRow + 中文标签)
      _card('技术信息', _rows([
        _smallRow('分类', item.classification),
        _smallRow('类名', item.className),
        _smallRow('UUID', item.uuid),
        _smallRow('类型', item.typeLabel ?? item.type),
        _smallRow('子类型', item.subTypeLabel ?? item.subType),
      ])),
    ]);
  }

  /// 护盾:护盾 · 储备池 · 回复延迟。
  List<Widget> _shieldCards(GameItem item) {
    final s = item.shield;
    return _spaced([
      // Shield
      _card('护盾', _rows([
        _row('最大血量', _n(s?.maxHealth), unit: 'HP', orange: true),
        _row('回复速率', _n(s?.regenRate), unit: 'HP/s'),
        _row('回复时间', _n(s?.regenTime), unit: 's'),
        _row('衰减比', _n(s?.decayRatio)),
      ])),
      // Reserve Pool
      _card('储备池', _rows([
        _row('回复速率', _n(s?.reservePool?.regenRate), unit: 'HP/s'),
        _row('回复时间', _n(s?.reservePool?.regenTime), unit: 's'),
        _row('抽取速率比', _n(s?.reservePool?.drainRateRatio)),
        _row('初始血量比', _pctRatio(s?.reservePool?.initialHealthRatio)),
        _row('最大血量比', _pctRatio(s?.reservePool?.maxHealthRatio)),
      ])),
      // Regen Delay
      _card('回复延迟', _rows([
        _row('击穿', _n(s?.regenDelay?.downed), unit: 's'),
        _row('受击', _n(s?.regenDelay?.damage), unit: 's'),
      ])),
    ]);
  }

  /// 防护:吸收 · 抗性 · 信号。
  List<Widget> _defenseCards(GameItem item) {
    final s = item.shield;
    return _spaced([
      // Absorption
      _card('吸收', _damageRows(s?.absorption)),
      // Resistance
      _card('抗性', _damageRows(s?.resistance)),
      // Emission
      _card('信号', _rows([
        _row('IR 信号', _n(item.emission?.ir)),
        _statRow('EM 信号', _rangeText(item.emission?.emMin, item.emission?.emMax)),
        _row('EM 衰减', _n(item.emission?.emDecay)),
        _row('每段 EM', _n(item.emission?.emPerSegment)),
      ])),
    ]);
  }

  /// 系统:资源网络。
  List<Widget> _systemCards(GameItem item) {
    return _spaced([
      _resourceNetworkCard(item.resourceNetwork),
    ]);
  }

  /// 购买:游戏内购买。
  List<Widget> _purchaseCards(GameItem item) {
    final purchases = item.uexPrices?.purchase ?? const <UexPrice>[];
    return _spaced([
      // 游戏内购买(同舰船详情页样式)
      if (purchases.isNotEmpty) _uexPurchaseCard(purchases),
    ]);
  }

  /// 游戏内购买:按星系分组的表格(地点 | 终端 | 价格),
  /// 与 vehicle_detail_page 的 `_uexPurchaseCard` 保持一致。
  Widget _uexPurchaseCard(List<UexPrice> purchases) {
    final groups = <String, List<UexPrice>>{};
    for (final p in purchases) {
      final system = p.starmapLocation?.starSystemName ?? '其它';
      groups.putIfAbsent(system, () => []).add(p);
    }
    final headerStyle = TextStyle(fontSize: 12, color: Colors.grey[600]);
    const cellStyle = TextStyle(fontSize: 13);
    const priceStyle = TextStyle(fontSize: 13, fontWeight: FontWeight.bold);

    // 地点/终端接入 TranslationRepo 同步翻译;未命中返回原文。
    String t(String? s) => (s == null || s.isEmpty)
        ? '-'
        : TranslationRepo().getTranslationSync(s);

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
    return _card('游戏内购买(${purchases.length})', [
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
                  t(p.starmapLocation?.parentName ??
                      p.starmapLocation?.name),
                  style: cellStyle),
              Text(t(p.terminalName), style: cellStyle),
              Text(
                  p.priceBuy == null ? '-' : '${_n(p.priceBuy)} aUEC',
                  style: priceStyle,
                  textAlign: TextAlign.right),
            )),
      ],
    ]);
  }

  /// 伤害图(六类)→ 每类一行,值用 min–max 百分比区间。
  List<Widget> _damageRows(ShieldDamageMap? map) {
    if (map == null) return const [];
    final entries = <String, ShieldDamageRange?>{
      '物理': map.physical,
      '能量': map.energy,
      '畸变': map.distortion,
      '热能': map.thermal,
      '生化': map.biochemical,
      '眩晕': map.stun,
    };
    return _rows([
      for (final e in entries.entries)
        _row(e.key, _pctRange(e.value?.min, e.value?.max)),
    ]);
  }

  Widget _resourceNetworkCard(ResourceNetwork? rn) {
    if (rn == null) return const SizedBox.shrink();
    final rows = _rows([
      _statRow('功率用量',
          _rangeText(rn.usage?.power?.min, rn.usage?.power?.max, unit: '段')),
      _statRow('冷却用量',
          _rangeText(rn.usage?.coolant?.min, rn.usage?.coolant?.max, unit: '段')),
      _row('自修复次数', rn.repair?.maxRepairCount?.toString(), unit: 'x'),
      _row('修复耗时', _n(rn.repair?.timeToRepair), unit: 's'),
      _row('血量比', _pctRatio(rn.repair?.healthRatio)),
      _row('生成功率', _n(rn.generation?.power)),
      _row('生成冷却', _n(rn.generation?.coolant)),
    ]);

    final stateWidgets = <Widget>[];
    for (final state in rn.states ?? const <ResourceNetworkState>[]) {
      final stateRows = _rows([
        _row('EM 信号', _n(state.signature?.em)),
        _row('IR 信号', _n(state.signature?.ir)),
        for (final pr in state.powerRanges ??
            const <ResourceNetworkStatePowerRangesInner>[])
          _row('档位 @${_n(pr.start) ?? '-'}', _mult(pr.modifier)),
        for (final d in state.deltas ?? const <ResourceNetworkDelta>[])
          _smallRow(
            d.generatedResource ?? d.resource ?? d.type ?? '转换',
            [
              if (d.rate != null) '速率 ${_n(d.rate)}',
              if (d.minimumFraction != null)
                '最小比例 ${_pctRatio(d.minimumFraction)}',
              if (d.generatedRate != null) '生成 ${_n(d.generatedRate)}',
            ].join('  ·  '),
          ),
      ]);
      if (stateRows.isEmpty) continue;
      stateWidgets
        ..addAll(_groupHeader(state.name ?? '状态'))
        ..addAll(stateRows);
    }

    return _card('资源网络', [...rows, ...stateWidgets]);
  }

  // ============ 复刻自 vehicle_detail_page 的小 helper ============

  Widget _card(String title, List<Widget> children) {
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

  List<Widget> _rows(List<Widget?> rows) => rows.whereType<Widget>().toList();

  /// 分组小标题(资源网络各状态用):大写标题 + 分隔线。
  List<Widget> _groupHeader(String title) {
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

  Widget _statRow(String title, Widget trailing) {
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

  Widget? _row(String title, String? value,
      {String? unit, bool orange = false}) {
    if (value == null || value.isEmpty) {
      return null;
    }
    return _statRow(
      title,
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(value,
              style: orange
                  ? _valueStyleBold.copyWith(color: Colors.orange)
                  : _valueStyleBold),
          if (unit != null) Text(' $unit', style: _valueStyle),
        ],
      ),
    );
  }

  Widget? _smallRow(String title, String? value) {
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

  Widget _dimText(num? l, num? w, num? h, String unit) {
    const orangeX = TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold, color: Colors.orange);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(_n(l) ?? '-', style: _valueStyleBold),
        const Text(' x ', style: orangeX),
        Text(_n(w) ?? '-', style: _valueStyleBold),
        const Text(' x ', style: orangeX),
        Text(_n(h) ?? '-', style: _valueStyleBold),
        Text(' $unit', style: _valueStyle),
      ],
    );
  }

  /// 数值区间文本(如 EM 630 – 1,800);两端相同或仅一端时退化为单值。
  Widget _rangeText(num? min, num? max, {String? unit}) {
    final suffix = unit != null ? ' $unit' : '';
    String body;
    if (min == null && max == null) {
      body = '-';
    } else if (min != null && max != null && min != max) {
      body = '${_n(min)} – ${_n(max)}';
    } else {
      body = _n(min ?? max) ?? '-';
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(body, style: _valueStyleBold),
        if (suffix.isNotEmpty) Text(suffix, style: _valueStyle),
      ],
    );
  }

  // ============ 格式化 ============

  /// 从 descriptionData 取指定英文键(忽略大小写)的值。
  String? _descValue(GameItem item, String name) {
    for (final d in item.descriptionData ?? const <ItemDescriptionData>[]) {
      if ((d.name ?? '').toLowerCase() == name.toLowerCase()) {
        return d.value;
      }
    }
    return null;
  }

  String? _n(num? value) {
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
  String? _mult(num? value) {
    if (value == null) {
      return null;
    }
    final pct = (value - 1) * 100;
    final sign = pct > 0 ? '+' : '';
    return '$sign${pct.toStringAsFixed(pct.abs() < 10 ? 1 : 0)}%';
  }

  /// 0-1 比例 → 单值百分比(如 0.2 → 20.0%)。
  String? _pctRatio(num? value) {
    if (value == null) {
      return null;
    }
    return '${(value * 100).toStringAsFixed(1)}%';
  }

  /// 0-1 比例区间 → 百分比文本(取上界,仿 vehicle_detail_page)。
  String? _pctRange(num? min, num? max) {
    if (min == null && max == null) {
      return null;
    }
    String pct(num v) => '${(v * 100).toStringAsFixed(1)}%';
    return pct(max ?? min!);
  }
}
