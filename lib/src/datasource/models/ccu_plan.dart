class CcuSettings {
  const CcuSettings(
      {this.useHangar = true,
      this.useBuyback = true,
      this.useHistory = false,
      this.objective = 'additional'});

  final bool useHangar;
  final bool useBuyback;
  final bool useHistory;
  final String objective;

  CcuSettings copyWith(
          {bool? useHangar,
          bool? useBuyback,
          bool? useHistory,
          String? objective}) =>
      CcuSettings(
          useHangar: useHangar ?? this.useHangar,
          useBuyback: useBuyback ?? this.useBuyback,
          useHistory: useHistory ?? this.useHistory,
          objective: objective ?? this.objective);

  Map<String, dynamic> toJson() => {
        'use_hangar': useHangar,
        'use_buyback': useBuyback,
        'use_history': useHistory,
        'objective': objective
      };
  factory CcuSettings.fromJson(Map<String, dynamic> json) => CcuSettings(
      useHangar: json['use_hangar'] as bool? ?? true,
      useBuyback: json['use_buyback'] as bool? ?? true,
      useHistory: json['use_history'] as bool? ?? false,
      objective: json['objective'] == 'total' ? 'total' : 'additional');
}

class CcuOffer {
  const CcuOffer(
      {required this.id,
      required this.fromShipId,
      required this.toShipId,
      required this.source,
      required this.cost,
      this.availability = 'unknown',
      this.quotedAt,
      this.itemId,
      this.skuId,
      this.title = ''});

  final String id;
  final int fromShipId;
  final int toShipId;
  final String source;
  final int cost;
  final String availability;
  final int? quotedAt;
  final int? itemId;
  final int? skuId;
  final String title;

  bool get isOwned => source == 'hangar';
  bool get isPending => availability != 'owned' && availability != 'verified';
  bool freshAt(DateTime now) =>
      isOwned ||
      (availability == 'verified' &&
          quotedAt != null &&
          now.millisecondsSinceEpoch ~/ 1000 - quotedAt! >= 0 &&
          now.millisecondsSinceEpoch ~/ 1000 - quotedAt! <= 300);
  String get sourceLabel => ccuSourceLabel(source);
  String get tagLabel => source == 'standard' ? '未开放购买' : sourceLabel;

  Map<String, dynamic> toJson() => {
        'id': id,
        'from_ship_id': fromShipId,
        'to_ship_id': toShipId,
        'source': source,
        'cost': cost,
        'availability': availability,
        'quoted_at': quotedAt,
        'item_id': itemId,
        'sku_id': skuId,
        'title': title
      };
  factory CcuOffer.fromJson(Map<String, dynamic> json) => CcuOffer(
      id: json['id'] as String,
      fromShipId: json['from_ship_id'] as int,
      toShipId: json['to_ship_id'] as int,
      source: json['source'] as String,
      cost: json['cost'] as int,
      availability: json['availability'] as String? ?? 'unknown',
      quotedAt: json['quoted_at'] as int?,
      itemId: json['item_id'] as int?,
      skuId: json['sku_id'] as int?,
      title: json['title'] as String? ?? '');
}

String ccuSourceLabel(String source) =>
    const {
      'hangar': '机库中',
      'buyback': '回购',
      'store': '商店普通升级',
      'store_wb': '商店 WB',
      'history_wb': '历史 WB',
      'standard': '普通升级估价'
    }[source] ??
    source;

/// 按有向舰船组合和 Tag 来源排除，刷新报价后仍然有效。
class CcuSourcePair {
  const CcuSourcePair({
    required this.fromShipId,
    required this.toShipId,
    required this.source,
  });

  final int fromShipId;
  final int toShipId;
  final String source;

  factory CcuSourcePair.fromOffer(CcuOffer offer) => CcuSourcePair(
      fromShipId: offer.fromShipId,
      toShipId: offer.toShipId,
      source: offer.source);

  String get label => source == 'standard' ? '未开放购买' : ccuSourceLabel(source);

  bool matches(CcuOffer offer) =>
      offer.fromShipId == fromShipId &&
      offer.toShipId == toShipId &&
      offer.source == source;

  Map<String, dynamic> toJson() => {
        'from_ship_id': fromShipId,
        'to_ship_id': toShipId,
        'source': source,
      };
  factory CcuSourcePair.fromJson(Map<String, dynamic> json) => CcuSourcePair(
      fromShipId: json['from_ship_id'] as int,
      toShipId: json['to_ship_id'] as int,
      source: json['source'] as String);

  @override
  bool operator ==(Object other) =>
      other is CcuSourcePair &&
      other.fromShipId == fromShipId &&
      other.toShipId == toShipId &&
      other.source == source;

  @override
  int get hashCode => Object.hash(fromShipId, toShipId, source);
}

class CcuPlan {
  const CcuPlan(
      {required this.scenario,
      required this.steps,
      required this.ownedCost,
      required this.additionalCost,
      required this.totalCost,
      required this.regularCost,
      required this.savings,
      required this.pendingSteps});
  final String scenario;
  final List<CcuOffer> steps;
  final int ownedCost;
  final int additionalCost;
  final int totalCost;
  final int regularCost;
  final int savings;
  final int pendingSteps;

  /// 按整条路线统计，包含尚未开放购买的普通升级估价，不抵扣账户余额。
  int get creditEligibleCost => steps
      .where((step) =>
          step.source == 'store' ||
          step.source == 'buyback' ||
          step.source == 'standard')
      .fold(0, (total, step) => total + step.cost);

  /// 历史 WB 按现金估价计入；机库和回购中的 WB 按其物品来源归类。
  int get cashOnlyCost => steps
      .where((step) => step.source == 'store_wb' || step.source == 'history_wb')
      .fold(0, (total, step) => total + step.cost);

  Map<String, dynamic> toJson() => {
        'scenario': scenario,
        'steps': steps.map((e) => e.toJson()).toList(),
        'owned_cost': ownedCost,
        'additional_cost': additionalCost,
        'total_cost': totalCost,
        'regular_cost': regularCost,
        'savings': savings,
        'pending_steps': pendingSteps
      };
  factory CcuPlan.fromJson(Map<String, dynamic> json) => CcuPlan(
      scenario: json['scenario'] as String,
      steps: (json['steps'] as List)
          .map((e) => CcuOffer.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      ownedCost: json['owned_cost'] as int,
      additionalCost: json['additional_cost'] as int,
      totalCost: json['total_cost'] as int,
      regularCost: json['regular_cost'] as int,
      savings: json['savings'] as int,
      pendingSteps: json['pending_steps'] as int);
}

class CcuPlanResult {
  const CcuPlanResult(
      {required this.status,
      this.message = '',
      this.plans = const [],
      this.diagnostics = const []});
  final String status;
  final String message;
  final List<CcuPlan> plans;
  final List<String> diagnostics;
  factory CcuPlanResult.fromJson(Map<String, dynamic> json) => CcuPlanResult(
      status: json['status'] as String,
      message: json['message'] as String? ?? '',
      plans: (json['plans'] as List? ?? [])
          .map((e) => CcuPlan.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      diagnostics: (json['diagnostics'] as List? ?? [])
          .map((e) =>
              '${e['title'] == null || e['title'] == '' ? '' : '${e['title']} · '}${e['message'] ?? e['code']}${e['offer_id'] == null ? '' : ' (${e['offer_id']})'}')
          .toSet()
          .toList());
}

String ccuMoney(int cents) => '\$${(cents / 100).toStringAsFixed(2)}';
