import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
import 'package:refuge_next/src/funcs/game_log_parser.dart';

part 'game_log.freezed.dart';
part 'game_log.g.dart';

@freezed
class GameLog with _$GameLog {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GameLog({
    int? id,  // 自增主键，插入时为null
    required DateTime timestamp,  // 日志时间戳
    required String logLevel,  // 日志级别 (Notice, Warning, Error等)
    required String logType,  // 主类型 (StoreItem, InventoryManagement, AttachmentReceived等)
    String? subType,  // 子类型 (Team_CoreGameplayFeatures, Team_ActorFeatures等)
    String? playerId,  // 玩家ID
    String? playerName,  // 玩家名称
    int? requestId,  // 请求ID
    String? entityId,  // 实体/物品ID
    String? entityName,  // 实体/物品名称
    String? entityClass,  // 实体类型 (如 behr_rifle_ballistic_01)
    String? location,  // 位置信息 (inventory, port等)
    String? inventoryId,  // 库存ID
    String? action,  // 动作类型 (Store, Take, Attach等)
    String? result,  // 操作结果 (Succeed, Failed等)
    double? elapsed,  // 耗时（秒）
    required String content,  // 完整日志内容
    Map<String, dynamic>? parsedData,  // 解析后的额外数据
    String? account,  // 账户信息 (格式: handle#accountId)
  }) = _GameLog;

  factory GameLog.fromJson(Map<String, dynamic> json) =>
      _$GameLogFromJson(json);

  // 添加一个工厂方法，用于从数据库map创建对象
  factory GameLog.fromDatabase(Map<String, dynamic> map) {
    return GameLog(
      id: map['id'] as int?,
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp'] as int),
      logLevel: map['log_level'] as String,
      logType: map['log_type'] as String,
      subType: map['sub_type'] as String?,
      playerId: map['player_id'] as String?,
      playerName: map['player_name'] as String?,
      requestId: map['request_id'] as int?,
      entityId: map['entity_id'] as String?,
      entityName: map['entity_name'] as String?,
      entityClass: map['entity_class'] as String?,
      location: map['location'] as String?,
      inventoryId: map['inventory_id'] as String?,
      action: map['action'] as String?,
      result: map['result'] as String?,
      elapsed: map['elapsed'] as double?,
      content: map['content'] as String,
      parsedData: map['parsed_data'] != null
          ? Map<String, dynamic>.from(jsonDecode(map['parsed_data'] as String))
          : null,
      account: map['account'] as String?,
    );
  }

  // 从服务器响应创建GameLog对象
  factory GameLog.fromServerResponse(Map<String, dynamic> serverData) {
    final content = serverData['content'] as String? ?? '';
    final logType = serverData['log_type'] as String;
    final timestamp = DateTime.parse(serverData['log_time'] as String);
    final account = serverData['game_account_name'] as String?;

    // 使用解析器从content中提取额外信息
    final parsedData = GameLogParser.parseData(logType, content);

    return GameLog(
      timestamp: timestamp,
      logLevel: 'Notice',  // 服务器不提供此字段，使用默认值
      logType: logType,
      subType: parsedData['sub_type'] as String?,
      playerId: parsedData['player_id'] as String?,
      playerName: parsedData['player_name'] as String?,
      requestId: parsedData['request_id'] as int?,
      entityId: parsedData['entity_id'] as String?,
      entityName: parsedData['entity_name'] as String?,
      entityClass: parsedData['entity_class'] as String?,
      location: parsedData['location'] as String?,
      inventoryId: parsedData['inventory_id'] as String?,
      action: parsedData['action'] as String?,
      result: parsedData['result'] as String?,
      elapsed: parsedData['elapsed'] as double?,
      content: content,
      parsedData: parsedData.isNotEmpty ? parsedData : null,
      account: account,
    );
  }
}

// 扩展方法，用于转换为数据库map
extension GameLogExtension on GameLog {
  Map<String, dynamic> toDatabase() {
    return {
      if (id != null) 'id': id,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'log_level': logLevel,
      'log_type': logType,
      'sub_type': subType,
      'player_id': playerId,
      'player_name': playerName,
      'request_id': requestId,
      'entity_id': entityId,
      'entity_name': entityName,
      'entity_class': entityClass,
      'location': location,
      'inventory_id': inventoryId,
      'action': action,
      'result': result,
      'elapsed': elapsed,
      'content': content,
      'parsed_data': parsedData != null ? jsonEncode(parsedData) : null,
      'account': account,
    };
  }

  /// 动态解析特定数据（从原始日志内容）
  Map<String, dynamic> get parsedDataDynamic {
    return GameLogParser.parseData(logType, content);
  }
}

// 日志类型枚举
class LogTypes {
  // 原有的常量（保持向后兼容）
  static const String storeItem = 'StoreItem';
  static const String inventoryManagement = 'InventoryManagement';
  static const String inventoryManagementRequest = 'InventoryManagementRequest';
  static const String attachmentReceived = 'AttachmentReceived';
  static const String onInventoryStoreItem = 'OnInventoryStoreItem';
  static const String inventoryTokenFlow = 'Inventory Token Flow';
  static const String takeItemValidation = 'Take Item Validation';

  // 新增的常量（用于日志查看器）
  static const String inventory = 'Inventory Token Flow';  // 库存相关
  static const String attachment = 'AttachmentReceived';  // 装备相关
  static const String login = 'Login';  // 登录相关（通用）
  static const String initiateLogin = 'InitiateLogin';  // 发起登录
  static const String asyncLoginCallback = 'AsyncLoginCallback';  // 登录回调
  static const String gameVersion = 'Game Version';  // 游戏版本
  static const String physics = 'Physics';  // 物理相关
  static const String error = 'Error';  // 错误
  static const String warning = 'Warning';  // 警告

  // 游戏流程相关
  static const String spawnFlow = 'Spawn Flow';  // 生成流程
  static const String connectionFlow = 'Connection Flow';  // 连接流程
  static const String vehicleControlFlow = 'Vehicle Control Flow';  // 载具控制流程
  static const String jumpDriveStateChanged = 'Jump Drive State Changed';  // 跃迁驱动状态改变

  // 战斗与事件
  static const String vehicleDestruction = 'Vehicle Destruction';  // 载具摧毁
  static const String actorDeath = 'Actor Death';  // 角色死亡

  // 任务相关
  static const String objectiveUpserted = 'ObjectiveUpserted';  // 目标更新
  static const String missionEnded = 'MissionEnded';  // 任务结束
  static const String endMission = 'EndMission';  // 结束任务

  // 系统相关
  static const String authorityChanged = 'Authority Changed';  // 权限变更
  static const String systemQuit = 'SystemQuit';  // 系统退出
}

// 日志级别枚举
class LogLevels {
  static const String notice = 'Notice';
  static const String warning = 'Warning';
  static const String error = 'Error';
  static const String info = 'Info';
  static const String debug = 'Debug';
}