import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/src/datasource/data_model.dart';
import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/game_vehicle.dart';
import 'package:refuge_next/src/repo/ship_info.dart';
import 'package:refuge_next/src/widgets/ship_info/ship_info_menu.dart';
import 'package:refuge_next/src/widgets/ship_info/ship_info_title.dart'
    show ShipPriceDisplay;
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

/// 载具详情测试页(数据:本地 GameVehicleRepo 的 wiki GameVehicle)。
///
/// 设计完全对齐现有舰船详情页(ShipFullPage):
/// 标题头(仿 ShipInfoTitle)+ ShipInfoMenu 页签
/// (总览/武装/飞行/组件),统计行为小号版 ShipSimpleInfoItem 样式,
/// 组件条目复用武器列表的灰底圆角样式。仅作开发调试用。
class VehicleDetailTestPage extends StatefulWidget {
  const VehicleDetailTestPage({super.key});

  @override
  State<VehicleDetailTestPage> createState() => _VehicleDetailTestPageState();
}

class _VehicleDetailTestPageState extends State<VehicleDetailTestPage> {
  List<GameVehicle> _all = [];
  GameVehicle? _selected;
  bool _loading = true;

  static const _valueStyle = TextStyle(fontSize: 13);
  static const _valueStyleBold =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    Future.wait([
      GameVehicleRepo().getVehicles(),
      // 确保现有船库已加载(用于缩略图名称匹配)
      ShipInfoRepo().getShips(),
    ]).then((results) {
      if (!mounted) return;
      final vehicles = results[0] as List<GameVehicle>;
      setState(() {
        _all = vehicles;
        _selected = vehicles.isNotEmpty ? vehicles.first : null;
        _loading = false;
      });
    });
  }

  /// 取载具缩略图 URL:优先用 wiki 数据自带的 images 字段
  /// (starcitizen.tools 题图),其次按英文名匹配现有船库的渲染图;
  /// 都没有返回 null。
  String? _thumbUrlFor(GameVehicle v) {
    final images = v.images;
    if (images != null && images.isNotEmpty) {
      // 全宽横幅展示,优先原图(缩略图仅 600px,高分屏下偏糊)
      final url = images.first.originalUrl ?? images.first.thumbnailUrl;
      if (url != null && url.isNotEmpty) {
        return url;
      }
    }
    final name = v.name?.toLowerCase();
    if (name == null) return null;
    for (final ship in ShipInfoRepo().getShipsSync()) {
      if (ship.name.toLowerCase() == name) {
        final pic = ship.shipNameBinding?.shipPicName;
        if (pic != null) {
          return 'https://image.biaoju.site/refuge/data/ship_render/$pic.thumb.png';
        }
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Scaffold(
        appBar: AppBar(title: const Text('载具详情')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    final selected = _selected;
    if (selected == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('载具详情')),
        body: const Center(child: Text('本地暂无数据,请先在 Game Vehicle 测试页拉取')),
      );
    }
    // NestedScrollView:标题头随内容整体滚动(滚页签内容时头部一起滚走),
    // 页签栏 + PageView 占满剩余视口,各页签内容通过 primary 控制器与外层联动。
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(child: _buildTitle(selected)),
          ],
          body: Column(
            children: [
              ShipInfoMenu(
                titles: const ['总览', '武装', '飞行', '组件'],
                children: [
                  _tabPage(_overviewCards(selected)),
                  _tabPage(_combatCards(selected)),
                  _tabPage(_flightCards(selected)),
                  _tabPage(_portsCards(selected)),
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
      // 使用 NestedScrollView 注入的 primary 控制器,实现内外滚动联动
      primary: true,
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(children: cards),
      ),
    );
  }

  // ============ 标题头(仿 ShipInfoTitle) ============

  Widget _buildTitle(GameVehicle v) {
    final thumbUrl = _thumbUrlFor(v);
    final tags = <String>[
      if (v.career != null) v.career!,
      if (v.role != null) v.role!,
      if (v.sizeClass != null) 'S${v.sizeClass}',
    ];

    // SKU 美元价:取最高 SKU(同现有页取最高价逻辑),回退 msrp;
    // ShipPriceDisplay 以「分」为单位,故 ×100。
    num? usd;
    final skus = v.skus;
    if (skus != null && skus.isNotEmpty) {
      for (final sku in skus) {
        final price = sku.price;
        if (price != null && (usd == null || price > usd)) {
          usd = price;
        }
      }
    }
    usd ??= v.msrp;
    final usdCents = usd == null ? null : (usd * 100).toInt();

    // aUEC 游戏内购买价:取 UEX 各终端最高购买价(同现有页 shopInfo 取最高)。
    int? auec;
    final purchases = v.uexPrices?.purchase;
    if (purchases != null) {
      for (final p in purchases) {
        final buy = p.priceBuy;
        if (buy != null && (auec == null || buy > auec)) {
          auec = buy.toInt();
        }
      }
    }
    final desc = v.description?.zhCN ?? v.description?.enEN;

    // 仿 wiki 网页头部,响应式:
    // - 窄屏(< 500):上下布局,题图全宽 16:9 横幅;
    // - 宽屏:左图右文,题图 3:2(相对 4:3 原图稍微横向裁剪,更美观)。
    return Container(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final narrow = constraints.maxWidth < 500;
              if (narrow) {
                // 上下布局:题图横幅在上,信息在下
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (thumbUrl != null) ...[
                      _titleImage(thumbUrl,
                          aspectRatio: 16 / 9, showBack: true),
                      const SizedBox(height: 12),
                    ],
                    _titleInfo(v, tags, usdCents, auec, desc),
                  ],
                );
              }
              // 左右布局:左图(3:2 稍裁)右文
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
                    child: _titleInfo(v, tags, usdCents, auec, desc),
                  ),
                ],
              );
            },
          ),
          // 无题图时返回按钮退到头部左上角
          if (thumbUrl == null)
            Positioned(top: 0, left: 0, child: _backButton()),
        ],
      ),
    );
  }

  /// 返回按钮:半透明黑底圆形,保证压在图片上可见。
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
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey.withValues(alpha: 0.1),
                child: const Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => const SizedBox.shrink(),
            ),
            if (showBack)
              Positioned(top: 8, left: 8, child: _backButton()),
          ],
        ),
      ),
    );
  }

  /// 标题头信息栏:名称/厂商(价格居右上角)、标签、简介摘要。
  Widget _titleInfo(GameVehicle v, List<String> tags, int? usdCents, int? auec,
      String? desc) {
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
                    v.name ?? '未知',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          v.manufacturer?.name ?? '',
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: 32,
                        height: 32,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: 20,
                          icon: const Icon(Icons.swap_horiz),
                          onPressed: () => _showVehicleSelector(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // 价格:右上角,aUEC 在上、USD 在下(空间不足时整体缩小)
            if (usdCents != null || auec != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (auec != null)
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: ShipPriceDisplay(auecPrice: auec),
                    ),
                  if (usdCents != null)
                    Padding(
                      padding: EdgeInsets.only(top: auec != null ? 6 : 0),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: ShipPriceDisplay(usdPrice: usdCents),
                      ),
                    ),
                ],
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

  // ============ 选船 modal(仿 showShipSelector) ============

  void _showVehicleSelector(BuildContext context) {
    final filteredNotifier = ValueNotifier<List<GameVehicle>>(_all);

    WoltModalSheet.show<void>(
      context: context,
      pageListBuilder: (modalContext) {
        return [
          WoltModalSheetPage(
            hasSabGradient: true,
            isTopBarLayerAlwaysVisible: true,
            navBarHeight: 50,
            topBarTitle: const Text(
              '选择载具',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            trailingNavBarWidget: Container(
              height: 38,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                padding: const EdgeInsets.all(5),
                icon: const Icon(Icons.close, size: 22),
                onPressed: Navigator.of(modalContext).pop,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '搜索载具...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                      ),
                      onChanged: (value) {
                        final lower = value.toLowerCase();
                        filteredNotifier.value = _all.where((v) {
                          return (v.name?.toLowerCase() ?? '')
                                  .contains(lower) ||
                              (v.className?.toLowerCase() ?? '')
                                  .contains(lower);
                        }).toList();
                      },
                    ),
                  ),
                  ValueListenableBuilder<List<GameVehicle>>(
                    valueListenable: filteredNotifier,
                    builder: (context, filtered, _) {
                      return ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        physics: const ClampingScrollPhysics(),
                        itemCount: filtered.length,
                        itemBuilder: (context, index) {
                          final vehicle = filtered[index];
                          final isSelected = vehicle.uuid == _selected?.uuid;
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: InkWell(
                              onTap: () {
                                setState(() => _selected = vehicle);
                                Navigator.pop(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.blue.withValues(alpha: 0.1)
                                      : null,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: isSelected
                                        ? Colors.blue
                                        : Colors.grey[300]!,
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              vehicle.name ?? '未知',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 4),
                                              child: Text(
                                                '${vehicle.manufacturer?.name ?? ''} · '
                                                '${vehicle.className ?? ''}',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (isSelected)
                                        const Icon(
                                          Icons.check_circle,
                                          color: Colors.blue,
                                          size: 24,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ];
      },
    );
  }

  // ============ 总览 ============

  List<Widget> _overviewCards(GameVehicle v) {
    final foci =
        v.foci?.map((t) => t.zhCN ?? t.enEN).whereType<String>().join(' / ');
    final dim = v.dimension;
    return [
      _card(
          '基础信息',
          _rows([
            if (v.role != null || v.career != null)
              _statRow(
                '职能',
                Text(
                  [v.role, v.career].whereType<String>().join(' / '),
                  style: _valueStyleBold,
                ),
              ),
            _row('定位', (foci != null && foci.isNotEmpty) ? foci : null,
                orange: true),
            _row('船员', _crewText(v.crew)),
            if (dim != null &&
                (dim.length != null || dim.width != null || dim.height != null))
              _statRow(
                '尺寸',
                _dimText(dim.length, dim.width, dim.height, 'm'),
              ),
            _row('总质量', _n(v.massTotal), unit: 'kg'),
            _row('船体质量', _n(v.massHull), unit: 'kg'),
            _row('装配质量', _n(v.massLoadout), unit: 'kg'),
            _row('货舱', _n(v.cargoCapacity), unit: 'SCU', orange: true),
            _row('矿舱', _n(v.oreCapacity), unit: 'SCU'),
            _row('随身储物', _n(v.vehicleInventory), unit: 'KµSCU'),
            _row('最大箱规', _n(v.maxScuBox), unit: 'SCU'),
          ])),
      _card(
          '保险',
          _rows([
            _row('索赔时间', _n(v.insurance?.claimTime), unit: 'min'),
            _row('加急时间', _n(v.insurance?.expediteTime), unit: 'min'),
            _row('加急费用', _n(v.insurance?.expediteCost), unit: 'aUEC'),
          ])),
      _partsCard(v),
      _card(
          '技术信息',
          _rows([
            _smallRow('类名', v.className),
            _smallRow('游戏内名称', v.gameName),
            _smallRow('UUID', v.uuid),
            _smallRow('Ship Matrix ID', v.id?.toString()),
          ])),
    ].whereType<Card>().toList();
  }

  Widget _partsCard(GameVehicle v) {
    final parts = v.parts;
    if (parts == null || parts.isEmpty) {
      return const SizedBox.shrink();
    }
    final rows = <Widget>[];
    void walk(List<GameVehiclePart> list, int depth) {
      for (final part in list) {
        final name = part.displayName ?? part.name;
        if (name != null && part.damageMax != null) {
          rows.add(
              _smallRow('${'　' * depth}$name', '${_n(part.damageMax)} HP')!);
        }
        if (part.children != null) {
          walk(part.children!, depth + 1);
        }
      }
    }

    walk(parts, 0);
    return _card('结构部件', rows) as Card? ?? const Card();
  }

  // ============ 武装 ============

  List<Widget> _combatCards(GameVehicle v) {
    final w = v.weaponry;
    final s = v.shield;
    final a = v.armor;
    final sig = v.signature;
    return [
      _card(
          '武器',
          _rows([
            _row('飞行员 DPS', _n(w?.pilotDps), orange: true),
            _row('持续 DPS', _n(w?.pilotSustainedDps)),
            _row('Alpha', _n(w?.pilotAlpha)),
            _row('炮塔 DPS', _n(w?.turretDps)),
            _row('导弹数量', _n(w?.missiles?.count)),
            _row('导弹总伤害', _n(w?.totalMissileDamage)),
          ])),
      _card(
          '护盾',
          _rows([
            _row('类型', s?.faceType),
            _row('血量', _n(s?.hp), unit: 'HP', orange: true),
            _row('回复速率', _n(s?.regeneration), unit: 'HP/s'),
            _row('回复延迟', _n(s?.regenerationTime), unit: 's'),
            _row(
                '物理抗性',
                _pctRange(s?.resistance?.physical?.minimum,
                    s?.resistance?.physical?.maximum)),
            _row(
                '能量抗性',
                _pctRange(s?.resistance?.energy?.minimum,
                    s?.resistance?.energy?.maximum)),
            _row(
                '扭曲抗性',
                _pctRange(s?.resistance?.distortion?.minimum,
                    s?.resistance?.distortion?.maximum)),
          ])),
      _card(
          '装甲',
          _rows([
            _row('船体血量', _n(v.health), unit: 'HP', orange: true),
            _row('装甲血量', _n(a?.health), unit: 'HP'),
            _row('物理伤害', _mult(a?.damageMultiplier?.physical)),
            _row('能量伤害', _mult(a?.damageMultiplier?.energy)),
            _row('扭曲伤害', _mult(a?.damageMultiplier?.distortion)),
            _row('热能伤害', _mult(a?.damageMultiplier?.thermal)),
            _row('红外信号', _mult(a?.signalMultiplier?.infrared)),
            _row('电磁信号', _mult(a?.signalMultiplier?.electromagnetic)),
            _row('横截面信号', _mult(a?.signalMultiplier?.crossSection)),
          ])),
      _card(
          '信号特征',
          _rows([
            _row('红外(护盾)', _n(sig?.irShields)),
            _row('红外(量子)', _n(sig?.irQuantum)),
            _row('电磁(护盾)', _n(sig?.emShields)),
            _row('电磁(量子)', _n(sig?.emQuantum)),
            _row('最大横截面', _n(v.crossSectionMax)),
          ])),
      _card('系统分解', [
        ..._rows([
          _row('冷却总段数', _n(v.cooling?.generationSegments)),
          _row('功率总段数', _n(v.power?.generationSegments)),
        ]),
        ..._mapGroup('电磁分组(护盾)', sig?.emGroupsShields),
        ..._mapGroup('电磁分组(量子)', sig?.emGroupsQuantum),
        ..._mapGroup('冷却段(护盾)', v.cooling?.usedSegmentsShieldsGrouped),
        ..._mapGroup('冷却段(量子)', v.cooling?.usedSegmentsQuantumGrouped),
        ..._mapGroup('功率段', v.power?.usedSegmentsGrouped),
      ]),
    ].whereType<Card>().toList();
  }

  // ============ 飞行 ============

  List<Widget> _flightCards(GameVehicle v) {
    final s = v.speed;
    final a = v.agility;
    final q = v.quantum;
    return [
      _card(
          '速度',
          _rows([
            _row('SCM 速度', _n(s?.scm), unit: 'm/s', orange: true),
            _row('最大速度', _n(s?.max), unit: 'm/s', orange: true),
            _row('推进(前)', _n(s?.boostForward), unit: 'm/s'),
            _row('推进(后)', _n(s?.boostBackward), unit: 'm/s'),
            _row('0 → SCM', _n(s?.zeroToScm), unit: 's'),
            _row('SCM → 0', _n(s?.scmToZero), unit: 's'),
            _row('0 → Max', _n(s?.zeroToMax), unit: 's'),
            _row('Max → 0', _n(s?.maxToZero), unit: 's'),
          ])),
      _card(
          '机动',
          _rows([
            _row('俯仰', _agility(a?.pitch, a?.pitchBoosted)),
            _row('偏航', _agility(a?.yaw, a?.yawBoosted)),
            _row('翻滚', _agility(a?.roll, a?.rollBoosted)),
          ])),
      _card(
          '燃料与量子',
          _rows([
            _row('氢燃料容量', _n(v.fuel?.capacity), unit: 'SCU'),
            _row('燃料进气速率', _n(v.fuel?.intakeRate)),
            _row('量子燃料', _n(q?.quantumFuelCapacity), unit: 'SCU'),
            _row('量子速度', _n(q?.quantumSpeed), unit: 'm/s', orange: true),
            _row('量子起旋', _n(q?.quantumSpoolTime), unit: 's'),
            _row('量子航程', _n(q?.quantumRange), unit: 'm'),
          ])),
    ].whereType<Card>().toList();
  }

  // ============ 组件 ============

  List<Widget> _portsCards(GameVehicle v) {
    final ports = v.ports;
    if (ports == null || ports.isEmpty) {
      return [
        const Padding(
          padding: EdgeInsets.all(32),
          child: Text('无组件数据'),
        ),
      ];
    }
    final groups = <String, List<GameVehiclePort>>{};
    for (final port in ports) {
      final key = port.categoryLabel ?? port.type ?? '其他';
      groups.putIfAbsent(key, () => []).add(port);
    }
    final keys = groups.keys.toList()..sort();
    return keys.map((key) {
      final list = groups[key]!;
      return _card('$key(${list.length})',
          list.map((port) => _PortItem(port: port)).toList()) as Card;
    }).toList();
  }

  // ============ 通用小部件 ============

  /// 分区 Card:标题 20 bold + 内容行;无内容行时返回 SizedBox(被过滤)。
  Widget _card(String title, List<Widget> children) {
    if (children.isEmpty) {
      return const SizedBox.shrink();
    }
    return Card(
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

  /// 统计行:左标签 14 bold、右值 16 bold(小号版 ShipSimpleInfoItem)。
  Widget _statRow(String title, Widget trailing) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const Spacer(),
          trailing,
        ],
      ),
    );
  }

  /// 标准统计行:值 16 bold,单位 13。
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

  /// 小号行(长文本如 UUID/结构部件)。
  Widget? _smallRow(String title, String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const Spacer(),
          Flexible(
            child: Text(value,
                textAlign: TextAlign.right,
                style: const TextStyle(fontSize: 13)),
          ),
        ],
      ),
    );
  }

  /// 尺寸值:橙色 "x" 分隔(仿现有总览页)。
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

  /// Map 分组小节:小标题 + 紧凑行。
  List<Widget> _mapGroup(String title, Map<String, num>? map) {
    if (map == null || map.isEmpty) {
      return const [];
    }
    final keys = map.keys.toList()..sort();
    return [
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 14),
        child: Text(title,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.orange.shade700)),
      ),
      ...keys.map((k) => _smallRow(k, _n(map[k]))!),
    ];
  }

  // ============ 格式化 ============

  String? _crewText(GameVehicleCrew? crew) {
    if (crew?.min == null && crew?.max == null) {
      return null;
    }
    final min = crew?.min, max = crew?.max;
    if (min != null && max != null && max > min) {
      return '$min – $max';
    }
    return '${min ?? max}';
  }

  /// 数值格式化:整数加千分位,小数保留 1-2 位。
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

  /// 倍率 → ±百分比(如 0.9 → -10%,1.35 → +35%)。
  String? _mult(num? value) {
    if (value == null) {
      return null;
    }
    final pct = (value - 1) * 100;
    final sign = pct > 0 ? '+' : '';
    return '$sign${pct.toStringAsFixed(pct.abs() < 10 ? 1 : 0)}%';
  }

  /// 0-1 比例区间 → 百分比文本。
  String? _pctRange(num? min, num? max) {
    if (min == null && max == null) {
      return null;
    }
    String pct(num v) => '${(v * 100).toStringAsFixed(1)}%';
    if (min != null && max != null && min != max) {
      return '${pct(min)} – ${pct(max)}';
    }
    return pct(min ?? max!);
  }

  /// 机动性:基础(+推进)°/s。
  String? _agility(num? base, num? boosted) {
    if (base == null) {
      return null;
    }
    final b = boosted != null ? '(推进 ${_n(boosted)})' : '';
    return '${_n(base)} °/s $b';
  }
}

/// 组件条目:仿现有武器列表条目的灰底圆角样式
/// (左侧绿框尺寸徽章、中间名称+厂商、右侧等级)。
class _PortItem extends StatelessWidget {
  final GameVehiclePort port;

  const _PortItem({required this.port});

  @override
  Widget build(BuildContext context) {
    final item = port.equippedItem;
    final isDarkMode = Provider.of<MainDataModel>(context).isDarkMode;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800] : Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'S${item?.size ?? port.sizes?.max ?? '?'}',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item?.name ?? '(空)',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  if (item?.manufacturer?.name != null)
                    Text(
                      item!.manufacturer!.name!,
                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    ),
                ],
              ),
            ),
            if (item?.grade != null)
              Text(
                '等级 ${item!.grade}',
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
              ),
          ],
        ),
      ),
    );
  }
}
