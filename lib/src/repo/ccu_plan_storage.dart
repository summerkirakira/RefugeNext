import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../datasource/models/ccu_plan.dart';
import 'ship_alias.dart';

class SavedCcuPlan {
  const SavedCcuPlan(
      {required this.fromId,
      required this.toId,
      required this.settings,
      required this.plan,
      this.requiredIds = const [],
      this.excludedIds = const [],
      this.excludedPairs = const [],
      this.excludedSourcePairs = const [],
      this.names = const {},
      this.constraintLabels = const {},
      this.legacy = false});
  final int fromId;
  final int toId;
  final CcuSettings settings;
  final CcuPlan plan;
  final List<String> requiredIds;
  final List<String> excludedIds;
  final List<List<int>> excludedPairs;
  final List<CcuSourcePair> excludedSourcePairs;
  final Map<int, String> names;
  final Map<String, String> constraintLabels;
  final bool legacy;

  Map<String, dynamic> toJson() => {
        'version': 3,
        'from_id': fromId,
        'to_id': toId,
        'settings': settings.toJson(),
        'plan': plan.toJson(),
        'required_ids': requiredIds,
        'excluded_ids': excludedIds,
        'excluded_pairs': excludedPairs,
        'excluded_source_pairs':
            excludedSourcePairs.map((e) => e.toJson()).toList(),
        'names': names.map((k, v) => MapEntry('$k', v)),
        'constraint_labels': constraintLabels,
        'saved_at': DateTime.now().toUtc().toIso8601String()
      };
  factory SavedCcuPlan.fromJson(Map<String, dynamic> json) {
    if (json['version'] != 3) throw const FormatException('不支持的方案版本');
    return SavedCcuPlan(
        fromId: json['from_id'] as int,
        toId: json['to_id'] as int,
        settings: CcuSettings.fromJson(
            Map<String, dynamic>.from(json['settings'] as Map)),
        plan: CcuPlan.fromJson(Map<String, dynamic>.from(json['plan'] as Map)),
        requiredIds: List<String>.from(json['required_ids'] as List? ?? []),
        constraintLabels:
            Map<String, String>.from(json['constraint_labels'] as Map? ?? {}),
        excludedIds: List<String>.from(json['excluded_ids'] as List? ?? []),
        excludedSourcePairs: (json['excluded_source_pairs'] as List? ?? [])
            .map((e) =>
                CcuSourcePair.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList(),
        excludedPairs: (json['excluded_pairs'] as List? ?? [])
            .map((e) => List<int>.from(e as List))
            .toList(),
        names: (json['names'] as Map? ?? {})
            .map((k, v) => MapEntry(int.parse('$k'), '$v')));
  }
}

class CcuPlanStorage {
  String _prefix(String account) => 'ccu.v3.${Uri.encodeComponent(account)}';

  Future<CcuSettings> settings(String account) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString('${_prefix(account)}.settings');
    if (raw != null) {
      try {
        return CcuSettings.fromJson(
            Map<String, dynamic>.from(jsonDecode(raw) as Map));
      } catch (_) {
        /* Preserve corrupt/older data; use safe defaults. */
      }
    }
    return CcuSettings(
        useHangar: prefs.getBool('vip.kirakira.use_hangar') ?? true,
        useBuyback: prefs.getBool('vip.kirakira.use_buyback') ?? true,
        useHistory: prefs.getBool('vip.kirakira.use_history') ?? false);
  }

  Future<void> saveSettings(String account, CcuSettings settings) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        '${_prefix(account)}.settings', jsonEncode(settings.toJson()));
  }

  Future<void> save(String account, int slot, SavedCcuPlan plan) async {
    if (account.isEmpty || slot < 0 || slot >= 10) {
      throw ArgumentError('账号或槽位无效');
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        '${_prefix(account)}.slot.$slot', jsonEncode(plan.toJson()));
  }

  Future<SavedCcuPlan?> load(String account, int slot) async {
    final prefs = await SharedPreferences.getInstance();
    final scoped = prefs.getString('${_prefix(account)}.slot.$slot');
    if (scoped != null) {
      return SavedCcuPlan.fromJson(
          Map<String, dynamic>.from(jsonDecode(scoped) as Map));
    }
    // Legacy slots have no owner. Read only; never automatically claim/migrate.
    final raw = prefs.getString('vip.kirakira.steps[$slot]');
    if (raw == null) return null;
    await ShipAliasRepo().getShipAliases();
    final steps = <CcuOffer>[];
    final names = <int, String>{};
    for (final encoded in jsonDecode(raw) as List) {
      final row = jsonDecode(encoded as String) as Map;
      final from =
          ShipAliasRepo().getShipAliasByUpgradeIdSync(row['fromShip'] as int);
      final to =
          ShipAliasRepo().getShipAliasByUpgradeIdSync(row['toShip'] as int);
      if (from == null || to == null) {
        throw const FormatException('旧版方案的舰船资料已缺失');
      }
      final tags = List<String>.from(row['tags'] as List? ?? []);
      final source = tags.contains('机库中')
          ? 'hangar'
          : tags.contains('回购')
              ? 'buyback'
              : tags.contains('历史WB')
                  ? 'history_wb'
                  : 'standard';
      steps.add(CcuOffer(
          id: 'legacy:${steps.length}',
          fromShipId: from.id,
          toShipId: to.id,
          source: source,
          cost: row['cost'] as int));
      names[from.id] = row['fromProduct'] as String;
      names[to.id] = row['toProduct'] as String;
    }
    if (steps.isEmpty) return null;
    final owned =
        steps.where((e) => e.isOwned).fold<int>(0, (n, e) => n + e.cost);
    final total = steps.fold<int>(0, (n, e) => n + e.cost);
    return SavedCcuPlan(
        fromId: steps.first.fromShipId,
        toId: steps.last.toShipId,
        settings:
            CcuSettings(useHistory: steps.any((e) => e.source == 'history_wb')),
        names: names,
        legacy: true,
        plan: CcuPlan(
            scenario: 'waiting',
            steps: steps,
            ownedCost: owned,
            additionalCost: total - owned,
            totalCost: total,
            regularCost: 0,
            savings: 0,
            pendingSteps: steps.length));
  }
}
