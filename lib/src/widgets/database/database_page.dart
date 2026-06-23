import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_custom_tab_bar/library.dart';
import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/game_vehicle.dart';
import 'package:refuge_next/src/repo/ship_alias.dart';
import 'package:refuge_next/src/repo/cooler.dart';
import 'package:refuge_next/src/repo/personal_weapon.dart';
import 'package:refuge_next/src/repo/power_plant.dart';
import 'package:refuge_next/src/repo/quantum_drive.dart';
import 'package:refuge_next/src/repo/shield.dart';
import 'package:refuge_next/src/repo/vehicle_weapon.dart';
import 'package:refuge_next/src/repo/weapon_attachment.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/game_item_detail_page.dart'
    show
        kItemTypeValueCn,
        kFireModeCn,
        kAttachSubTypeCn,
        kItemClassValueCn,
        descValue;
import 'package:refuge_next/src/widgets/ship_info_neo/cooler_info_card.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/personal_weapon_info_card.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/power_plant_info_card.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/quantum_drive_info_card.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/shield_info_card.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/vehicle_weapon_info_card.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/weapon_attachment_info_card.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/vehicle_info_card.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/vehicle_detail_page.dart'
    show kVehicleCareerCn, kShieldFaceTypeCn;
import 'database_top_bar.dart';

/// 数据库:游戏内所有数据的查询入口。
/// 顶部横向类别菜单(仿商店),下方为带题图的卡片列表(仿 AI 舰船卡)。
/// 本期「载具」接真实数据,其余类别占位。
class DatabasePage extends StatefulWidget {
  const DatabasePage({super.key});

  @override
  State<DatabasePage> createState() => _DatabasePageState();
}

class _DatabasePageState extends State<DatabasePage> {
  final PageController _pageController = PageController();
  final CustomTabBarController _tabBarController = CustomTabBarController();

  static const _titles = [
    '载具',
    '载具武器',
    '个人武器',
    '配件',
    '护盾',
    '冷却器',
    '发电机',
    '量子引擎',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildTab(BuildContext context, int index) {
    return TabBarItem(
      index: index,
      transform: ColorsTransform(
        highlightColor: Theme.of(context).primaryColor,
        normalColor: Theme.of(context).colorScheme.onSurface,
        builder: (context, color) {
          return Container(
            padding: const EdgeInsets.all(2),
            alignment: Alignment.center,
            constraints: const BoxConstraints(minWidth: 64),
            child: Text(
              _titles[index],
              style: TextStyle(fontSize: 14, color: color),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DatabaseTopBar(),
        SizedBox(
          height: 34,
          child: CustomTabBar(
            tabBarController: _tabBarController,
            height: 30,
            itemCount: _titles.length,
            builder: _buildTab,
            indicator: StandardIndicator(
              color: Theme.of(context).primaryColor,
              radius: const BorderRadius.all(Radius.circular(5)),
              width: 40,
            ),
            pageController: _pageController,
          ),
        ),
        const SizedBox(height: 6),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: _titles.length,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return const _VehicleDbList();
                case 1:
                  return const _VehicleWeaponDbList();
                case 2:
                  return const _PersonalWeaponDbList();
                case 3:
                  return const _AttachmentDbList();
                case 4:
                  return const _ShieldDbList();
                case 5:
                  return const _CoolerDbList();
                case 6:
                  return const _PowerPlantDbList();
                case 7:
                  return const _QuantumDriveDbList();
                default:
                  return _ComingSoon(_titles[index]);
              }
            },
          ),
        ),
      ],
    );
  }
}

/// 载具列表:带题图的舰船卡(`VehicleInfoCard`),点击进详情。
class _VehicleDbList extends StatefulWidget {
  const _VehicleDbList();

  @override
  State<_VehicleDbList> createState() => _VehicleDbListState();
}

/// 一个排序字段(标签 + 取值);T 为列表元素类型。
class _SortField<T> {
  const _SortField(this.label, this.value);
  final String label;
  final num? Function(T) value;
}

