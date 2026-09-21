import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../../datasource/data_model.dart';
import '../../../datasource/models/ccu_plan.dart';
import '../../../funcs/toast.dart';
import '../../../network/cirno/property/property.dart';
import '../../../repo/ccu_plan_storage.dart';
import '../../../repo/ship_alias.dart';
import '../../../repo/ship_upgrade.dart';
import '../../../datasource/models/shop/upgrade_ship_info.dart';
import '../hangar_item_detail_widget.dart';
import '../ship_gift_modal.dart';
import '../ship_recall_modal.dart';
import '../ship_reclaim_modal.dart';
import 'ccu_planner_components.dart';

export 'ccu_planner_components.dart' show CcuCostSummary;
import '../../../repo/translation.dart';
import '../../../services/ccu_planning_service.dart';
import '../../../services/rsi_session_service.dart';

class ProductUpgradeWidget extends StatefulWidget {
  const ProductUpgradeWidget({super.key});
  @override
  State<ProductUpgradeWidget> createState() => _ProductUpgradeWidgetState();
}

class _ProductUpgradeWidgetState extends State<ProductUpgradeWidget>
    with AutomaticKeepAliveClientMixin {
  final _storage = CcuPlanStorage();
  final _session = RsiSessionService.instance;
  List<ShipAlias> _ships = [];
  Map<int, String> _savedNames = {};
  List<UpgradeShipInfo>? _mediaSource;
  List<ShipAlias>? _mediaAliases;
  Map<int, UpgradeShipInfo> _media = {};
  Map<String, String> _constraintLabels = {};
  String? _account;
  int? _fromId;
  int? _toId;
  int _request = 0;
  int _selection = 0;
  CcuSettings _settings = const CcuSettings();
  List<String> _required = [];
  List<String> _excluded = [];
  List<List<int>> _excludedPairs = [];
  List<CcuSourcePair> _excludedSourcePairs = [];
  CcuPlanResult? _result;
  CancelToken? _cancel;
  bool _loading = false;
  bool _stale = false;
  String _progress = '';
  String? _error;
  Timer? _timer;

  CcuPlan? get _plan => _result == null || _result!.plans.isEmpty
      ? null
      : _result!.plans[_selection.clamp(0, _result!.plans.length - 1)];

  @override
  void initState() {
    super.initState();
    _account = _session.account;
    _session.addListener(_accountChanged);
    _load();
    _timer = Timer.periodic(const Duration(seconds: 30), (_) {
      if (mounted && _plan != null) setState(() {});
    });
  }

  Future<void> _load() async {
    final account = _account;
    final request = _request;
    try {
      final ships = (await ShipAliasRepo().getShipAliases())
          .where((s) => s.upgradeId != null && s.getHighestSku() > 0)
          .toList()
        ..sort((a, b) => a.getHighestSku().compareTo(b.getHighestSku()));
      final settings = await _storage.settings(account ?? '');
      if (!mounted || account != _account || request != _request) return;
      setState(() {
        _ships = ships;
        _settings = settings;
      });
    } catch (_) {
      if (mounted && account == _account) {
        setState(() {
          _error = '舰船资料加载失败，请重试';
        });
      }
    }
  }

  void _accountChanged() {
    // reset() also invalidates a run when the same account logs in again.
    _cancel?.cancel();
    _request++;
    if (!mounted) return;
    setState(() {
      _account = _session.account;
      _fromId = null;
      _toId = null;
      _result = null;
      _error = null;
      _required = [];
      _excluded = [];
      _excludedPairs = [];
      _excludedSourcePairs = [];
      _savedNames = {};
      _loading = false;
      _stale = false;
      _settings = const CcuSettings();
      _constraintLabels = {};
    });
    _load();
  }

  @override
  void dispose() {
    _cancel?.cancel();
    _request++;
    _session.removeListener(_accountChanged);
    _timer?.cancel();
    super.dispose();
  }

  String _name(int? id) {
    if (id == null) return '请选择';
    for (final s in _ships) {
      if (s.id == id) {
        return s.chineseName ?? TranslationRepo().getTranslationSync(s.name);
      }
    }
    return _savedNames[id] ?? '未知舰船 #$id';
  }

  void _updateMedia() {
    final source = ShipUpgradeRepo().shipUpgrade;
    if (identical(_mediaSource, source) && identical(_mediaAliases, _ships)) {
      return;
    }
    _mediaSource = source;
    _mediaAliases = _ships;
    final ids = matchLiveCcuShips(
        _ships, source.map((s) => {'id': s.id, 'name': s.name}).toList());
    _media = {
      for (final ship in source)
        if (ids[ship.id] != null) ids[ship.id]!: ship
    };
  }

  CcuShipView _shipView(int id) {
    ShipAlias? alias;
    for (final ship in _ships) {
      if (ship.id == id) {
        alias = ship;
        break;
      }
    }
    final media = _media[id]?.medias;
    String? image(String? url) => url == null || url.isEmpty
        ? null
        : Uri.parse('https://robertsspaceindustries.com/')
            .resolve(url)
            .toString();
    return CcuShipView(
        name: _name(id),
        englishName: alias?.name ?? '',
        price: alias?.getHighestSku(),
        imageUrl: image(media?.productThumbMediumAndSmall),
        heroUrl: image(media?.slideShow));
  }

  void _invalidate() {
    _cancel?.cancel();
    _request++;
    _loading = false;
    _stale = _plan != null;
    _error = null;
  }

  Future<void> _choose(bool from) async {
    if (_ships.isEmpty) {
      await _load();
      if (!mounted) return;
    }
    final id = await showSearch<int?>(
        context: context, delegate: _ShipSearch(_ships, _shipView));
    if (id == null || !mounted) return;
    setState(() {
      _invalidate();
      if (from) {
        _fromId = id;
      } else {
        _toId = id;
      }
      _required = [];
      _excluded = [];
      _excludedPairs = [];
      _excludedSourcePairs = [];
    });
  }

  void _changeSettings(CcuSettings value) {
    setState(() {
      _invalidate();
      _settings = value;
    });
    final account = _account;
    if (account != null) {
      unawaited(_storage.saveSettings(account, value).catchError((Object _) {
        if (mounted) showToast(message: '设置保存失败，请重试');
      }));
    }
  }

  Future<void> _calculate({bool refresh = false}) async {
    final model = context.read<MainDataModel>();
    if (!model.isVIP) {
      showVipAlert(context: context, move: true);
      return;
    }
    if (_fromId == null || _toId == null) {
      showToast(message: '请选择起始和目标舰船');
      return;
    }
    final account = _account;
    if (account == null || model.currentUser?.handle != account) {
      showToast(message: '请先登录 RSI 账号');
      return;
    }
    _cancel?.cancel();
    final token = _cancel = CancelToken();
    final request = ++_request;
    setState(() {
      _loading = true;
      _stale = _plan != null;
      _error = null;
      _progress = '准备规划…';
    });
    try {
      final result = await CcuPlanningService.instance.plan(
          account: account,
          ships: _ships,
          hangar: model.rawHangarItems,
          buyback: model.rawBuybackItems,
          fromId: _fromId!,
          toId: _toId!,
          settings: _settings,
          cancelToken: token,
          requiredIds: List.of(_required),
          excludedIds: List.of(_excluded),
          excludedPairs: _excludedPairs.map((e) => List<int>.of(e)).toList(),
          excludedSourcePairs: List.of(_excludedSourcePairs),
          refresh: refresh,
          onProgress: (text) {
            if (mounted && request == _request) {
              setState(() {
                _progress = text;
              });
            }
          });
      if (!mounted || request != _request || account != _account) return;
      setState(() {
        if (result.plans.isNotEmpty) {
          _result = result;
          _selection = 0;
          _stale = false;
        } else {
          _error = result.message.isEmpty
              ? '没有可用方案 (${result.status})'
              : result.message;
          _result ??= result;
        }
      });
    } catch (error) {
      if (!mounted || request != _request || token.isCancelled) return;
      setState(() {
        _error = error is StateError ? error.message : '规划失败，请检查网络与登录状态后重试';
      });
    } finally {
      if (mounted && request == _request) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  Future<void> _slots({required bool save}) async {
    final account = _account;
    final plan = _plan;
    if (account == null) {
      showToast(message: '请先登录');
      return;
    }
    if (save && (plan == null || _stale || _loading)) return;
    final slots = <SavedCcuPlan?>[];
    final errors = <int>{};
    for (var i = 0; i < 10; i++) {
      try {
        slots.add(await _storage.load(account, i));
      } catch (_) {
        slots.add(null);
        errors.add(i);
      }
    }
    if (!mounted || account != _account) return;
    final slot = await showModalBottomSheet<int>(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        constraints: const BoxConstraints(maxWidth: 720),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        builder: (context) => SafeArea(
            child: SizedBox(
                height: MediaQuery.sizeOf(context).height * .75,
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 8, 12),
                      child: Row(children: [
                        Expanded(
                            child: Text(save ? '保存升级方案' : '我的升级方案',
                                style: Theme.of(context).textTheme.titleLarge)),
                        IconButton(
                            tooltip: '关闭',
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.close)),
                      ])),
                  Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          itemCount: 10,
                          itemBuilder: (context, i) {
                            final saved = slots[i];
                            return Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: CcuPanel(
                                    padding: EdgeInsets.zero,
                                    child: ListTile(
                                      minVerticalPadding: 12,
                                      enabled: save || saved != null,
                                      leading: SizedBox(
                                          width: 56,
                                          height: 44,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: saved == null
                                                  ? Center(
                                                      child: Text(
                                                          '${i + 1}'
                                                              .padLeft(2, '0'),
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .titleMedium))
                                                  : CcuShipImage(
                                                      url: _shipView(saved.toId)
                                                          .imageUrl))),
                                      title: Text(
                                          '槽位 ${i + 1}${saved?.legacy == true ? ' · 旧版方案（未归属账号）' : ''}'),
                                      subtitle: Text(errors.contains(i)
                                          ? '方案数据无法读取（原数据保留）'
                                          : saved == null
                                              ? '空槽位'
                                              : '${saved.names[saved.fromId] ?? _name(saved.fromId)} → ${saved.names[saved.toId] ?? _name(saved.toId)}\n总成本 ${ccuMoney(saved.plan.totalCost)}'),
                                      trailing: Icon(save
                                          ? Icons.bookmark_add_outlined
                                          : Icons.chevron_right),
                                      onTap: save || saved != null
                                          ? () => Navigator.pop(context, i)
                                          : null,
                                    )));
                          })),
                ]))));
    if (slot == null || !mounted || account != _account) return;
    if (save) {
      // Parameters may have changed while the slot picker was open.
      if (_stale || _loading || !identical(plan, _plan)) return;
      try {
        await _storage.save(
            account,
            slot,
            SavedCcuPlan(
                fromId: _fromId!,
                toId: _toId!,
                settings: _settings,
                constraintLabels: Map.of(_constraintLabels),
                plan: plan!,
                requiredIds: List.of(_required),
                excludedIds: List.of(_excluded),
                excludedSourcePairs: List.of(_excludedSourcePairs),
                excludedPairs:
                    _excludedPairs.map((e) => List<int>.of(e)).toList(),
                names: {for (final s in _ships) s.id: _name(s.id)}));
        if (mounted && account == _account) {
          final model = context.read<MainDataModel>();
          await model
              .setUpdateStep(model.searchProperty?.selectedCCUSlots ?? []);
          if (!mounted || account != _account) return;
          showToast(message: '方案已保存，可在机库搜索菜单中筛选');
        }
      } catch (_) {
        if (mounted) showToast(message: '方案保存失败，请重试');
      }
    } else {
      final saved = slots[slot]!;
      setState(() {
        _invalidate();
        _fromId = saved.fromId;
        _toId = saved.toId;
        _settings = saved.settings;
        _required = List.of(saved.requiredIds);
        _excluded = List.of(saved.excludedIds);
        _excludedSourcePairs = List.of(saved.excludedSourcePairs);
        _excludedPairs =
            saved.excludedPairs.map((e) => List<int>.of(e)).toList();
        _savedNames = saved.names;
        _constraintLabels = Map.of(saved.constraintLabels);
        _result = CcuPlanResult(status: 'ok', plans: [saved.plan]);
        _selection = 0;
        _stale = true;
      });
      await _calculate(refresh: true);
    }
  }

  Widget _constraints() => ExpansionTile(
          key: const PageStorageKey('ccu-constraints'),
          tilePadding: EdgeInsets.zero,
          title: Text(
              '固定 ${_required.length} · 排除 ${_excluded.length + _excludedPairs.length + _excludedSourcePairs.length}',
              style: Theme.of(context).textTheme.bodyMedium),
          children: [
            if (_required.isEmpty &&
                _excluded.isEmpty &&
                _excludedPairs.isEmpty &&
                _excludedSourcePairs.isEmpty)
              const Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: Text('计算后，可在升级步骤中固定或排除具体升级。')),
            for (final id in _required)
              ListTile(
                  title: Text('固定：${_offerLabel(id)}'),
                  trailing: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          _invalidate();
                          _required.remove(id);
                        });
                        _calculate();
                      })),
            for (final id in _excluded)
              ListTile(
                  title: Text('排除：${_offerLabel(id)}'),
                  trailing: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          _invalidate();
                          _excluded.remove(id);
                        });
                        _calculate();
                      })),
            for (final pair in _excludedSourcePairs)
              ListTile(
                  title: Text(
                      '排除［${pair.label}］：${_name(pair.fromShipId)} → ${_name(pair.toShipId)}'),
                  trailing: IconButton(
                      tooltip: '撤销排除',
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          _invalidate();
                          _excludedSourcePairs.remove(pair);
                        });
                        _calculate();
                      })),
            for (final pair in _excludedPairs)
              ListTile(
                  title: Text('排除整段：${_name(pair[0])} → ${_name(pair[1])}'),
                  trailing: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          _invalidate();
                          _excludedPairs.remove(pair);
                        });
                        _calculate();
                      })),
          ]);

  String _offerLabel(String id) {
    if (_constraintLabels.containsKey(id)) return _constraintLabels[id]!;
    for (final plan in _result?.plans ?? <CcuPlan>[]) {
      for (final edge in plan.steps) {
        if (edge.id == id) {
          return '${_name(edge.fromShipId)} → ${_name(edge.toShipId)} · ${edge.sourceLabel}';
        }
      }
    }
    return id;
  }

  void _openOwnedCcu(CcuOffer edge) {
    final item = edge.itemId == null
        ? null
        : context.read<MainDataModel>().getHangarItemById(edge.itemId!);
    if (item == null) {
      showToast(message: '未找到对应机库物品，请刷新机库后重新计算方案');
      return;
    }
    WoltModalSheet.show<void>(
      context: context,
      pageListBuilder: (modalSheetContext) => [
        getHangarItemDetailSheet(modalSheetContext, item),
        getReclaimPage(modalSheetContext, context, item),
        getGiftPage(modalSheetContext, context, item),
        getRecallPage(modalSheetContext, context, item),
      ],
    );
  }

  Widget _step(CcuOffer edge, int index) => CcuRouteStep(
      key: ValueKey('$_selection:${edge.id}'),
      onTap: edge.isOwned ? () => _openOwnedCcu(edge) : null,
      edge: edge,
      index: index,
      from: _shipView(edge.fromShipId),
      to: _shipView(edge.toShipId),
      last: index == _plan!.steps.length - 1,
      pinned: _required.contains(edge.id),
      onPin: _loading || _stale
          ? null
          : () {
              setState(() {
                _constraintLabels[edge.id] = _offerLabel(edge.id);
                _invalidate();
                if (!_required.remove(edge.id)) _required.add(edge.id);
              });
              _calculate();
            },
      onExclude: _loading || _stale
          ? null
          : () {
              final pair = CcuSourcePair.fromOffer(edge);
              // 每个有效方案包含全部固定步骤，也匹配同类型的其他副本。
              final conflictingIds = {
                edge.id,
                for (final plan in _result?.plans ?? <CcuPlan>[])
                  for (final offer in plan.steps)
                    if (pair.matches(offer)) offer.id,
              };
              setState(() {
                _invalidate();
                _required.removeWhere(conflictingIds.contains);
                if (!_excludedSourcePairs.contains(pair)) {
                  _excludedSourcePairs.add(pair);
                }
              });
              _calculate();
            });

  Widget _settingsControls() {
    final theme = Theme.of(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text('优先优化', style: theme.textTheme.labelMedium),
      const SizedBox(height: 8),
      for (final option in [
        ('additional', '补入金额最低', Icons.payments_outlined),
        ('total', '升级链总成本最低', Icons.account_balance_wallet_outlined)
      ])
        Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Material(
                color: _settings.objective == option.$1
                    ? theme.colorScheme.primary.withValues(alpha: .09)
                    : theme.colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(10),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                    onTap: _loading
                        ? null
                        : () => _changeSettings(
                            _settings.copyWith(objective: option.$1)),
                    child: Semantics(
                        selected: _settings.objective == option.$1,
                        button: true,
                        child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(children: [
                              Icon(option.$3,
                                  size: 19, color: theme.colorScheme.primary),
                              const SizedBox(width: 10),
                              Expanded(
                                  child: Text(option.$2,
                                      style: theme.textTheme.bodyMedium)),
                              if (_settings.objective == option.$1)
                                Icon(Icons.check,
                                    size: 18, color: theme.colorScheme.primary),
                            ])))))),
      const SizedBox(height: 18),
      Text('参与规划的数据', style: theme.textTheme.labelMedium),
      const SizedBox(height: 8),
      CcuSourceOption(
          label: '机库 CCU',
          icon: Icons.inventory_2_outlined,
          value: _settings.useHangar,
          onChanged: _loading
              ? null
              : (v) => _changeSettings(_settings.copyWith(useHangar: v))),
      const SizedBox(height: 6),
      CcuSourceOption(
          label: '回购',
          icon: Icons.history,
          value: _settings.useBuyback,
          onChanged: _loading
              ? null
              : (v) => _changeSettings(_settings.copyWith(useBuyback: v))),
      const SizedBox(height: 6),
      CcuSourceOption(
          label: '历史 WB',
          icon: Icons.event_note_outlined,
          value: _settings.useHistory,
          onChanged: _loading
              ? null
              : (v) => _changeSettings(_settings.copyWith(useHistory: v))),
      const SizedBox(height: 6),
      Text('机库与回购使用已有数据',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
      const SizedBox(height: 12),
      Theme(
          data: theme.copyWith(dividerColor: Colors.transparent),
          child: _constraints()),
    ]);
  }

  Widget _planningActions() {
    final theme = Theme.of(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      FilledButton.icon(
          style: FilledButton.styleFrom(
              minimumSize: const Size(0, 48),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          onPressed: _loading ? null : () => _calculate(),
          icon: const Icon(Icons.route, size: 19),
          label: const Text('计算方案')),
      const SizedBox(height: 6),
      TextButton.icon(
          onPressed: _loading ? null : () => _calculate(refresh: true),
          icon: const Icon(Icons.refresh, size: 18),
          label: const Text('刷新商店并重算')),
      if (_loading) ...[
        const SizedBox(height: 12),
        const LinearProgressIndicator(),
        const SizedBox(height: 10),
        Text(_progress, style: theme.textTheme.bodySmall),
        TextButton(
            onPressed: () => setState(_invalidate), child: const Text('取消')),
      ],
    ]);
  }

  Widget _resultsPanel(CcuPlan? plan, bool expired) {
    final theme = Theme.of(context);
    final plans = _result?.plans ?? [];
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      if (_error != null)
        CcuNotice(message: _error!, error: true, icon: Icons.error_outline),
      if (_stale || expired)
        const CcuNotice(message: '以下为旧结果，请刷新商店或重新计算后使用。', icon: Icons.update),
      for (final scenario in ['current', 'waiting'])
        if (plans.any((p) => p.scenario == scenario)) ...[
          if (scenario == 'current')
            Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(children: [
                  Icon(Icons.check_circle_outline,
                      size: 18, color: theme.colorScheme.primary),
                  const SizedBox(width: 8),
                  Expanded(
                      child: Text('当前可用',
                          style: theme.textTheme.titleSmall
                              ?.copyWith(fontWeight: FontWeight.w600))),
                ])),
          LayoutBuilder(builder: (context, constraints) {
            final indexes = [
              for (var i = 0; i < plans.length; i++)
                if (plans[i].scenario == scenario) i
            ];
            final columns = constraints.maxWidth < 420
                ? 1
                : constraints.maxWidth < 660
                    ? 2
                    : 3;
            final width = (constraints.maxWidth - (columns - 1) * 10) / columns;
            return Wrap(spacing: 10, runSpacing: 10, children: [
              for (var n = 0; n < indexes.length; n++)
                SizedBox(
                    width: width,
                    child: CcuPlanChoice(
                        plan: plans[indexes[n]],
                        number: n + 1,
                        selected: indexes[n] == _selection,
                        onSelected: () =>
                            setState(() => _selection = indexes[n]))),
            ]);
          }),
          const SizedBox(height: 18),
        ],
      if (plan != null) ...[
        CcuCostSummary(plan: plan, objective: _settings.objective),
        const SizedBox(height: 22),
        Row(children: [
          Text('升级路线',
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(width: 10),
          Text('${plan.steps.length} 步', style: theme.textTheme.bodySmall)
        ]),
        const SizedBox(height: 14),
      ],
      if (plan == null)
        CcuPanel(
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 28),
                child: Column(children: [
                  Icon(
                      _loading
                          ? Icons.travel_explore
                          : _error != null
                              ? Icons.alt_route
                              : Icons.route,
                      size: 44,
                      color: theme.colorScheme.primary.withValues(alpha: .6)),
                  const SizedBox(height: 18),
                  Text(
                      _loading
                          ? '正在规划升级路线'
                          : _error != null
                              ? '暂未找到合适的路线'
                              : '点击计算方案开始规划',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleMedium),
                  if (_loading || _error != null) ...[
                    const SizedBox(height: 10),
                    Text(_loading ? _progress : '调整起止舰船或规划条件后重试',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant)),
                  ],
                ]))),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    context.watch<MainDataModel>();
    _updateMedia();
    final theme = Theme.of(context);
    final plan = _plan;
    final expired = plan?.scenario == 'current' &&
        plan!.steps.any((e) => !e.freshAt(DateTime.now()));
    final canSave = plan != null && !_stale && !_loading;
    return CcuPlannerLayout(
        headerBuilder: (context, openSettings) => LayoutBuilder(
            builder: (context, constraints) => Row(children: [
                  Expanded(
                      child: Text('升级规划',
                          style: theme.textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w700))),
                  if (constraints.maxWidth >= 600) ...[
                    TextButton.icon(
                        onPressed: _loading ? null : () => _slots(save: false),
                        icon: const Icon(Icons.folder_open, size: 19),
                        label: const Text('载入方案')),
                    const SizedBox(width: 8),
                    OutlinedButton.icon(
                        onPressed: canSave ? () => _slots(save: true) : null,
                        icon: const Icon(Icons.bookmark_add_outlined, size: 19),
                        label: const Text('保存方案')),
                  ] else ...[
                    IconButton(
                        tooltip: '载入方案',
                        onPressed: _loading ? null : () => _slots(save: false),
                        icon: const Icon(Icons.folder_open)),
                    IconButton(
                        tooltip: '保存方案',
                        onPressed: canSave ? () => _slots(save: true) : null,
                        icon: const Icon(Icons.bookmark_add_outlined)),
                  ],
                  if (openSettings != null)
                    IconButton(
                        tooltip: '规划设置',
                        onPressed: openSettings,
                        icon: const Icon(Icons.tune)),
                ])),
        ships: LayoutBuilder(builder: (context, constraints) {
          final compact = constraints.maxWidth < 600;
          final from = CcuShipSelector(
              label: '起始舰船',
              ship: _fromId == null ? null : _shipView(_fromId!),
              compact: compact,
              onTap: _loading ? null : () => _choose(true));
          final to = CcuShipSelector(
              label: '目标舰船',
              ship: _toId == null ? null : _shipView(_toId!),
              compact: compact,
              isTarget: true,
              onTap: _loading ? null : () => _choose(false));
          return compact
              ? Column(children: [from, const SizedBox(height: 10), to])
              : Row(children: [
                  Expanded(child: from),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(Icons.arrow_forward,
                          color: theme.colorScheme.primary)),
                  Expanded(child: to)
                ]);
        }),
        settings: _settingsControls(),
        actions: _planningActions(),
        results: _resultsPanel(plan, expired),
        stepCount: plan?.steps.length ?? 0,
        stepBuilder: (context, index) => _step(plan!.steps[index], index));
  }

  @override
  bool get wantKeepAlive => true;
}

