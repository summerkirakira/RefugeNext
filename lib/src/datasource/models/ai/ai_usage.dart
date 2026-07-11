/// 当日 AI token 额度视图（对应服务端 GET /ai/usage 的 UsageResponse）。
///
/// 普通类、手写 JSON —— 不用 freezed，避免触发 build_runner 删生成文件
/// （与 [AiSessionMeta] 同做法）。
class AiUsage {
  /// 会员等级：free | vip。
  final String tier;

  /// 今日已用 token 数。
  final int usedTokens;

  /// 今日额度；0 表示无限（vip）。
  final int dailyBudget;

  /// 今日剩余 token 数；无限时为 null。
  final int? remainingTokens;

  /// 是否无限额度。
  final bool unlimited;

  /// 距额度重置（本地午夜）剩余秒数。
  final int resetInSeconds;

  const AiUsage({
    required this.tier,
    required this.usedTokens,
    required this.dailyBudget,
    required this.remainingTokens,
    required this.unlimited,
    required this.resetInSeconds,
  });

  factory AiUsage.fromJson(Map<String, dynamic> j) => AiUsage(
        tier: j['tier'] as String? ?? 'free',
        usedTokens: (j['used_tokens'] as num?)?.toInt() ?? 0,
        dailyBudget: (j['daily_budget'] as num?)?.toInt() ?? 0,
        remainingTokens: (j['remaining_tokens'] as num?)?.toInt(),
        unlimited: j['unlimited'] as bool? ?? false,
        resetInSeconds: (j['reset_in_seconds'] as num?)?.toInt() ?? 0,
      );
}
