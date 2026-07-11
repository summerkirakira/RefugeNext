import 'package:flutter/material.dart';
import 'package:refuge_next/src/funcs/toast.dart';
import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/blueprint.dart';
import 'package:refuge_next/src/repo/cooler.dart';
import 'package:refuge_next/src/repo/mission.dart';
import 'package:refuge_next/src/repo/power_plant.dart';
import 'package:refuge_next/src/repo/quantum_drive.dart';
import 'package:refuge_next/src/repo/shield.dart';
import 'package:refuge_next/src/repo/translation.dart';
import 'package:refuge_next/src/repo/vehicle_weapon.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/cooler_detail_page.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/power_plant_detail_page.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/quantum_drive_detail_page.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/shield_detail_page.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/vehicle_weapon_detail_page.dart';
// 复用通用卡片/格式化 helper(顶层纯函数,非继承页)
import 'package:refuge_next/src/widgets/ship_info_neo/game_item_detail_page.dart'
    show
        itemCard,
        itemRows,
        itemRow,
        itemStatRow,
        itemSmallRow,
        itemGroupHeader,
        itemRangeText,
        fmtNum,
        fmtDurationCn;

/// 独立的任务详情测试页(不继承 GameItemDetailPage)。
///
/// 列表用 [MissionRepo] 下载的 [MissionIndex](做选择器/头部/基础卡);
/// 进页或切换任务时自动 `getMission` 补拉完整 [Mission],追加详情卡
/// (奖励物品/地点明细/时间)。仅作开发调试用。
class MissionDetailPage extends StatefulWidget {
  const MissionDetailPage({
    super.key,
    this.initialMission,
    this.allowSwitch = true,
  });

  /// 指定展示的任务;为 null 时取本地第一条。
  final MissionIndex? initialMission;

  /// 是否显示「切换任务」按钮(测试页为 true)。
  final bool allowSwitch;

  @override
  State<MissionDetailPage> createState() => _MissionDetailPageState();
}

class _MissionDetailPageState extends State<MissionDetailPage> {
  List<MissionIndex> _all = [];
  MissionIndex? _selected;
  bool _loading = true;

  /// 完整任务详情缓存(按 uuid)。
  final Map<String, Mission> _detailCache = {};
  final Set<String> _fetching = {};

  @override
  void initState() {
    super.initState();
    Future.wait([
      MissionRepo().getMissions(),
      TranslationRepo().getTranslations(),
    ]).then((results) {
      if (!mounted) return;
      final missions = results[0] as List<MissionIndex>;
      setState(() {
        _all = missions;
        _selected = widget.initialMission ??
            (missions.isNotEmpty ? missions.first : null);
        _loading = false;
      });
      _fetchDetail(_selected);
    });
  }

