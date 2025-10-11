import 'dart:convert';
import 'package:refuge_next/src/datasource/models/game_log.dart';
import 'package:refuge_next/src/services/database_service.dart';
import 'package:sqflite/sqflite.dart';

class GameLogRepo {
  static final GameLogRepo _instance = GameLogRepo._internal();

  GameLogRepo._internal();

  factory GameLogRepo() => _instance;

  // 插入单条日志
  Future<int> insertLog(GameLog log) async {
    final db = await DatabaseService.instance.database;
    return await db.insert(
      'game_logs',
      log.toDatabase(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // 批量插入日志
  Future<void> insertLogs(List<GameLog> logs) async {
    final db = await DatabaseService.instance.database;
    final batch = db.batch();

    for (final log in logs) {
      batch.insert(
        'game_logs',
        log.toDatabase(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
  }

  // 获取所有日志
  Future<List<GameLog>> getAllLogs() async {
    final db = await DatabaseService.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'game_logs',
      orderBy: 'timestamp DESC',
    );

    return maps.map((map) => GameLog.fromDatabase(map)).toList();
  }

  // 根据时间范围查询日志
  Future<List<GameLog>> getLogsByTimeRange({
    required DateTime startTime,
    required DateTime endTime,
    int? limit,
    int? offset,
  }) async {
    final db = await DatabaseService.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'game_logs',
      where: 'timestamp >= ? AND timestamp <= ?',
      whereArgs: [
        startTime.millisecondsSinceEpoch,
        endTime.millisecondsSinceEpoch,
      ],
      orderBy: 'timestamp DESC',
      limit: limit,
      offset: offset,
    );

    return maps.map((map) => GameLog.fromDatabase(map)).toList();
  }

  // 根据玩家ID查询日志
  Future<List<GameLog>> getLogsByPlayerId({
    required String playerId,
    int? limit,
    int? offset,
  }) async {
    final db = await DatabaseService.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'game_logs',
      where: 'player_id = ?',
      whereArgs: [playerId],
      orderBy: 'timestamp DESC',
      limit: limit,
      offset: offset,
    );

    return maps.map((map) => GameLog.fromDatabase(map)).toList();
  }

  // 根据日志类型查询
  Future<List<GameLog>> getLogsByType({
    required String logType,
    String? subType,
    int? limit,
    int? offset,
  }) async {
    final db = await DatabaseService.instance.database;

    String where = 'log_type = ?';
    List<dynamic> whereArgs = [logType];

    if (subType != null) {
      where += ' AND sub_type = ?';
      whereArgs.add(subType);
    }

    final List<Map<String, dynamic>> maps = await db.query(
      'game_logs',
      where: where,
      whereArgs: whereArgs,
      orderBy: 'timestamp DESC',
      limit: limit,
      offset: offset,
    );

    return maps.map((map) => GameLog.fromDatabase(map)).toList();
  }

  // 根据请求ID查询日志
  Future<List<GameLog>> getLogsByRequestId(int requestId) async {
    final db = await DatabaseService.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'game_logs',
      where: 'request_id = ?',
      whereArgs: [requestId],
      orderBy: 'timestamp ASC',
    );

    return maps.map((map) => GameLog.fromDatabase(map)).toList();
  }

  // 根据实体ID查询日志
  Future<List<GameLog>> getLogsByEntityId({
    required String entityId,
    int? limit,
    int? offset,
  }) async {
    final db = await DatabaseService.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'game_logs',
      where: 'entity_id = ?',
      whereArgs: [entityId],
      orderBy: 'timestamp DESC',
      limit: limit,
      offset: offset,
    );

    return maps.map((map) => GameLog.fromDatabase(map)).toList();
  }

  // 搜索日志内容
  Future<List<GameLog>> searchLogs({
    required String keyword,
    int? limit,
    int? offset,
  }) async {
    final db = await DatabaseService.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'game_logs',
      where: 'content LIKE ? OR entity_name LIKE ? OR player_name LIKE ?',
      whereArgs: ['%$keyword%', '%$keyword%', '%$keyword%'],
      orderBy: 'timestamp DESC',
      limit: limit,
      offset: offset,
    );

    return maps.map((map) => GameLog.fromDatabase(map)).toList();
  }

