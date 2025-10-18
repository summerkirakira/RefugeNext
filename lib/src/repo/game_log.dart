import 'dart:convert';
import 'package:refuge_next/src/datasource/models/game_log.dart';
import 'package:refuge_next/src/services/database_service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameLogRepo {
  static final GameLogRepo _instance = GameLogRepo._internal();

  GameLogRepo._internal();

  factory GameLogRepo() => _instance;

  // 防抖机制：标记是否正在解析日志
  bool _isParsing = false;

  // 获取当前是否正在解析
  bool get isParsing => _isParsing;

  // 插入单条日志
  Future<int> insertLog(GameLog log) async {
    final db = await DatabaseService.instance.database;
    return await db.insert(
      'game_logs',
      log.toDatabase(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // 批量插入日志（带去重和防抖）
  Future<Map<String, int>> insertLogs(List<GameLog> logs) async {
    // 防抖检查：如果正在解析，直接返回
    if (_isParsing) {
      return {
        'inserted': 0,
        'skipped': logs.length,
        'total': logs.length,
        'ignored': logs.length, // 因防抖被忽略的数量
      };
    }

    // 设置解析状态
    _isParsing = true;

    try {
      final db = await DatabaseService.instance.database;

      int inserted = 0;
      int skipped = 0;

      // 逐条插入以统计结果
      for (final log in logs) {
        try {
          await db.insert(
            'game_logs',
            log.toDatabase(),
            conflictAlgorithm: ConflictAlgorithm.ignore, // 忽略重复项
          );
          inserted++;
        } catch (e) {
          skipped++;
        }
      }

      return {
        'inserted': inserted,
        'skipped': skipped,
        'total': logs.length,
      };
    } finally {
      // 确保无论成功还是失败都重置状态
      _isParsing = false;
    }
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

  // 获取指定时间之后的所有日志
  Future<List<GameLog>> getLogsAfter({
    required DateTime afterTime,
    int? limit,
    int? offset,
  }) async {
    final db = await DatabaseService.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'game_logs',
      where: 'timestamp > ?',
      whereArgs: [afterTime.millisecondsSinceEpoch],
      orderBy: 'timestamp ASC', // 按时间升序，便于上传
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
    String? keyword,
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

    // 关键字搜索（搜索content、entity_name、player_name字段）
    if (keyword != null && keyword.isNotEmpty) {
      conditions.add('(content LIKE ? OR entity_name LIKE ? OR player_name LIKE ?)');
      args.add('%$keyword%');
      args.add('%$keyword%');
      args.add('%$keyword%');
    }

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

  // 获取本地数据库中最新的日志时间
  Future<DateTime?> getLatestLogTime() async {
    final db = await DatabaseService.instance.database;
    final result = await db.query(
      'game_logs',
      columns: ['timestamp'],
      orderBy: 'timestamp DESC',
      limit: 1,
    );

    if (result.isEmpty) {
      return null;
    }

    return DateTime.fromMillisecondsSinceEpoch(result.first['timestamp'] as int);
  }

  // 获取指定玩家的最新日志时间
  Future<DateTime?> getLatestLogTimeByPlayer(String playerId) async {
    final db = await DatabaseService.instance.database;
    final result = await db.query(
      'game_logs',
      columns: ['timestamp'],
      where: 'player_id = ?',
    whereArgs: [playerId],
      orderBy: 'timestamp DESC',
      limit: 1,
    );

    if (result.isEmpty) {
      return null;
    }

    return DateTime.fromMillisecondsSinceEpoch(result.first['timestamp'] as int);
  }

  // 获取任务完成数（content包含<EndMission>的日志数量）
  Future<int> getMissionCompletedCount() async {
    final db = await DatabaseService.instance.database;
    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM game_logs WHERE content LIKE ?',
      ['%<EndMission>%'],
    );
    return result.first['count'] as int;
  }

  // 获取玩家击杀数（content包含"killed by '玩家名'"的日志数量）
  Future<int> getPlayerKillCount(String playerHandle) async {
    final db = await DatabaseService.instance.database;
    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM game_logs WHERE content LIKE ?',
      ['%killed by \'$playerHandle\'%'],
    );
    return result.first['count'] as int;
  }

  // 获取玩家被杀数（content包含"<Actor Death> CActor::Kill: '玩家handle'"的日志数量）
  Future<int> getPlayerDeathCount(String playerHandle) async {
    final db = await DatabaseService.instance.database;
    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM game_logs WHERE content LIKE ?',
      ['%<Actor Death> CActor::Kill: \'$playerHandle\'%'],
    );
    return result.first['count'] as int;
  }

  // 计算两周内的游戏时长（分钟）
  Future<int> getGamePlayTimeInTwoWeeks() async {
    final db = await DatabaseService.instance.database;
    final now = DateTime.now();
    final twoWeeksAgo = now.subtract(Duration(days: 14));

    // 查询两周内的登录日志
    final loginLogs = await db.query(
      'game_logs',
      where: 'log_type = ? AND timestamp >= ?',
      whereArgs: ['AccountLoginCharacterStatus_Character', twoWeeksAgo.millisecondsSinceEpoch],
      orderBy: 'timestamp ASC',
    );

    // 查询两周内的退出日志
    final quitLogs = await db.query(
      'game_logs',
      where: 'log_type = ? AND timestamp >= ?',
      whereArgs: ['SystemQuit', twoWeeksAgo.millisecondsSinceEpoch],
      orderBy: 'timestamp ASC',
    );

    if (quitLogs.isEmpty) {
      return 0; // 没有退出日志，无法计算时长
    }

    int totalMinutes = 0;
    int loginIndex = 0;
    int quitIndex = 0;

    // 边界情况：如果第一条退出日志在第一条登录日志之前（或没有登录日志）
    // 说明在两周窗口之前就已经登录了，将窗口起始时间作为隐式登录时间
    if (loginLogs.isEmpty ||
        (quitLogs.isNotEmpty &&
         DateTime.fromMillisecondsSinceEpoch(quitLogs[0]['timestamp'] as int)
           .isBefore(DateTime.fromMillisecondsSinceEpoch(loginLogs[0]['timestamp'] as int)))) {
      final firstQuitTime = DateTime.fromMillisecondsSinceEpoch(quitLogs[0]['timestamp'] as int);
      final duration = firstQuitTime.difference(twoWeeksAgo);
      totalMinutes += duration.inMinutes;
      quitIndex++; // 跳过已处理的第一个退出日志
    }

    // 配对登录和退出，计算时间差
    while (loginIndex < loginLogs.length && quitIndex < quitLogs.length) {
      final loginTime = DateTime.fromMillisecondsSinceEpoch(loginLogs[loginIndex]['timestamp'] as int);
      final quitTime = DateTime.fromMillisecondsSinceEpoch(quitLogs[quitIndex]['timestamp'] as int);

      // 如果退出时间在登录时间之后，说明找到了一对
      if (quitTime.isAfter(loginTime)) {
        final duration = quitTime.difference(loginTime);
        totalMinutes += duration.inMinutes;
        loginIndex++;
        quitIndex++;
      } else {
        // 退出时间在登录时间之前，跳过这个退出日志（理论上不应该出现）
        quitIndex++;
      }
    }

    return totalMinutes;
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

  // 清理重复日志（保留最早的记录）
  Future<int> removeDuplicates() async {
    final db = await DatabaseService.instance.database;

    // 查找重复的日志（相同的timestamp和content）
    final duplicates = await db.rawQuery('''
      SELECT timestamp, content, MIN(id) as keep_id
      FROM game_logs
      GROUP BY timestamp, content
      HAVING COUNT(*) > 1
    ''');

    if (duplicates.isEmpty) {
      return 0;
    }

    int deletedCount = 0;

    // 删除重复的日志，保留最早的
    for (final dup in duplicates) {
      final timestamp = dup['timestamp'] as int;
      final content = dup['content'] as String;
      final keepId = dup['keep_id'] as int;

      final deleted = await db.delete(
        'game_logs',
        where: 'timestamp = ? AND content = ? AND id != ?',
        whereArgs: [timestamp, content, keepId],
      );

      deletedCount += deleted;
    }

    return deletedCount;
  }

  // 获取重复日志的数量
  Future<int> getDuplicateCount() async {
    final db = await DatabaseService.instance.database;

    final result = await db.rawQuery('''
      SELECT SUM(count - 1) as dup_count
      FROM (
        SELECT COUNT(*) as count
        FROM game_logs
        GROUP BY timestamp, content
        HAVING count > 1
      )
    ''');

    return (result.first['dup_count'] as int?) ?? 0;
  }

  // 检查日志是否已存在
  Future<bool> logExists(DateTime timestamp, String content) async {
    final db = await DatabaseService.instance.database;

    final result = await db.query(
      'game_logs',
      where: 'timestamp = ? AND content = ?',
      whereArgs: [timestamp.millisecondsSinceEpoch, content],
      limit: 1,
    );

    return result.isNotEmpty;
  }

  // 手动设置解析状态为开始（用于外部控制防抖）
  void startParsing() {
    _isParsing = true;
  }

  // 手动设置解析状态为结束（用于外部控制防抖）
  void endParsing() {
    _isParsing = false;
  }

  // 重置解析状态（用于异常情况下的状态恢复）
  void resetParsingState() {
    _isParsing = false;
  }

  // ==================== 历史日志文件处理记录管理 ====================

  static const String _processedFilesKey = 'app.game_logs.processed_files';

  // 标记历史日志文件为已处理
  Future<void> markFileAsProcessed(String fileName) async {
    final prefs = await SharedPreferences.getInstance();
    final processedFiles = await getProcessedFiles();

    if (!processedFiles.contains(fileName)) {
      processedFiles.add(fileName);
      await prefs.setStringList(_processedFilesKey, processedFiles);
    }
  }

  // 检查历史日志文件是否已处理
  Future<bool> isFileProcessed(String fileName) async {
    final processedFiles = await getProcessedFiles();
    return processedFiles.contains(fileName);
  }

  // 获取所有已处理的历史日志文件列表
  Future<List<String>> getProcessedFiles() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_processedFilesKey) ?? [];
  }

  // 清空已处理文件记录（用于重新导入所有历史日志）
  Future<void> clearProcessedFiles() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_processedFilesKey);
  }

  // 获取已处理文件数量
  Future<int> getProcessedFileCount() async {
    final processedFiles = await getProcessedFiles();
    return processedFiles.length;
  }
}