  /// 进页/切换任务后自动补拉完整 Mission。
  void _fetchDetail(MissionIndex? m) {
    final uuid = m?.uuid;
    if (uuid == null) return;
    if (_detailCache.containsKey(uuid) || _fetching.contains(uuid)) return;
    _fetching.add(uuid);
    MissionRepo().fetchDetail(uuid).then((detail) {
      if (!mounted) return;
      _fetching.remove(uuid);
      if (detail != null) {
        setState(() => _detailCache[uuid] = detail);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Scaffold(
        appBar: AppBar(title: const Text('任务详情')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    final m = _selected;
    if (m == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('任务详情')),
        body: const Center(child: Text('本地暂无数据,请先在数据库页下载')),
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('任务详情')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _header(m),
            ..._cards(m).map((c) =>
                Padding(padding: const EdgeInsets.only(top: 12), child: c)),
          ],
        ),
      ),
    );
  }

  // ============ 头部 ============

  Widget _header(MissionIndex m) {
    final tags = <String>[
      if (m.legalityLabel != null) m.legalityLabel!,
      if (m.rankIndex != null) 'Rank ${m.rankIndex}',
      if (m.hasCombat == true) '战斗',
      if (m.hasBlueprints == true) '含蓝图',
      if (m.onceOnly == true) '一次性',
    ];
    final subtitle = [m.missionGiver, m.faction?.name]
        .whereType<String>()
        .where((s) => s.isNotEmpty)
        .join(' · ');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(m.title ?? '未知',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            if (widget.allowSwitch && _all.isNotEmpty)
              IconButton(
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
                icon: const Icon(Icons.swap_horiz),
                tooltip: '切换任务',
                onPressed: () => _showSelector(context),
              ),
          ],
        ),
        if (subtitle.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(subtitle,
                style: const TextStyle(fontSize: 14, color: Colors.grey)),
          ),
        if (tags.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8),
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
                        child: Text(t,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.orange.shade700)),
                      ))
                  .toList(),
            ),
          ),
      ],
    );
  }

  // ============ 卡片 ============

  String? _rng(num? a, num? b, {String? unit}) {
    if (a == null && b == null) return null;
    final u = unit != null ? ' $unit' : '';
    if (a != null && b != null && a != b) return '${fmtNum(a)} - ${fmtNum(b)}$u';
    return '${fmtNum(a ?? b)}$u';
  }

  List<Widget> _cards(MissionIndex m) {
    final detail = m.uuid != null ? _detailCache[m.uuid] : null;
    final loadingDetail = detail == null && (m.uuid != null);
    return [
      if (loadingDetail)
        const Padding(
          padding: EdgeInsets.only(top: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 14,
                  height: 14,
                  child: CircularProgressIndicator(strokeWidth: 2)),
              SizedBox(width: 8),
              Text('正在加载详细信息…',
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
      // 简介
      if ((m.description ?? '').trim().isNotEmpty)
        itemCard('简介', [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
            child: Text(m.description!.trim(),
                style: const TextStyle(fontSize: 14, height: 1.4)),
          ),
        ]),
      // 基本
      itemCard('基本', itemRows([
        itemRow('发布者', m.missionGiver),
        itemRow('阵营', m.faction?.name),
        itemRow('等级', m.rankIndex?.toString()),
        itemRow('合法性', m.legalityLabel),
        itemRow('犯罪值', _rng(m.minCrimeStat, m.maxCrimeStat)),
        itemRow('声望要求',
            _rngText(m.minStanding?.name, m.maxStanding?.name)),
        itemRow('费用', fmtNum(m.cost)),
        itemRow('单实例人数', m.maxPlayersPerInstance?.toString()),
        itemRow('预计耗时', fmtNum(m.timeToCompleteMinutes), unit: '分'),
        itemRow('可分享', m.shareable == true ? '是' : null),
        itemRow('一次性', m.onceOnly == true ? '是' : null),
        itemRow('监狱可接', m.availableInPrison == true ? '是' : null),
      ])),
      // 奖励与声望(报酬 + 声望获得/损失表;损失来自完整 Mission)
      _rewardsCard(m, detail),
      // 战斗
      if (m.hasCombat == true)
        itemCard('战斗', itemRows([
          itemStatRow('敌人数',
              itemRangeText(m.enemyCountMin, m.enemyCountMax)),
        ])),
      // 地点
      if ((m.starSystems ?? const []).isNotEmpty)
        itemCard('地点', itemRows([
          itemRow('星系', m.starSystems!.join(' / ')),
        ])),
      // 可获得蓝图(点击跳转到产物物品详情页)
      if (m.hasBlueprints == true &&
          (m.blueprints ?? const []).isNotEmpty)
        itemCard('可获得蓝图(${m.blueprints!.length})', [
          for (final b in m.blueprints!) _blueprintRow(b),
        ]),
      // ====== 以下来自完整 Mission(自动补拉) ======
      if (detail != null) ..._detailCards(detail),
    ];
  }

  /// 可获得蓝图的一行:只显示名称 + 箭头,点击跳到产物物品详情页。
  Widget _blueprintRow(MissionIndexBlueprint b) {
    return InkWell(
      onTap: () => _openBlueprintOutput(b),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Row(
          children: [
            Expanded(
              child: Text(b.name ?? '-',
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold)),
            ),
            const Icon(Icons.chevron_right, size: 18, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  /// 解析蓝图 → 产物物品,打开对应类型的物品详情页(仅护盾/冷却器/发电机/量子)。
  /// 需先下载蓝图与对应物品数据,缺失则 toast 提示。
  Future<void> _openBlueprintOutput(MissionIndexBlueprint mbp) async {
    final id = mbp.uuid;
    if (id == null) return;
    // mbp.uuid 可能是蓝图 uuid 或产物 uuid,两种都试。
    final bp = BlueprintRepo().getByUuidSync(id) ??
        BlueprintRepo().findByOutputItemUuidSync(id);
    if (bp == null) {
      showToast(message: '未找到蓝图');
      return;
    }
    final outUuid = bp.outputItemUuid ?? bp.output?.uuid;
    final type = bp.output?.type;
    if (outUuid == null || type == null) {
      showToast(message: '蓝图缺少产物信息');
      return;
    }

    Widget? page;
    switch (type) {
      case 'Shield':
        await ShieldRepo().getShields();
        final item = ShieldRepo().getByUuidSync(outUuid);
        if (item != null) {
          page = ShieldDetailPage(initialShield: item, allowSwitch: false);
        }
      case 'Cooler':
        await CoolerRepo().getCoolers();
        final item = CoolerRepo().getByUuidSync(outUuid);
        if (item != null) {
          page = CoolerDetailPage(initialItem: item, allowSwitch: false);
        }
      case 'PowerPlant':
        await PowerPlantRepo().getPowerPlants();
        final item = PowerPlantRepo().getByUuidSync(outUuid);
        if (item != null) {
          page = PowerPlantDetailPage(initialItem: item, allowSwitch: false);
        }
      case 'QuantumDrive':
        await QuantumDriveRepo().getQuantumDrives();
        final item = QuantumDriveRepo().getByUuidSync(outUuid);
        if (item != null) {
          page = QuantumDriveDetailPage(initialItem: item, allowSwitch: false);
        }
      case 'WeaponGun':
        await VehicleWeaponRepo().getVehicleWeapons();
        final item = VehicleWeaponRepo().getByUuidSync(outUuid);
        if (item != null) {
          page = VehicleWeaponDetailPage(initialItem: item, allowSwitch: false);
        }
      default:
        showToast(message: '暂不支持「$type」类型的物品详情页');
        return;
    }

    if (!mounted) return;
    if (page == null) {
      showToast(message: '未找到该物品');
      return;
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => page!));
  }

  /// 奖励与声望卡(仿 wiki「Rewards & Reputation」):报酬 +
  /// 声望获得/损失表(阵营 | 数值 | 范围 | 等级)。
  /// 声望获得优先用完整 Mission(否则用 MissionIndex);声望损失仅完整 Mission 有。
  Widget _rewardsCard(MissionIndex idx, Mission? detail) {
    // 只显示实际报酬(取 max,回退 min),不写区间最低值。
    final reward = fmtNum(idx.rewardMax ?? idx.rewardMin);
    final gained = <_Rep>[
      if (detail?.reputationGained != null)
        for (final r in detail!.reputationGained!)
          _Rep(r.faction, r.amount, r.scope, r.tier)
      else
        for (final r in idx.reputationGained ??
            const <MissionIndexReputationGainedInner>[])
          _Rep(r.faction, r.amount, r.scope, r.tier),
    ];
    final lost = <_Rep>[
      for (final r in detail?.reputationLost ?? const <MissionReputation>[])
        _Rep(r.faction, r.amount, r.scope, r.tier),
    ];
    return itemCard('奖励与声望', [
      ...itemRows([
        if (reward != null)
          itemRow('报酬', reward, unit: idx.rewardCurrency ?? '', orange: true),
      ]),
      ..._repTable('声望获得', gained),
      ..._repTable('声望损失', lost),
    ]);
  }

  /// 声望表:小标题 + 表头(阵营 | 数值 | 等级)+ 数据行。空则不渲染。
  List<Widget> _repTable(String subtitle, List<_Rep> reps) {
    if (reps.isEmpty) return const [];
    final headerStyle = TextStyle(fontSize: 12, color: Colors.grey[600]);
    const cell = TextStyle(fontSize: 13);
    Widget row(Widget a, Widget b, Widget c) => Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 5, child: a),
              Expanded(flex: 3, child: b),
              Expanded(flex: 3, child: c),
            ],
          ),
        );
    return [
      ...itemGroupHeader(subtitle),
      row(
        Text('阵营', style: headerStyle),
        Text('数值', style: headerStyle, textAlign: TextAlign.right),
        Text('等级', style: headerStyle, textAlign: TextAlign.right),
      ),
      for (final r in reps)
        row(
          Text(r.faction ?? '-', style: cell),
          Text(
              r.amount != null
                  ? '${r.amount! > 0 ? '+' : ''}${r.amount}'
                  : '-',
              style: cell.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.right),
          Text(r.tier ?? '-', style: cell, textAlign: TextAlign.right),
        ),
    ];
  }

  /// 完整 Mission 的详情卡(奖励物品 / 地点明细 / 时间)。
  List<Widget> _detailCards(Mission d) {
    return [
      // 奖励物品
      if ((d.rewardItems ?? const []).isNotEmpty)
        itemCard('奖励物品(${d.rewardItems!.length})', itemRows([
          for (final it in d.rewardItems!)
            itemSmallRow(it.name ?? '-',
                it.amount != null ? '×${it.amount}' : null),
        ])),
      // 地点明细
      if ((d.starmapLocations ?? const []).isNotEmpty)
        itemCard('地点明细', itemRows([
          for (final g in d.starmapLocations!) ...[
            if ((g.purpose ?? '').isNotEmpty) ...itemGroupHeader(g.purpose!),
            for (final loc in g.locations ?? const <MissionStarmapLocation>[])
              itemSmallRow(loc.name ?? '-', loc.system),
          ],
        ])),
      // 时间(由秒/分数值格式化为中文时长,不用 API 的英文 label)
      itemCard('时间', itemRows([
        itemRow('冷却', _durationCn(d.cooldown?.personalSeconds)),
        itemRow('刷新', _durationCn(d.lifetime?.respawnTimeSeconds)),
        itemRow(
            '限时',
            _durationCn(d.deadline?.completionTimeMinutes != null
                ? d.deadline!.completionTimeMinutes! * 60
                : null)),
      ])),
    ];
  }

  /// 秒 → 中文时长(复用通用 [fmtDurationCn])。
  String? _durationCn(int? seconds) => fmtDurationCn(seconds);

  String? _rngText(String? a, String? b) {
    if ((a ?? '').isEmpty && (b ?? '').isEmpty) return null;
    if ((a ?? '').isNotEmpty && (b ?? '').isNotEmpty && a != b) {
      return '$a ~ $b';
    }
    return (a?.isNotEmpty ?? false) ? a : b;
  }

  // ============ 切换任务 modal ============

  void _showSelector(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        var filtered = List<MissionIndex>.of(_all);
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
                        decoration: const InputDecoration(
                          hintText: '搜索任务名 / 发布者',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(),
                          isDense: true,
                        ),
                        onChanged: (value) {
                          final lower = value.toLowerCase();
                          setSheetState(() {
                            filtered = _all.where((m) {
                              return (m.title?.toLowerCase().contains(lower) ??
                                      false) ||
                                  (m.missionGiver
                                          ?.toLowerCase()
                                          .contains(lower) ??
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
                          final m = filtered[index];
                          return ListTile(
                            dense: true,
                            title: Text(m.title ?? m.debugName ?? '未知'),
                            subtitle: Text(m.missionGiver ?? ''),
                            onTap: () {
                              Navigator.of(context).pop();
                              setState(() => _selected = m);
                              _fetchDetail(m);
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

/// 声望行的统一视图模型(归并 MissionIndexReputationGainedInner / MissionReputation)。
class _Rep {
  const _Rep(this.faction, this.amount, this.scope, this.tier);
  final String? faction;
  final int? amount;
  final String? scope;
  final String? tier;
}
