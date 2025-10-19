import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_log_status.freezed.dart';
part 'game_log_status.g.dart';

/// 游戏日志状态信息
///
/// 用于追踪游戏日志的状态和统计信息
@freezed
class GameLogStatus with _$GameLogStatus {
  const factory GameLogStatus({
    /// 最近游戏时间（最新日志的时间戳）
    DateTime? latestGameTime,

    /// 最后刷新时间（用于显示数据新鲜度）
    DateTime? lastRefreshTime,

    /// 任务完成数（EndMission日志数量）
    int? missionCompletedCount,

    /// 玩家击杀数（被当前玩家击杀的次数）
    int? playerKillCount,

    /// 玩家被杀数（当前玩家被杀的次数）
    int? playerDeathCount,

    /// 两周内游戏时长（分钟）
    int? gamePlayTimeMinutes,

    // 预留字段，方便以后扩展：
    // int? totalLogCount,           // 日志总数
    // String? latestPlayerName,     // 最近游玩的角色名
    // String? latestPlayerId,       // 最近游玩的角色ID
    // Map<String, int>? typeDistribution,  // 按类型分布
  }) = _GameLogStatus;

  factory GameLogStatus.fromJson(Map<String, dynamic> json) =>
      _$GameLogStatusFromJson(json);
}
