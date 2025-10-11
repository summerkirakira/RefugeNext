import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

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
    };
  }
}

// 日志类型枚举
class LogTypes {
  static const String storeItem = 'StoreItem';
  static const String inventoryManagement = 'InventoryManagement';
  static const String inventoryManagementRequest = 'InventoryManagementRequest';
  static const String attachmentReceived = 'AttachmentReceived';
  static const String onInventoryStoreItem = 'OnInventoryStoreItem';
  static const String inventoryTokenFlow = 'Inventory Token Flow';
  static const String takeItemValidation = 'Take Item Validation';
}

// 日志级别枚举
class LogLevels {
  static const String notice = 'Notice';
  static const String warning = 'Warning';
  static const String error = 'Error';
  static const String info = 'Info';
  static const String debug = 'Debug';
}