  // 复杂查询
  Future<List<GameLog>> queryLogs({
    String? logType,
    String? subType,
    String? playerId,
    String? entityId,
    DateTime? startTime,
    DateTime? endTime,
    String? result,
    String? action,
    int? limit,
    int? offset,
  }) async {
    final db = await DatabaseService.instance.database;

    List<String> conditions = [];
    List<dynamic> args = [];

    if (logType != null) {
      conditions.add('log_type = ?');
      args.add(logType);
    }

    if (subType != null) {
      conditions.add('sub_type = ?');
      args.add(subType);
    }

    if (playerId != null) {
      conditions.add('player_id = ?');
      args.add(playerId);
    }

    if (entityId != null) {
      conditions.add('entity_id = ?');
      args.add(entityId);
    }

    if (startTime != null) {
      conditions.add('timestamp >= ?');
      args.add(startTime.millisecondsSinceEpoch);
    }

    if (endTime != null) {
      conditions.add('timestamp <= ?');
      args.add(endTime.millisecondsSinceEpoch);
    }

    if (result != null) {
      conditions.add('result = ?');
      args.add(result);
    }

    if (action != null) {
      conditions.add('action = ?');
      args.add(action);
    }

    final String? where = conditions.isNotEmpty ? conditions.join(' AND ') : null;

    final List<Map<String, dynamic>> maps = await db.query(
      'game_logs',
      where: where,
      whereArgs: args.isNotEmpty ? args : null,
      orderBy: 'timestamp DESC',
      limit: limit,
      offset: offset,
    );

    return maps.map((map) => GameLog.fromDatabase(map)).toList();
  }

  // 获取日志统计信息
  Future<Map<String, dynamic>> getStatistics({
    DateTime? startTime,
    DateTime? endTime,
  }) async {
    final db = await DatabaseService.instance.database;

    String where = '';
    List<dynamic> whereArgs = [];

    if (startTime != null && endTime != null) {
      where = 'WHERE timestamp >= ? AND timestamp <= ?';
      whereArgs = [
        startTime.millisecondsSinceEpoch,
        endTime.millisecondsSinceEpoch,
      ];
    }

    // 获取总日志数
    final totalCountResult = await db.rawQuery(
      'SELECT COUNT(*) as count FROM game_logs $where',
      whereArgs,
    );

    // 按类型统计
    final typeCountResult = await db.rawQuery(
      'SELECT log_type, COUNT(*) as count FROM game_logs $where GROUP BY log_type',
      whereArgs,
    );

    // 按玩家统计
    final playerCountResult = await db.rawQuery(
      'SELECT player_name, COUNT(*) as count FROM game_logs $where AND player_name IS NOT NULL GROUP BY player_name',
      whereArgs,
    );

    return {
      'total_count': totalCountResult.first['count'],
      'type_distribution': typeCountResult,
      'player_distribution': playerCountResult,
    };
  }

  // 清理旧日志
  Future<int> clearOldLogs(DateTime beforeDate) async {
    final db = await DatabaseService.instance.database;
    return await db.delete(
      'game_logs',
      where: 'timestamp < ?',
      whereArgs: [beforeDate.millisecondsSinceEpoch],
    );
  }

  // 清空所有日志
  Future<int> clearAllLogs() async {
    final db = await DatabaseService.instance.database;
    return await db.delete('game_logs');
  }

  // 获取日志数量
  Future<int> getLogCount() async {
    final db = await DatabaseService.instance.database;
    final result = await db.rawQuery('SELECT COUNT(*) as count FROM game_logs');
    return result.first['count'] as int;
  }

  // 获取最新的N条日志
  Future<List<GameLog>> getRecentLogs(int count) async {
    final db = await DatabaseService.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'game_logs',
      orderBy: 'timestamp DESC',
      limit: count,
    );

    return maps.map((map) => GameLog.fromDatabase(map)).toList();
  }

  // 导出日志到JSON
  Future<String> exportLogsToJson({
    DateTime? startTime,
    DateTime? endTime,
  }) async {
    List<GameLog> logs;

    if (startTime != null && endTime != null) {
      logs = await getLogsByTimeRange(
        startTime: startTime,
        endTime: endTime,
      );
    } else {
      logs = await getAllLogs();
    }

    return jsonEncode(logs.map((log) => log.toJson()).toList());
  }

  // 从JSON导入日志
  Future<void> importLogsFromJson(String jsonString) async {
    final List<dynamic> jsonList = jsonDecode(jsonString);
    final logs = jsonList.map((json) => GameLog.fromJson(json)).toList();
    await insertLogs(logs);
  }
}