class _VehicleDbListState extends State<_VehicleDbList>
    with AutomaticKeepAliveClientMixin {
  List<GameVehicle> _vehicles = const [];
  bool _loading = true;

  // 排序 / 筛选状态
  late final List<_SortField<GameVehicle>> _sortFields = [
    _SortField('价格(USD)', _usd),
    _SortField('价格(aUEC)', _auec),
    _SortField('SCM速度', (v) => v.speed?.scm),
    _SortField('最大速度', (v) => v.speed?.max),
    _SortField('货舱(SCU)', (v) => v.cargoCapacity),
    _SortField('矿舱(SCU)', (v) => v.oreCapacity),
    _SortField('生命值', (v) => v.health),
    _SortField('护盾值', (v) => v.shield?.hp),
  ];
  int? _sortIndex; // null = 默认(不排序)
  bool _asc = false; // 默认降序(从高到低)
  final Set<String> _fManufacturers = {};
  final Set<String> _fCareers = {};
  final Set<String> _fTypes = {}; // 飞船/反重力载具/地面载具
  final Set<String> _fShield = {}; // Bubble/Quadrant(原始值)

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  /// 仅保留 uuid 存在于 ship_alias 中的舰船(剔除变体/NPC/测试条目)。
  /// 别名缓存为空(极端:未下载)时回退展示全量,避免列表空白。
  Future<List<GameVehicle>> _onlyAliasShips(List<GameVehicle> list) async {
    await ShipAliasRepo().getShipAliases();
    final uuids = <String>{
      for (final a in ShipAliasRepo().getShipAliasesSync())
        if (a.uuid != null && a.uuid!.isNotEmpty) a.uuid!,
    };
    if (uuids.isEmpty) return list;
    return list.where((v) => v.uuid != null && uuids.contains(v.uuid)).toList();
  }

  /// 读本地全量载具;本地为空则联网下载后再读;再按 ship_alias 过滤。
  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      var list = await GameVehicleRepo().getVehicles();
      if (list.isEmpty) {
        await GameVehicleRepo().refresh();
        list = await GameVehicleRepo().getVehicles();
      }
      list = await _onlyAliasShips(list);
      if (!mounted) return;
      setState(() {
        _vehicles = list;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  /// 下拉刷新:重新联网拉取最新载具,再按 ship_alias 过滤。
  Future<void> _refresh() async {
    try {
      await GameVehicleRepo().refresh();
      var list = await GameVehicleRepo().getVehicles();
      list = await _onlyAliasShips(list);
      if (!mounted) return;
      setState(() => _vehicles = list);
    } catch (_) {
      // 失败保留现有数据
    }
  }

  // —— 价格 ——
  /// USD:取最高 SKU 价,回退 msrp。
  num? _usd(GameVehicle v) {
    num? usd;
    for (final sku in v.skus ?? const <VehicleSku>[]) {
      final p = sku.price;
      if (p != null && (usd == null || p > usd)) usd = p;
    }
    return usd ?? v.msrp;
  }

  /// aUEC:取 UEX 各终端最高购买价。
  num? _auec(GameVehicle v) {
    num? auec;
    for (final p in v.uexPrices?.purchase ?? const <UexPrice>[]) {
      final b = p.priceBuy;
      if (b != null && (auec == null || b > auec)) auec = b;
    }
    return auec;
  }

  /// 载具类型(按 飞船 > 重力 > 地面 优先级单归类)。
  String? _typeOf(GameVehicle v) => v.isSpaceship == true
      ? '飞船'
      : v.isGravlev == true
          ? '反重力载具'
          : v.isVehicle == true
              ? '地面载具'
              : null;

  /// 当前筛选 + 排序后的可见列表。
  List<GameVehicle> get _visible {
    var list = _vehicles.where((v) {
      if (_fManufacturers.isNotEmpty &&
          !_fManufacturers.contains(v.manufacturer?.name)) {
        return false;
      }
      if (_fCareers.isNotEmpty && !_fCareers.contains(v.career)) {
        return false;
      }
      if (_fTypes.isNotEmpty && !_fTypes.contains(_typeOf(v))) {
        return false;
      }
      if (_fShield.isNotEmpty && !_fShield.contains(v.shield?.faceType)) {
        return false;
      }
      return true;
    }).toList();

    final i = _sortIndex;
    if (i != null) {
      final value = _sortFields[i].value;
      list.sort((a, b) {
        final pa = value(a), pb = value(b);
        if (pa == null && pb == null) return 0;
        if (pa == null) return 1; // null 永远排末尾
        if (pb == null) return -1;
        return _asc ? pa.compareTo(pb) : pb.compareTo(pa);
      });
    }
    return list;
  }

  int get _filterCount =>
      _fManufacturers.length +
      _fCareers.length +
      _fTypes.length +
      _fShield.length;

  String get _sortLabel =>
      _sortIndex == null ? '默认' : _sortFields[_sortIndex!].label;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_vehicles.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.inbox_outlined, size: 40, color: Colors.grey),
            const SizedBox(height: 10),
            const Text('暂无载具数据', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 10),
            OutlinedButton(onPressed: _load, child: const Text('重试')),
          ],
        ),
      );
    }
    final visible = _visible;
    return Column(
      children: [
        _toolbar(visible.length),
        Expanded(
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: visible.isEmpty
                ? ListView(
                    children: const [
                      SizedBox(height: 80),
                      Center(
                        child: Text('无匹配结果',
                            style: TextStyle(color: Colors.grey)),
                      ),
                    ],
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
                    itemCount: visible.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) =>
                        VehicleInfoCard(vehicle: visible[index]),
                  ),
          ),
        ),
      ],
    );
  }

  /// 排序 / 筛选 工具栏。
  Widget _toolbar(int count) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 6),
      child: Row(
        children: [
          OutlinedButton.icon(
            onPressed: _showSortSheet,
            icon: const Icon(Icons.swap_vert, size: 18),
            label: Text('排序：$_sortLabel'),
            style: OutlinedButton.styleFrom(
              visualDensity: VisualDensity.compact,
              padding: const EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          const SizedBox(width: 8),
          badges.Badge(
            showBadge: _filterCount > 0,
            badgeContent: Text('$_filterCount',
                style: const TextStyle(color: Colors.white, fontSize: 10)),
            child: OutlinedButton.icon(
              onPressed: _showFilterSheet,
              icon: const Icon(Icons.filter_list, size: 18),
              label: const Text('筛选'),
              style: OutlinedButton.styleFrom(
                visualDensity: VisualDensity.compact,
                padding: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
          const Spacer(),
          Text('$count 项',
              style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ],
      ),
    );
  }

  void _showSortSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => StatefulBuilder(
        builder: (context, setSheet) {
          void pick(int? i) {
            setSheet(() {});
            setState(() => _sortIndex = i);
          }

          Widget tile(String label, int? i) => ListTile(
                dense: true,
                title: Text(label),
                trailing: _sortIndex == i
                    ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                    : null,
                onTap: () => pick(i),
              );

          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(14),
                  child: Text('排序',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      tile('默认', null),
                      for (var i = 0; i < _sortFields.length; i++)
                        tile(_sortFields[i].label, i),
                    ],
                  ),
                ),
                if (_sortIndex != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
                    child: Row(
                      children: [
                        const Text('方向：'),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text('降序'),
                          selected: !_asc,
                          onSelected: (_) {
                            setSheet(() {});
                            setState(() => _asc = false);
                          },
                        ),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text('升序'),
                          selected: _asc,
                          onSelected: (_) {
                            setSheet(() {});
                            setState(() => _asc = true);
                          },
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 8),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showFilterSheet() {
    final manufacturers = <String>{
      for (final v in _vehicles)
        if (v.manufacturer?.name != null) v.manufacturer!.name!,
    }.toList()
      ..sort();
    final careers = <String>{
      for (final v in _vehicles)
        if (v.career != null && v.career!.isNotEmpty) v.career!,
    }.toList()
      ..sort();
    // 载具类型:仅保留数据中实际出现的(保持固定顺序)。
    final typesPresent = <String>{
      for (final v in _vehicles)
        if (_typeOf(v) != null) _typeOf(v)!,
    };
    final types = ['飞船', '反重力载具', '地面载具']
        .where(typesPresent.contains)
        .toList();
    final shields = <String>{
      for (final v in _vehicles)
        if (v.shield?.faceType != null && v.shield!.faceType!.isNotEmpty)
          v.shield!.faceType!,
    }.toList()
      ..sort();

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => StatefulBuilder(
        builder: (context, setSheet) {
          Widget chips(String title, List<String> values, Set<String> sel,
              String Function(String) label) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4, top: 12, bottom: 6),
                  child: Text(title,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    for (final v in values)
                      FilterChip(
                        label: Text(label(v)),
                        selected: sel.contains(v),
                        onSelected: (on) {
                          setSheet(() {});
                          setState(() => on ? sel.add(v) : sel.remove(v));
                        },
                      ),
                  ],
                ),
              ],
            );
          }

          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.6,
            maxChildSize: 0.92,
            builder: (context, controller) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 8, 0),
                    child: Row(
                      children: [
                        const Text('筛选',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            setSheet(() {});
                            setState(() {
                              _fManufacturers.clear();
                              _fCareers.clear();
                              _fTypes.clear();
                              _fShield.clear();
                            });
                          },
                          child: const Text('清除'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      controller: controller,
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      children: [
                        if (types.isNotEmpty)
                          chips('载具类型', types, _fTypes, (t) => t),
                        if (shields.isNotEmpty)
                          chips('护盾类型', shields, _fShield,
                              (s) => kShieldFaceTypeCn[s] ?? s),
                        chips('职能', careers, _fCareers,
                            (c) => kVehicleCareerCn[c] ?? c),
                        chips('厂商', manufacturers, _fManufacturers, (m) => m),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

/// 载具武器(机炮)列表:带题图的 [VehicleWeaponInfoCard],点击进详情。
class _VehicleWeaponDbList extends StatefulWidget {
  const _VehicleWeaponDbList();

  @override
  State<_VehicleWeaponDbList> createState() => _VehicleWeaponDbListState();
}

class _VehicleWeaponDbListState extends State<_VehicleWeaponDbList>
    with AutomaticKeepAliveClientMixin {
  List<GameItem> _items = const [];
  bool _loading = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      var list = await VehicleWeaponRepo().getVehicleWeapons();
      if (list.isEmpty) {
        await VehicleWeaponRepo().refresh();
        list = await VehicleWeaponRepo().getVehicleWeapons();
      }
      if (!mounted) return;
      setState(() {
        _items = list;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  Future<void> _refresh() async {
    try {
      await VehicleWeaponRepo().refresh();
      final list = await VehicleWeaponRepo().getVehicleWeapons();
      if (!mounted) return;
      setState(() => _items = list);
    } catch (_) {
      // 失败保留现有数据
    }
  }

  // —— 排序 / 筛选 ——
  num? _auec(GameItem i) {
    num? a;
    for (final p in i.uexPrices?.purchase ?? const <UexPrice>[]) {
      final b = p.priceBuy;
      if (b != null && (a == null || b > a)) a = b;
    }
    return a;
  }

  late final List<_SortField<GameItem>> _sortFields = [
    _SortField('价格(aUEC)', _auec),
    _SortField('Alpha 伤害', (i) => i.vehicleWeapon?.damage?.alphaTotal),
    _SortField('Burst 伤害', (i) => i.vehicleWeapon?.damage?.burst),
  ];
  int? _sortIndex;
  bool _asc = false;
  final Set<String> _fManufacturers = {};
  final Set<String> _fTypes = {}; // vehicleWeapon.type 原始值
  final Set<String> _fSizes = {}; // size.toString()

  List<GameItem> get _visible {
    var list = _items.where((i) {
      if (_fManufacturers.isNotEmpty &&
          !_fManufacturers.contains(i.manufacturer?.name)) {
        return false;
      }
      if (_fTypes.isNotEmpty && !_fTypes.contains(i.vehicleWeapon?.type)) {
        return false;
      }
      if (_fSizes.isNotEmpty && !_fSizes.contains(i.size?.toString())) {
        return false;
      }
      return true;
    }).toList();

    final idx = _sortIndex;
    if (idx != null) {
      final value = _sortFields[idx].value;
      list.sort((a, b) {
        final pa = value(a), pb = value(b);
        if (pa == null && pb == null) return 0;
        if (pa == null) return 1;
        if (pb == null) return -1;
        return _asc ? pa.compareTo(pb) : pb.compareTo(pa);
      });
    }
    return list;
  }

  int get _filterCount =>
      _fManufacturers.length + _fTypes.length + _fSizes.length;

  String get _sortLabel =>
      _sortIndex == null ? '默认' : _sortFields[_sortIndex!].label;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_items.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.inbox_outlined, size: 40, color: Colors.grey),
            const SizedBox(height: 10),
            const Text('暂无载具武器数据', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 10),
            OutlinedButton(onPressed: _load, child: const Text('重试')),
          ],
        ),
      );
    }
    final visible = _visible;
    return Column(
      children: [
        _toolbar(visible.length),
        Expanded(
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: visible.isEmpty
                ? ListView(
                    children: const [
                      SizedBox(height: 80),
                      Center(
                        child: Text('无匹配结果',
                            style: TextStyle(color: Colors.grey)),
                      ),
                    ],
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
                    itemCount: visible.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) =>
                        VehicleWeaponInfoCard(item: visible[index]),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _toolbar(int count) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 6),
      child: Row(
        children: [
          OutlinedButton.icon(
            onPressed: _showSortSheet,
            icon: const Icon(Icons.swap_vert, size: 18),
            label: Text('排序：$_sortLabel'),
            style: OutlinedButton.styleFrom(
              visualDensity: VisualDensity.compact,
              padding: const EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          const SizedBox(width: 8),
          badges.Badge(
            showBadge: _filterCount > 0,
            badgeContent: Text('$_filterCount',
                style: const TextStyle(color: Colors.white, fontSize: 10)),
            child: OutlinedButton.icon(
              onPressed: _showFilterSheet,
              icon: const Icon(Icons.filter_list, size: 18),
              label: const Text('筛选'),
              style: OutlinedButton.styleFrom(
                visualDensity: VisualDensity.compact,
                padding: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
          const Spacer(),
          Text('$count 项',
              style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ],
      ),
    );
  }

  void _showSortSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => StatefulBuilder(
        builder: (context, setSheet) {
          void pick(int? i) {
            setSheet(() {});
            setState(() => _sortIndex = i);
          }

          Widget tile(String label, int? i) => ListTile(
                dense: true,
                title: Text(label),
                trailing: _sortIndex == i
                    ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                    : null,
                onTap: () => pick(i),
              );

          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(14),
                  child: Text('排序',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      tile('默认', null),
                      for (var i = 0; i < _sortFields.length; i++)
                        tile(_sortFields[i].label, i),
                    ],
                  ),
                ),
                if (_sortIndex != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
                    child: Row(
                      children: [
                        const Text('方向：'),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text('降序'),
                          selected: !_asc,
                          onSelected: (_) {
                            setSheet(() {});
                            setState(() => _asc = false);
                          },
                        ),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text('升序'),
                          selected: _asc,
                          onSelected: (_) {
                            setSheet(() {});
                            setState(() => _asc = true);
                          },
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 8),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showFilterSheet() {
    final manufacturers = <String>{
      for (final i in _items)
        if (i.manufacturer?.name != null) i.manufacturer!.name!,
    }.toList()
      ..sort();
    final types = <String>{
      for (final i in _items)
        if (i.vehicleWeapon?.type != null && i.vehicleWeapon!.type!.isNotEmpty)
          i.vehicleWeapon!.type!,
    }.toList()
      ..sort();
    final sizes = <String>{
      for (final i in _items)
        if (i.size != null) i.size!.toString(),
    }.toList()
      ..sort((a, b) => int.parse(a).compareTo(int.parse(b)));

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => StatefulBuilder(
        builder: (context, setSheet) {
          Widget chips(String title, List<String> values, Set<String> sel,
              String Function(String) label) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4, top: 12, bottom: 6),
                  child: Text(title,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    for (final v in values)
                      FilterChip(
                        label: Text(label(v)),
                        selected: sel.contains(v),
                        onSelected: (on) {
                          setSheet(() {});
                          setState(() => on ? sel.add(v) : sel.remove(v));
                        },
                      ),
                  ],
                ),
              ],
            );
          }

          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.6,
            maxChildSize: 0.92,
            builder: (context, controller) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 8, 0),
                    child: Row(
                      children: [
                        const Text('筛选',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            setSheet(() {});
                            setState(() {
                              _fManufacturers.clear();
                              _fTypes.clear();
                              _fSizes.clear();
                            });
                          },
                          child: const Text('清除'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      controller: controller,
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      children: [
                        if (types.isNotEmpty)
                          chips('类型', types, _fTypes,
                              (t) => kItemTypeValueCn[t] ?? t),
                        if (sizes.isNotEmpty)
                          chips('尺寸', sizes, _fSizes, (s) => 'S$s'),
                        chips('厂商', manufacturers, _fManufacturers, (m) => m),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

/// FPS 武器列表:带题图的 [PersonalWeaponInfoCard],点击进详情;带排序/筛选。
class _PersonalWeaponDbList extends StatefulWidget {
  const _PersonalWeaponDbList();

  @override
  State<_PersonalWeaponDbList> createState() => _PersonalWeaponDbListState();
}

class _PersonalWeaponDbListState extends State<_PersonalWeaponDbList>
    with AutomaticKeepAliveClientMixin {
  List<GameItem> _items = const [];
  bool _loading = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      var list = await PersonalWeaponRepo().getPersonalWeapons();
      if (list.isEmpty) {
        await PersonalWeaponRepo().refresh();
        list = await PersonalWeaponRepo().getPersonalWeapons();
      }
      if (!mounted) return;
      setState(() {
        _items = list;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  Future<void> _refresh() async {
    try {
      await PersonalWeaponRepo().refresh();
      final list = await PersonalWeaponRepo().getPersonalWeapons();
      if (!mounted) return;
      setState(() => _items = list);
    } catch (_) {
      // 失败保留现有数据
    }
  }

  // —— 排序 / 筛选 ——
  num? _auec(GameItem i) {
    num? a;
    for (final p in i.uexPrices?.purchase ?? const <UexPrice>[]) {
      final b = p.priceBuy;
      if (b != null && (a == null || b > a)) a = b;
    }
    return a;
  }

  late final List<_SortField<GameItem>> _sortFields = [
    _SortField('价格(aUEC)', _auec),
    _SortField('DPS', (i) => i.personalWeapon?.damage?.dpsTotal),
    _SortField('射程', (i) => i.personalWeapon?.range),
    _SortField('RPM', (i) => i.personalWeapon?.rpm),
  ];
  int? _sortIndex;
  bool _asc = false;
  final Set<String> _fTypes = {}; // personalWeapon.type
  final Set<String> _fSizes = {}; // size.toString()
  final Set<String> _fFireModes = {}; // personalWeapon.fireMode

  List<GameItem> get _visible {
    var list = _items.where((i) {
      if (_fTypes.isNotEmpty && !_fTypes.contains(i.personalWeapon?.type)) {
        return false;
      }
      if (_fSizes.isNotEmpty && !_fSizes.contains(i.size?.toString())) {
        return false;
      }
      if (_fFireModes.isNotEmpty &&
          !_fFireModes.contains(i.personalWeapon?.fireMode)) {
        return false;
      }
      return true;
    }).toList();

    final idx = _sortIndex;
    if (idx != null) {
      final value = _sortFields[idx].value;
      list.sort((a, b) {
        final pa = value(a), pb = value(b);
        if (pa == null && pb == null) return 0;
        if (pa == null) return 1;
        if (pb == null) return -1;
        return _asc ? pa.compareTo(pb) : pb.compareTo(pa);
      });
    }
    return list;
  }

  int get _filterCount =>
      _fTypes.length + _fSizes.length + _fFireModes.length;

  String get _sortLabel =>
      _sortIndex == null ? '默认' : _sortFields[_sortIndex!].label;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_items.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.inbox_outlined, size: 40, color: Colors.grey),
            const SizedBox(height: 10),
            const Text('暂无 FPS 武器数据', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 10),
            OutlinedButton(onPressed: _load, child: const Text('重试')),
          ],
        ),
      );
    }
    final visible = _visible;
    return Column(
      children: [
        _toolbar(visible.length),
        Expanded(
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: visible.isEmpty
                ? ListView(
                    children: const [
                      SizedBox(height: 80),
                      Center(
                        child: Text('无匹配结果',
                            style: TextStyle(color: Colors.grey)),
                      ),
                    ],
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
                    itemCount: visible.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) =>
                        PersonalWeaponInfoCard(item: visible[index]),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _toolbar(int count) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 6),
      child: Row(
        children: [
          OutlinedButton.icon(
            onPressed: _showSortSheet,
            icon: const Icon(Icons.swap_vert, size: 18),
            label: Text('排序：$_sortLabel'),
            style: OutlinedButton.styleFrom(
              visualDensity: VisualDensity.compact,
              padding: const EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          const SizedBox(width: 8),
          badges.Badge(
            showBadge: _filterCount > 0,
            badgeContent: Text('$_filterCount',
                style: const TextStyle(color: Colors.white, fontSize: 10)),
            child: OutlinedButton.icon(
              onPressed: _showFilterSheet,
              icon: const Icon(Icons.filter_list, size: 18),
              label: const Text('筛选'),
              style: OutlinedButton.styleFrom(
                visualDensity: VisualDensity.compact,
                padding: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
          const Spacer(),
          Text('$count 项',
              style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ],
      ),
    );
  }

  void _showSortSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => StatefulBuilder(
        builder: (context, setSheet) {
          void pick(int? i) {
            setSheet(() {});
            setState(() => _sortIndex = i);
          }

          Widget tile(String label, int? i) => ListTile(
                dense: true,
                title: Text(label),
                trailing: _sortIndex == i
                    ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                    : null,
                onTap: () => pick(i),
              );

          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(14),
                  child: Text('排序',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      tile('默认', null),
                      for (var i = 0; i < _sortFields.length; i++)
                        tile(_sortFields[i].label, i),
                    ],
                  ),
                ),
                if (_sortIndex != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
                    child: Row(
                      children: [
                        const Text('方向：'),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text('降序'),
                          selected: !_asc,
                          onSelected: (_) {
                            setSheet(() {});
                            setState(() => _asc = false);
                          },
                        ),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text('升序'),
                          selected: _asc,
                          onSelected: (_) {
                            setSheet(() {});
                            setState(() => _asc = true);
                          },
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 8),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showFilterSheet() {
    final types = <String>{
      for (final i in _items)
        if (i.personalWeapon?.type != null &&
            i.personalWeapon!.type!.isNotEmpty)
          i.personalWeapon!.type!,
    }.toList()
      ..sort();
    final sizes = <String>{
      for (final i in _items)
        if (i.size != null) i.size!.toString(),
    }.toList()
      ..sort((a, b) => int.parse(a).compareTo(int.parse(b)));
    final fireModes = <String>{
      for (final i in _items)
        if (i.personalWeapon?.fireMode != null &&
            i.personalWeapon!.fireMode!.isNotEmpty)
          i.personalWeapon!.fireMode!,
    }.toList()
      ..sort();

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => StatefulBuilder(
        builder: (context, setSheet) {
          Widget chips(String title, List<String> values, Set<String> sel,
              String Function(String) label) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4, top: 12, bottom: 6),
                  child: Text(title,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    for (final v in values)
                      FilterChip(
                        label: Text(label(v)),
                        selected: sel.contains(v),
                        onSelected: (on) {
                          setSheet(() {});
                          setState(() => on ? sel.add(v) : sel.remove(v));
                        },
                      ),
                  ],
                ),
              ],
            );
          }

          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.6,
            maxChildSize: 0.92,
            builder: (context, controller) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 8, 0),
                    child: Row(
                      children: [
                        const Text('筛选',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            setSheet(() {});
                            setState(() {
                              _fTypes.clear();
                              _fSizes.clear();
                              _fFireModes.clear();
                            });
                          },
                          child: const Text('清除'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      controller: controller,
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      children: [
                        if (types.isNotEmpty)
                          chips('类型', types, _fTypes,
                              (t) => kItemTypeValueCn[t] ?? t),
                        if (sizes.isNotEmpty)
                          chips('尺寸', sizes, _fSizes, (s) => 'S$s'),
                        if (fireModes.isNotEmpty)
                          chips('射击模式', fireModes, _fFireModes,
                              (f) => kFireModeCn[f] ?? f),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

/// 武器配件列表:带题图的 [WeaponAttachmentInfoCard],点击进详情;带排序/筛选。
class _AttachmentDbList extends StatefulWidget {
  const _AttachmentDbList();

  @override
  State<_AttachmentDbList> createState() => _AttachmentDbListState();
}

class _AttachmentDbListState extends State<_AttachmentDbList>
    with AutomaticKeepAliveClientMixin {
  List<GameItem> _items = const [];
  bool _loading = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      var list = await WeaponAttachmentRepo().getWeaponAttachments();
      if (list.isEmpty) {
        await WeaponAttachmentRepo().refresh();
        list = await WeaponAttachmentRepo().getWeaponAttachments();
      }
      if (!mounted) return;
      setState(() {
        _items = list;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  Future<void> _refresh() async {
    try {
      await WeaponAttachmentRepo().refresh();
      final list = await WeaponAttachmentRepo().getWeaponAttachments();
      if (!mounted) return;
      setState(() => _items = list);
    } catch (_) {
      // 失败保留现有数据
    }
  }

  // —— 排序 / 筛选 ——
  num? _auec(GameItem i) {
    num? a;
    for (final p in i.uexPrices?.purchase ?? const <UexPrice>[]) {
      final b = p.priceBuy;
      if (b != null && (a == null || b > a)) a = b;
    }
    return a;
  }

  late final List<_SortField<GameItem>> _sortFields = [
    _SortField('价格(aUEC)', _auec),
  ];
  int? _sortIndex;
  bool _asc = false;
  final Set<String> _fTypes = {}; // subType
  final Set<String> _fSizes = {}; // size.toString()

  List<GameItem> get _visible {
    var list = _items.where((i) {
      if (_fTypes.isNotEmpty && !_fTypes.contains(i.subType)) {
        return false;
      }
      if (_fSizes.isNotEmpty && !_fSizes.contains(i.size?.toString())) {
        return false;
      }
      return true;
    }).toList();

    final idx = _sortIndex;
    if (idx != null) {
      final value = _sortFields[idx].value;
      list.sort((a, b) {
        final pa = value(a), pb = value(b);
        if (pa == null && pb == null) return 0;
        if (pa == null) return 1;
        if (pb == null) return -1;
        return _asc ? pa.compareTo(pb) : pb.compareTo(pa);
      });
    }
    return list;
  }

  int get _filterCount => _fTypes.length + _fSizes.length;

  String get _sortLabel =>
      _sortIndex == null ? '默认' : _sortFields[_sortIndex!].label;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_items.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.inbox_outlined, size: 40, color: Colors.grey),
            const SizedBox(height: 10),
            const Text('暂无配件数据', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 10),
            OutlinedButton(onPressed: _load, child: const Text('重试')),
          ],
        ),
      );
    }
    final visible = _visible;
    return Column(
      children: [
        _toolbar(visible.length),
        Expanded(
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: visible.isEmpty
                ? ListView(
                    children: const [
                      SizedBox(height: 80),
                      Center(
                        child: Text('无匹配结果',
                            style: TextStyle(color: Colors.grey)),
                      ),
                    ],
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
                    itemCount: visible.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) =>
                        WeaponAttachmentInfoCard(item: visible[index]),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _toolbar(int count) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 6),
      child: Row(
        children: [
          OutlinedButton.icon(
            onPressed: _showSortSheet,
            icon: const Icon(Icons.swap_vert, size: 18),
            label: Text('排序：$_sortLabel'),
            style: OutlinedButton.styleFrom(
              visualDensity: VisualDensity.compact,
              padding: const EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          const SizedBox(width: 8),
          badges.Badge(
            showBadge: _filterCount > 0,
            badgeContent: Text('$_filterCount',
                style: const TextStyle(color: Colors.white, fontSize: 10)),
            child: OutlinedButton.icon(
              onPressed: _showFilterSheet,
              icon: const Icon(Icons.filter_list, size: 18),
              label: const Text('筛选'),
              style: OutlinedButton.styleFrom(
                visualDensity: VisualDensity.compact,
                padding: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
          const Spacer(),
          Text('$count 项',
              style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ],
      ),
    );
  }

  void _showSortSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => StatefulBuilder(
        builder: (context, setSheet) {
          void pick(int? i) {
            setSheet(() {});
            setState(() => _sortIndex = i);
          }

          Widget tile(String label, int? i) => ListTile(
                dense: true,
                title: Text(label),
                trailing: _sortIndex == i
                    ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                    : null,
                onTap: () => pick(i),
              );

          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(14),
                  child: Text('排序',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      tile('默认', null),
                      for (var i = 0; i < _sortFields.length; i++)
                        tile(_sortFields[i].label, i),
                    ],
                  ),
                ),
                if (_sortIndex != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
                    child: Row(
                      children: [
                        const Text('方向：'),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text('降序'),
                          selected: !_asc,
                          onSelected: (_) {
                            setSheet(() {});
                            setState(() => _asc = false);
                          },
                        ),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text('升序'),
                          selected: _asc,
                          onSelected: (_) {
                            setSheet(() {});
                            setState(() => _asc = true);
                          },
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 8),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showFilterSheet() {
    final types = <String>{
      for (final i in _items)
        if (i.subType != null && i.subType!.isNotEmpty) i.subType!,
    }.toList()
      ..sort();
    final sizes = <String>{
      for (final i in _items)
        if (i.size != null) i.size!.toString(),
    }.toList()
      ..sort((a, b) => int.parse(a).compareTo(int.parse(b)));

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => StatefulBuilder(
        builder: (context, setSheet) {
          Widget chips(String title, List<String> values, Set<String> sel,
              String Function(String) label) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4, top: 12, bottom: 6),
                  child: Text(title,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    for (final v in values)
                      FilterChip(
                        label: Text(label(v)),
                        selected: sel.contains(v),
                        onSelected: (on) {
                          setSheet(() {});
                          setState(() => on ? sel.add(v) : sel.remove(v));
                        },
                      ),
                  ],
                ),
              ],
            );
          }

          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.6,
            maxChildSize: 0.92,
            builder: (context, controller) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 8, 0),
                    child: Row(
                      children: [
                        const Text('筛选',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            setSheet(() {});
                            setState(() {
                              _fTypes.clear();
                              _fSizes.clear();
                            });
                          },
                          child: const Text('清除'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      controller: controller,
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      children: [
                        if (types.isNotEmpty)
                          chips('类型', types, _fTypes,
                              (t) => kAttachSubTypeCn[t] ?? t),
                        if (sizes.isNotEmpty)
                          chips('尺寸', sizes, _fSizes, (s) => 'S$s'),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

/// 护盾列表:带题图的 [ShieldInfoCard],点击进详情;带排序/筛选。
class _ShieldDbList extends StatefulWidget {
  const _ShieldDbList();

  @override
  State<_ShieldDbList> createState() => _ShieldDbListState();
}

class _ShieldDbListState extends State<_ShieldDbList>
    with AutomaticKeepAliveClientMixin {
  List<GameItem> _items = const [];
  bool _loading = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      var list = await ShieldRepo().getShields();
      if (list.isEmpty) {
        await ShieldRepo().refresh();
        list = await ShieldRepo().getShields();
      }
      if (!mounted) return;
      setState(() {
        _items = list;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  Future<void> _refresh() async {
    try {
      await ShieldRepo().refresh();
      final list = await ShieldRepo().getShields();
      if (!mounted) return;
      setState(() => _items = list);
    } catch (_) {
      // 失败保留现有数据
    }
  }

  // —— 排序 / 筛选 ——
  num? _auec(GameItem i) {
    num? a;
    for (final p in i.uexPrices?.purchase ?? const <UexPrice>[]) {
      final b = p.priceBuy;
      if (b != null && (a == null || b > a)) a = b;
    }
    return a;
  }

  late final List<_SortField<GameItem>> _sortFields = [
    _SortField('价格(aUEC)', _auec),
    _SortField('护盾值', (i) => i.shield?.maxHealth),
    _SortField('回复速率', (i) => i.shield?.regenRate),
  ];
  int? _sortIndex;
  bool _asc = false;
  final Set<String> _fClasses = {}; // descriptionData Class
  final Set<String> _fSizes = {}; // size.toString()
  final Set<String> _fGrades = {}; // grade

  List<GameItem> get _visible {
    var list = _items.where((i) {
      if (_fClasses.isNotEmpty && !_fClasses.contains(descValue(i, 'Class'))) {
        return false;
      }
      if (_fSizes.isNotEmpty && !_fSizes.contains(i.size?.toString())) {
        return false;
      }
      if (_fGrades.isNotEmpty && !_fGrades.contains(i.grade)) {
        return false;
      }
      return true;
    }).toList();

    final idx = _sortIndex;
    if (idx != null) {
      final value = _sortFields[idx].value;
      list.sort((a, b) {
        final pa = value(a), pb = value(b);
        if (pa == null && pb == null) return 0;
        if (pa == null) return 1;
        if (pb == null) return -1;
        return _asc ? pa.compareTo(pb) : pb.compareTo(pa);
      });
    }
    return list;
  }

  int get _filterCount =>
      _fClasses.length + _fSizes.length + _fGrades.length;

  String get _sortLabel =>
      _sortIndex == null ? '默认' : _sortFields[_sortIndex!].label;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_items.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.inbox_outlined, size: 40, color: Colors.grey),
            const SizedBox(height: 10),
            const Text('暂无护盾数据', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 10),
            OutlinedButton(onPressed: _load, child: const Text('重试')),
          ],
        ),
      );
    }
    final visible = _visible;
    return Column(
      children: [
        _toolbar(visible.length),
        Expanded(
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: visible.isEmpty
                ? ListView(
                    children: const [
                      SizedBox(height: 80),
                      Center(
                        child: Text('无匹配结果',
                            style: TextStyle(color: Colors.grey)),
                      ),
                    ],
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
                    itemCount: visible.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) =>
                        ShieldInfoCard(item: visible[index]),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _toolbar(int count) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 6),
      child: Row(
        children: [
          OutlinedButton.icon(
            onPressed: _showSortSheet,
            icon: const Icon(Icons.swap_vert, size: 18),
            label: Text('排序：$_sortLabel'),
            style: OutlinedButton.styleFrom(
              visualDensity: VisualDensity.compact,
              padding: const EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          const SizedBox(width: 8),
          badges.Badge(
            showBadge: _filterCount > 0,
            badgeContent: Text('$_filterCount',
                style: const TextStyle(color: Colors.white, fontSize: 10)),
            child: OutlinedButton.icon(
              onPressed: _showFilterSheet,
              icon: const Icon(Icons.filter_list, size: 18),
              label: const Text('筛选'),
              style: OutlinedButton.styleFrom(
                visualDensity: VisualDensity.compact,
                padding: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
          const Spacer(),
          Text('$count 项',
              style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ],
      ),
    );
  }

  void _showSortSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => StatefulBuilder(
        builder: (context, setSheet) {
          void pick(int? i) {
            setSheet(() {});
            setState(() => _sortIndex = i);
          }

          Widget tile(String label, int? i) => ListTile(
                dense: true,
                title: Text(label),
                trailing: _sortIndex == i
                    ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                    : null,
                onTap: () => pick(i),
              );

          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(14),
                  child: Text('排序',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      tile('默认', null),
                      for (var i = 0; i < _sortFields.length; i++)
                        tile(_sortFields[i].label, i),
                    ],
                  ),
                ),
                if (_sortIndex != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
                    child: Row(
                      children: [
                        const Text('方向：'),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text('降序'),
                          selected: !_asc,
                          onSelected: (_) {
                            setSheet(() {});
                            setState(() => _asc = false);
                          },
                        ),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text('升序'),
                          selected: _asc,
                          onSelected: (_) {
                            setSheet(() {});
                            setState(() => _asc = true);
                          },
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 8),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showFilterSheet() {
    final classes = <String>{
      for (final i in _items)
        if (descValue(i, 'Class') case final c?) c,
    }.toList()
      ..sort();
    final sizes = <String>{
      for (final i in _items)
        if (i.size != null) i.size!.toString(),
    }.toList()
      ..sort((a, b) => int.parse(a).compareTo(int.parse(b)));
    final grades = <String>{
      for (final i in _items)
        if (i.grade != null && i.grade!.isNotEmpty) i.grade!,
    }.toList()
      ..sort();

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => StatefulBuilder(
        builder: (context, setSheet) {
          Widget chips(String title, List<String> values, Set<String> sel,
              String Function(String) label) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4, top: 12, bottom: 6),
                  child: Text(title,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    for (final v in values)
                      FilterChip(
                        label: Text(label(v)),
                        selected: sel.contains(v),
                        onSelected: (on) {
                          setSheet(() {});
                          setState(() => on ? sel.add(v) : sel.remove(v));
                        },
                      ),
                  ],
                ),
              ],
            );
          }

          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.6,
            maxChildSize: 0.92,
            builder: (context, controller) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 8, 0),
                    child: Row(
                      children: [
                        const Text('筛选',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            setSheet(() {});
                            setState(() {
                              _fClasses.clear();
                              _fSizes.clear();
                              _fGrades.clear();
                            });
                          },
                          child: const Text('清除'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      controller: controller,
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      children: [
                        if (classes.isNotEmpty)
                          chips('类别', classes, _fClasses,
                              (c) => kItemClassValueCn[c] ?? c),
                        if (sizes.isNotEmpty)
                          chips('尺寸', sizes, _fSizes, (s) => 'S$s'),
                        if (grades.isNotEmpty)
                          chips('等级', grades, _fGrades, (g) => g),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

/// 冷却器列表:带题图的 [CoolerInfoCard],点击进详情;带排序/筛选。
class _CoolerDbList extends StatefulWidget {
  const _CoolerDbList();

  @override
  State<_CoolerDbList> createState() => _CoolerDbListState();
}

class _CoolerDbListState extends State<_CoolerDbList>
    with AutomaticKeepAliveClientMixin {
  List<GameItem> _items = const [];
  bool _loading = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      var list = await CoolerRepo().getCoolers();
      if (list.isEmpty) {
        await CoolerRepo().refresh();
        list = await CoolerRepo().getCoolers();
      }
      if (!mounted) return;
      setState(() {
        _items = list;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  Future<void> _refresh() async {
    try {
      await CoolerRepo().refresh();
      final list = await CoolerRepo().getCoolers();
      if (!mounted) return;
      setState(() => _items = list);
    } catch (_) {
      // 失败保留现有数据
    }
  }

  // —— 排序 / 筛选 ——
  num? _auec(GameItem i) {
    num? a;
    for (final p in i.uexPrices?.purchase ?? const <UexPrice>[]) {
      final b = p.priceBuy;
      if (b != null && (a == null || b > a)) a = b;
    }
    return a;
  }

  late final List<_SortField<GameItem>> _sortFields = [
    _SortField('价格(aUEC)', _auec),
    _SortField('制冷速率', (i) => i.cooler?.coolingRate),
  ];
  int? _sortIndex;
  bool _asc = false;
  final Set<String> _fClasses = {}; // descriptionData Class
  final Set<String> _fSizes = {}; // size.toString()
  final Set<String> _fGrades = {}; // grade

  List<GameItem> get _visible {
    var list = _items.where((i) {
      if (_fClasses.isNotEmpty && !_fClasses.contains(descValue(i, 'Class'))) {
        return false;
      }
      if (_fSizes.isNotEmpty && !_fSizes.contains(i.size?.toString())) {
        return false;
      }
      if (_fGrades.isNotEmpty && !_fGrades.contains(i.grade)) {
        return false;
      }
      return true;
    }).toList();

    final idx = _sortIndex;
    if (idx != null) {
      final value = _sortFields[idx].value;
      list.sort((a, b) {
        final pa = value(a), pb = value(b);
        if (pa == null && pb == null) return 0;
        if (pa == null) return 1;
        if (pb == null) return -1;
        return _asc ? pa.compareTo(pb) : pb.compareTo(pa);
      });
    }
    return list;
  }

  int get _filterCount =>
      _fClasses.length + _fSizes.length + _fGrades.length;

  String get _sortLabel =>
      _sortIndex == null ? '默认' : _sortFields[_sortIndex!].label;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_items.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.inbox_outlined, size: 40, color: Colors.grey),
            const SizedBox(height: 10),
            const Text('暂无冷却器数据', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 10),
            OutlinedButton(onPressed: _load, child: const Text('重试')),
          ],
        ),
      );
    }
    final visible = _visible;
    return Column(
      children: [
        _toolbar(visible.length),
        Expanded(
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: visible.isEmpty
                ? ListView(
                    children: const [
                      SizedBox(height: 80),
                      Center(
                        child: Text('无匹配结果',
                            style: TextStyle(color: Colors.grey)),
                      ),
                    ],
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
                    itemCount: visible.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) =>
                        CoolerInfoCard(item: visible[index]),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _toolbar(int count) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 6),
      child: Row(
        children: [
          OutlinedButton.icon(
            onPressed: _showSortSheet,
            icon: const Icon(Icons.swap_vert, size: 18),
            label: Text('排序：$_sortLabel'),
            style: OutlinedButton.styleFrom(
              visualDensity: VisualDensity.compact,
              padding: const EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          const SizedBox(width: 8),
          badges.Badge(
            showBadge: _filterCount > 0,
            badgeContent: Text('$_filterCount',
                style: const TextStyle(color: Colors.white, fontSize: 10)),
            child: OutlinedButton.icon(
              onPressed: _showFilterSheet,
              icon: const Icon(Icons.filter_list, size: 18),
              label: const Text('筛选'),
              style: OutlinedButton.styleFrom(
                visualDensity: VisualDensity.compact,
                padding: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
          const Spacer(),
          Text('$count 项',
              style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ],
      ),
    );
  }

  void _showSortSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => StatefulBuilder(
        builder: (context, setSheet) {
          void pick(int? i) {
            setSheet(() {});
            setState(() => _sortIndex = i);
          }

          Widget tile(String label, int? i) => ListTile(
                dense: true,
                title: Text(label),
                trailing: _sortIndex == i
                    ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                    : null,
                onTap: () => pick(i),
              );

          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(14),
                  child: Text('排序',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      tile('默认', null),
                      for (var i = 0; i < _sortFields.length; i++)
                        tile(_sortFields[i].label, i),
                    ],
                  ),
                ),
                if (_sortIndex != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
                    child: Row(
                      children: [
                        const Text('方向：'),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text('降序'),
                          selected: !_asc,
                          onSelected: (_) {
                            setSheet(() {});
                            setState(() => _asc = false);
                          },
                        ),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text('升序'),
                          selected: _asc,
                          onSelected: (_) {
                            setSheet(() {});
                            setState(() => _asc = true);
                          },
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 8),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showFilterSheet() {
    final classes = <String>{
      for (final i in _items)
        if (descValue(i, 'Class') case final c?) c,
    }.toList()
      ..sort();
    final sizes = <String>{
      for (final i in _items)
        if (i.size != null) i.size!.toString(),
    }.toList()
      ..sort((a, b) => int.parse(a).compareTo(int.parse(b)));
    final grades = <String>{
      for (final i in _items)
        if (i.grade != null && i.grade!.isNotEmpty) i.grade!,
    }.toList()
      ..sort();

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => StatefulBuilder(
        builder: (context, setSheet) {
          Widget chips(String title, List<String> values, Set<String> sel,
              String Function(String) label) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4, top: 12, bottom: 6),
                  child: Text(title,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    for (final v in values)
                      FilterChip(
                        label: Text(label(v)),
                        selected: sel.contains(v),
                        onSelected: (on) {
                          setSheet(() {});
                          setState(() => on ? sel.add(v) : sel.remove(v));
                        },
                      ),
                  ],
                ),
              ],
            );
          }

          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.6,
            maxChildSize: 0.92,
            builder: (context, controller) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 8, 0),
                    child: Row(
                      children: [
                        const Text('筛选',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            setSheet(() {});
                            setState(() {
                              _fClasses.clear();
                              _fSizes.clear();
                              _fGrades.clear();
                            });
                          },
                          child: const Text('清除'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      controller: controller,
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      children: [
                        if (classes.isNotEmpty)
                          chips('类别', classes, _fClasses,
                              (c) => kItemClassValueCn[c] ?? c),
                        if (sizes.isNotEmpty)
                          chips('尺寸', sizes, _fSizes, (s) => 'S$s'),
                        if (grades.isNotEmpty)
                          chips('等级', grades, _fGrades, (g) => g),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

/// 发电机列表:带题图的 [PowerPlantInfoCard],点击进详情;带排序/筛选。
class _PowerPlantDbList extends StatefulWidget {
  const _PowerPlantDbList();

  @override
  State<_PowerPlantDbList> createState() => _PowerPlantDbListState();
}

class _PowerPlantDbListState extends State<_PowerPlantDbList>
    with AutomaticKeepAliveClientMixin {
  List<GameItem> _items = const [];
  bool _loading = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      var list = await PowerPlantRepo().getPowerPlants();
      if (list.isEmpty) {
        await PowerPlantRepo().refresh();
        list = await PowerPlantRepo().getPowerPlants();
      }
      if (!mounted) return;
      setState(() {
        _items = list;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  Future<void> _refresh() async {
    try {
      await PowerPlantRepo().refresh();
      final list = await PowerPlantRepo().getPowerPlants();
      if (!mounted) return;
      setState(() => _items = list);
    } catch (_) {
      // 失败保留现有数据
    }
  }

  // —— 排序 / 筛选 ——
  num? _auec(GameItem i) {
    num? a;
    for (final p in i.uexPrices?.purchase ?? const <UexPrice>[]) {
      final b = p.priceBuy;
      if (b != null && (a == null || b > a)) a = b;
    }
    return a;
  }

  late final List<_SortField<GameItem>> _sortFields = [
    _SortField('价格(aUEC)', _auec),
    _SortField('发电量', (i) => i.powerPlant?.powerSegmentGeneration),
  ];
  int? _sortIndex;
  bool _asc = false;
  final Set<String> _fClasses = {}; // descriptionData Class
  final Set<String> _fSizes = {}; // size.toString()
  final Set<String> _fGrades = {}; // grade

  List<GameItem> get _visible {
    var list = _items.where((i) {
      if (_fClasses.isNotEmpty && !_fClasses.contains(descValue(i, 'Class'))) {
        return false;
      }
      if (_fSizes.isNotEmpty && !_fSizes.contains(i.size?.toString())) {
        return false;
      }
      if (_fGrades.isNotEmpty && !_fGrades.contains(i.grade)) {
        return false;
      }
      return true;
    }).toList();

    final idx = _sortIndex;
    if (idx != null) {
      final value = _sortFields[idx].value;
      list.sort((a, b) {
        final pa = value(a), pb = value(b);
        if (pa == null && pb == null) return 0;
        if (pa == null) return 1;
        if (pb == null) return -1;
        return _asc ? pa.compareTo(pb) : pb.compareTo(pa);
      });
    }
    return list;
  }

  int get _filterCount =>
      _fClasses.length + _fSizes.length + _fGrades.length;

  String get _sortLabel =>
      _sortIndex == null ? '默认' : _sortFields[_sortIndex!].label;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_items.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.inbox_outlined, size: 40, color: Colors.grey),
            const SizedBox(height: 10),
            const Text('暂无发电机数据', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 10),
            OutlinedButton(onPressed: _load, child: const Text('重试')),
          ],
        ),
      );
    }
    final visible = _visible;
    return Column(
      children: [
        _toolbar(visible.length),
        Expanded(
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: visible.isEmpty
                ? ListView(
                    children: const [
                      SizedBox(height: 80),
                      Center(
                        child: Text('无匹配结果',
                            style: TextStyle(color: Colors.grey)),
                      ),
                    ],
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
                    itemCount: visible.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) =>
                        PowerPlantInfoCard(item: visible[index]),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _toolbar(int count) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 6),
      child: Row(
        children: [
          OutlinedButton.icon(
            onPressed: _showSortSheet,
            icon: const Icon(Icons.swap_vert, size: 18),
            label: Text('排序：$_sortLabel'),
            style: OutlinedButton.styleFrom(
              visualDensity: VisualDensity.compact,
              padding: const EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          const SizedBox(width: 8),
          badges.Badge(
            showBadge: _filterCount > 0,
            badgeContent: Text('$_filterCount',
                style: const TextStyle(color: Colors.white, fontSize: 10)),
            child: OutlinedButton.icon(
              onPressed: _showFilterSheet,
              icon: const Icon(Icons.filter_list, size: 18),
              label: const Text('筛选'),
              style: OutlinedButton.styleFrom(
                visualDensity: VisualDensity.compact,
                padding: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
          const Spacer(),
          Text('$count 项',
              style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ],
      ),
    );
  }

  void _showSortSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => StatefulBuilder(
        builder: (context, setSheet) {
          void pick(int? i) {
            setSheet(() {});
            setState(() => _sortIndex = i);
          }

          Widget tile(String label, int? i) => ListTile(
                dense: true,
                title: Text(label),
                trailing: _sortIndex == i
                    ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                    : null,
                onTap: () => pick(i),
              );

          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(14),
                  child: Text('排序',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      tile('默认', null),
                      for (var i = 0; i < _sortFields.length; i++)
                        tile(_sortFields[i].label, i),
                    ],
                  ),
                ),
                if (_sortIndex != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
                    child: Row(
                      children: [
                        const Text('方向：'),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text('降序'),
                          selected: !_asc,
                          onSelected: (_) {
                            setSheet(() {});
                            setState(() => _asc = false);
                          },
                        ),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text('升序'),
                          selected: _asc,
                          onSelected: (_) {
                            setSheet(() {});
                            setState(() => _asc = true);
                          },
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 8),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showFilterSheet() {
    final classes = <String>{
      for (final i in _items)
        if (descValue(i, 'Class') case final c?) c,
    }.toList()
      ..sort();
    final sizes = <String>{
      for (final i in _items)
        if (i.size != null) i.size!.toString(),
    }.toList()
      ..sort((a, b) => int.parse(a).compareTo(int.parse(b)));
    final grades = <String>{
      for (final i in _items)
        if (i.grade != null && i.grade!.isNotEmpty) i.grade!,
    }.toList()
      ..sort();

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => StatefulBuilder(
        builder: (context, setSheet) {
          Widget chips(String title, List<String> values, Set<String> sel,
              String Function(String) label) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4, top: 12, bottom: 6),
                  child: Text(title,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    for (final v in values)
                      FilterChip(
                        label: Text(label(v)),
                        selected: sel.contains(v),
                        onSelected: (on) {
                          setSheet(() {});
                          setState(() => on ? sel.add(v) : sel.remove(v));
                        },
                      ),
                  ],
                ),
              ],
            );
          }

          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.6,
            maxChildSize: 0.92,
            builder: (context, controller) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 8, 0),
                    child: Row(
                      children: [
                        const Text('筛选',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            setSheet(() {});
                            setState(() {
                              _fClasses.clear();
                              _fSizes.clear();
                              _fGrades.clear();
                            });
                          },
                          child: const Text('清除'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      controller: controller,
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      children: [
                        if (classes.isNotEmpty)
                          chips('类别', classes, _fClasses,
                              (c) => kItemClassValueCn[c] ?? c),
                        if (sizes.isNotEmpty)
                          chips('尺寸', sizes, _fSizes, (s) => 'S$s'),
                        if (grades.isNotEmpty)
                          chips('等级', grades, _fGrades, (g) => g),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

/// 量子引擎列表:带题图的 [QuantumDriveInfoCard],点击进详情;带排序/筛选。
class _QuantumDriveDbList extends StatefulWidget {
  const _QuantumDriveDbList();

  @override
  State<_QuantumDriveDbList> createState() => _QuantumDriveDbListState();
}

class _QuantumDriveDbListState extends State<_QuantumDriveDbList>
    with AutomaticKeepAliveClientMixin {
  List<GameItem> _items = const [];
  bool _loading = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      var list = await QuantumDriveRepo().getQuantumDrives();
      if (list.isEmpty) {
        await QuantumDriveRepo().refresh();
        list = await QuantumDriveRepo().getQuantumDrives();
      }
      if (!mounted) return;
      setState(() {
        _items = list;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  Future<void> _refresh() async {
    try {
      await QuantumDriveRepo().refresh();
      final list = await QuantumDriveRepo().getQuantumDrives();
      if (!mounted) return;
      setState(() => _items = list);
    } catch (_) {
      // 失败保留现有数据
    }
  }

  // —— 排序 / 筛选 ——
  num? _auec(GameItem i) {
    num? a;
    for (final p in i.uexPrices?.purchase ?? const <UexPrice>[]) {
      final b = p.priceBuy;
      if (b != null && (a == null || b > a)) a = b;
    }
    return a;
  }

  late final List<_SortField<GameItem>> _sortFields = [
    _SortField('价格(aUEC)', _auec),
    _SortField('跃迁速度', (i) => i.quantumDrive?.standardJump?.driveSpeed),
    _SortField('航程', (i) => i.quantumDrive?.jumpRange),
    _SortField('燃料效率', (i) => i.quantumDrive?.fuelEfficiency),
  ];
  int? _sortIndex;
  bool _asc = false;
  final Set<String> _fClasses = {}; // descriptionData Class
  final Set<String> _fSizes = {}; // size.toString()
  final Set<String> _fGrades = {}; // grade

  List<GameItem> get _visible {
    var list = _items.where((i) {
      if (_fClasses.isNotEmpty && !_fClasses.contains(descValue(i, 'Class'))) {
        return false;
      }
      if (_fSizes.isNotEmpty && !_fSizes.contains(i.size?.toString())) {
        return false;
      }
      if (_fGrades.isNotEmpty && !_fGrades.contains(i.grade)) {
        return false;
      }
      return true;
    }).toList();

    final idx = _sortIndex;
    if (idx != null) {
      final value = _sortFields[idx].value;
      list.sort((a, b) {
        final pa = value(a), pb = value(b);
        if (pa == null && pb == null) return 0;
        if (pa == null) return 1;
        if (pb == null) return -1;
        return _asc ? pa.compareTo(pb) : pb.compareTo(pa);
      });
    }
    return list;
  }

  int get _filterCount =>
      _fClasses.length + _fSizes.length + _fGrades.length;

  String get _sortLabel =>
      _sortIndex == null ? '默认' : _sortFields[_sortIndex!].label;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_items.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.inbox_outlined, size: 40, color: Colors.grey),
            const SizedBox(height: 10),
            const Text('暂无量子引擎数据', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 10),
            OutlinedButton(onPressed: _load, child: const Text('重试')),
          ],
        ),
      );
    }
    final visible = _visible;
    return Column(
      children: [
        _toolbar(visible.length),
        Expanded(
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: visible.isEmpty
                ? ListView(
                    children: const [
                      SizedBox(height: 80),
                      Center(
                        child: Text('无匹配结果',
                            style: TextStyle(color: Colors.grey)),
                      ),
                    ],
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
                    itemCount: visible.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) =>
                        QuantumDriveInfoCard(item: visible[index]),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _toolbar(int count) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 6),
      child: Row(
        children: [
          OutlinedButton.icon(
            onPressed: _showSortSheet,
            icon: const Icon(Icons.swap_vert, size: 18),
            label: Text('排序：$_sortLabel'),
            style: OutlinedButton.styleFrom(
              visualDensity: VisualDensity.compact,
              padding: const EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          const SizedBox(width: 8),
          badges.Badge(
            showBadge: _filterCount > 0,
            badgeContent: Text('$_filterCount',
                style: const TextStyle(color: Colors.white, fontSize: 10)),
            child: OutlinedButton.icon(
              onPressed: _showFilterSheet,
              icon: const Icon(Icons.filter_list, size: 18),
              label: const Text('筛选'),
              style: OutlinedButton.styleFrom(
                visualDensity: VisualDensity.compact,
                padding: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
          const Spacer(),
          Text('$count 项',
              style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ],
      ),
    );
  }

  void _showSortSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => StatefulBuilder(
        builder: (context, setSheet) {
          void pick(int? i) {
            setSheet(() {});
            setState(() => _sortIndex = i);
          }

          Widget tile(String label, int? i) => ListTile(
                dense: true,
                title: Text(label),
                trailing: _sortIndex == i
                    ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                    : null,
                onTap: () => pick(i),
              );

          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(14),
                  child: Text('排序',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      tile('默认', null),
                      for (var i = 0; i < _sortFields.length; i++)
                        tile(_sortFields[i].label, i),
                    ],
                  ),
                ),
                if (_sortIndex != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
                    child: Row(
                      children: [
                        const Text('方向：'),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text('降序'),
                          selected: !_asc,
                          onSelected: (_) {
                            setSheet(() {});
                            setState(() => _asc = false);
                          },
                        ),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text('升序'),
                          selected: _asc,
                          onSelected: (_) {
                            setSheet(() {});
                            setState(() => _asc = true);
                          },
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 8),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showFilterSheet() {
    final classes = <String>{
      for (final i in _items)
        if (descValue(i, 'Class') case final c?) c,
    }.toList()
      ..sort();
    final sizes = <String>{
      for (final i in _items)
        if (i.size != null) i.size!.toString(),
    }.toList()
      ..sort((a, b) => int.parse(a).compareTo(int.parse(b)));
    final grades = <String>{
      for (final i in _items)
        if (i.grade != null && i.grade!.isNotEmpty) i.grade!,
    }.toList()
      ..sort();

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => StatefulBuilder(
        builder: (context, setSheet) {
          Widget chips(String title, List<String> values, Set<String> sel,
              String Function(String) label) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4, top: 12, bottom: 6),
                  child: Text(title,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    for (final v in values)
                      FilterChip(
                        label: Text(label(v)),
                        selected: sel.contains(v),
                        onSelected: (on) {
                          setSheet(() {});
                          setState(() => on ? sel.add(v) : sel.remove(v));
                        },
                      ),
                  ],
                ),
              ],
            );
          }

          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.6,
            maxChildSize: 0.92,
            builder: (context, controller) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 8, 0),
                    child: Row(
                      children: [
                        const Text('筛选',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            setSheet(() {});
                            setState(() {
                              _fClasses.clear();
                              _fSizes.clear();
                              _fGrades.clear();
                            });
                          },
                          child: const Text('清除'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      controller: controller,
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      children: [
                        if (classes.isNotEmpty)
                          chips('类别', classes, _fClasses,
                              (c) => kItemClassValueCn[c] ?? c),
                        if (sizes.isNotEmpty)
                          chips('尺寸', sizes, _fSizes, (s) => 'S$s'),
                        if (grades.isNotEmpty)
                          chips('等级', grades, _fGrades, (g) => g),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

/// 占位:某类别建设中。
class _ComingSoon extends StatelessWidget {
  const _ComingSoon(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.construction_outlined, size: 44, color: Colors.grey),
          const SizedBox(height: 12),
          Text('$title · 建设中', style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