class _ShipSearch extends SearchDelegate<int?> {
  _ShipSearch(this.ships, this.shipView)
      : super(searchFieldLabel: '搜索舰船中文名或英文名');
  final List<ShipAlias> ships;
  final CcuShipView Function(int) shipView;
  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              query = '';
            },
            icon: const Icon(Icons.clear))
      ];
  @override
  Widget buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back));
  @override
  Widget buildResults(BuildContext context) => buildSuggestions(context);
  @override
  Widget buildSuggestions(BuildContext context) {
    final key = query.toLowerCase().trim();
    final matches = ships
        .where((s) =>
            '${s.name} ${s.chineseName ?? TranslationRepo().getTranslationSync(s.name)} ${s.alias.join(' ')}'
                .toLowerCase()
                .contains(key))
        .toList();
    return ListView.builder(
        itemCount: matches.length,
        itemBuilder: (context, index) {
          final ship = matches[index];
          return ListTile(
              minVerticalPadding: 12,
              leading: SizedBox(
                  width: 64,
                  height: 48,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CcuShipImage(url: shipView(ship.id).imageUrl))),
              title: Text(ship.chineseName ??
                  TranslationRepo().getTranslationSync(ship.name)),
              subtitle:
                  Text('${ship.name} · 价格 ${ccuMoney(ship.getHighestSku())}'),
              onTap: () => close(context, ship.id));
        });
  }
}
