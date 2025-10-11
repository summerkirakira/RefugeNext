import 'package:refuge_next/src/datasource/models/game_log.dart';

class GameLogParser {
  // 正则表达式用于匹配不同部分
  static final RegExp _timestampPattern = RegExp(r'<(\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d{3}Z)>');
  static final RegExp _logLevelPattern = RegExp(r'\[(Notice|Warning|Error|Info|Debug)\]');
  static final RegExp _logTypePattern = RegExp(r'<([^>]+)>');
  static final RegExp _playerPattern = RegExp(r"(?:Player |'|by ')([^']+)'?\s*\[(\d+)\]");
  static final RegExp _requestPattern = RegExp(r'Request\[(\d+)\]');
  static final RegExp _entityPattern = RegExp(r'(?:Entity|Item|store)\[([^\]]+)\]');
  static final RegExp _inventoryPattern = RegExp(r'Inventory\[([^\]]+)\]');
  static final RegExp _resultPattern = RegExp(r'Result\[(Succeed|Failed|Valid|Invalid)\]');
  static final RegExp _elapsedPattern = RegExp(r'Elapsed\[([0-9.]+)\]');
  static final RegExp _teamPattern = RegExp(r'\[([^\]]+)\]\[([^\]]+)\]$');
  static final RegExp _classPattern = RegExp(r'Class\[([^\]]+)\]');
  static final RegExp _portPattern = RegExp(r'Port\[([^\]]+)\]');
  static final RegExp _actionPattern = RegExp(r'Type\[(Store|Take|Attach|Detach|Move)\]');
  static final List<String> trackedLogTypes = [
    'Game Version',
    'InitiateLogin',
    'AsyncLoginCallback',
    'AttachmentReceived',
    'Inventory Token Flow',
    'Spawn Flow',
    'Connection Flow',
    'Vehicle Control Flow',
    'Jump Drive State Changed',
    'Vehicle Destruction',
    'ObjectiveUpserted',
    'Authority Changed',
    'Actor Death',
    'MissionEnded',
    'EndMission',
    'SystemQuit'
  ];
  // 解析单行日志
  static GameLog? parseLine(String logLine) {
    try {
      // 提取日志类型（第二个尖括号内的内容）
      final logTypeMatches = _logTypePattern.allMatches(logLine).toList();
      if (logTypeMatches.length < 2) return null;
      final logType = logTypeMatches[1].group(1)!;
      if (!trackedLogTypes.contains(logType)) return null;

      // 提取时间戳
      final timestampMatch = _timestampPattern.firstMatch(logLine);
      if (timestampMatch == null) return null;
      final timestamp = DateTime.parse(timestampMatch.group(1)!);

      // 提取日志级别
      final logLevelMatch = _logLevelPattern.firstMatch(logLine);
      final logLevel = logLevelMatch?.group(1) ?? 'Debug';



      // 提取子类型（通常在行末的方括号中）
      final teamMatch = _teamPattern.firstMatch(logLine);
      final subType = teamMatch?.group(1);

      // 提取玩家信息
      final playerMatch = _playerPattern.firstMatch(logLine);
      final playerName = playerMatch?.group(1);
      final playerId = playerMatch?.group(2);

      // 提取请求ID
      final requestMatch = _requestPattern.firstMatch(logLine);
      final requestId = requestMatch != null ? int.tryParse(requestMatch.group(1)!) : null;

      // 提取实体信息
      String? entityId;
      String? entityName;
      String? entityClass;

      // 处理不同格式的实体信息
      if (logLine.contains('Entity[')) {
        final entityInfo = RegExp(r'Entity\[([^\]]+)\]').firstMatch(logLine);
        if (entityInfo != null) {
          final parts = entityInfo.group(1)!.split(' - ');
          if (parts.isNotEmpty) {
            // 格式: entity_name - Class(class_name) - ...
            entityName = parts[0].trim();

            // 提取实体ID（通常是名称末尾的数字）
            final idMatch = RegExp(r'_(\d+)$').firstMatch(entityName);
            if (idMatch != null) {
              entityId = idMatch.group(1);
            }

            // 提取Class信息
            if (parts.length > 1) {
              final classMatch = RegExp(r'Class\(([^)]+)\)').firstMatch(parts[1]);
              if (classMatch != null) {
                entityClass = classMatch.group(1);
              }
            }
          }
        }
      } else if (logLine.contains("store '")) {
        // 格式: store 'entity_name' [entity_id]
        final storeMatch = RegExp(r"store '([^']+)'\s*\[(\d+)\]").firstMatch(logLine);
        if (storeMatch != null) {
          entityName = storeMatch.group(1);
          entityId = storeMatch.group(2);
        }
      } else if (logLine.contains("Attachment[")) {
        // 格式: Attachment[name, class, id]
        final attachMatch = RegExp(r'Attachment\[([^,]+),\s*([^,]+),\s*(\d+)\]').firstMatch(logLine);
        if (attachMatch != null) {
          entityName = attachMatch.group(1);
          entityClass = attachMatch.group(2);
          entityId = attachMatch.group(3);
        }
      } else if (logLine.contains("entity name:")) {
        // 格式: entity name: name, entity class: class
        final nameMatch = RegExp(r'entity name:\s*([^,]+)').firstMatch(logLine);
        final classMatch = RegExp(r'entity class:\s*([^,]+)').firstMatch(logLine);
        entityName = nameMatch?.group(1)?.trim();
        entityClass = classMatch?.group(1)?.trim();

        // 尝试从名称提取ID
        if (entityName != null) {
          final idMatch = RegExp(r'_(\d+)$').firstMatch(entityName);
          if (idMatch != null) {
            entityId = idMatch.group(1);
          }
        }
      }

      // 如果还没有提取到class，尝试从Class[...]模式提取
      if (entityClass == null) {
        final classMatch = _classPattern.firstMatch(logLine);
        entityClass = classMatch?.group(1);
      }

      // 提取库存信息
      final inventoryMatch = _inventoryPattern.firstMatch(logLine);
      final inventoryId = inventoryMatch?.group(1);

      // 提取位置信息（Port或Location）
      final portMatch = _portPattern.firstMatch(logLine);
      String? location = portMatch?.group(1);

      if (location == null && logLine.contains('SourceInventory[')) {
        final sourceMatch = RegExp(r'SourceInventory\[([^\]]+)\]').firstMatch(logLine);
        location = sourceMatch?.group(1);
      } else if (location == null && logLine.contains('TargetInventory[')) {
        final targetMatch = RegExp(r'TargetInventory\[([^\]]+)\]').firstMatch(logLine);
        location = targetMatch?.group(1);
      }

      // 提取动作类型
      final actionMatch = _actionPattern.firstMatch(logLine);
      final action = actionMatch?.group(1);

      // 提取结果
      final resultMatch = _resultPattern.firstMatch(logLine);
      final result = resultMatch?.group(1);

      // 提取耗时
      final elapsedMatch = _elapsedPattern.firstMatch(logLine);
      final elapsed = elapsedMatch != null ? double.tryParse(elapsedMatch.group(1)!) : null;

      // 构建额外的解析数据
      final Map<String, dynamic> parsedData = {};

      // 提取额外的信息
      if (logLine.contains('ItemsCount[')) {
        final countMatch = RegExp(r'ItemsCount\[(\d+)\]').firstMatch(logLine);
        if (countMatch != null) {
          parsedData['items_count'] = int.parse(countMatch.group(1)!);
        }
      }

      if (logLine.contains('Rank[')) {
        final rankMatch = RegExp(r'Rank\[([^\]]+)\]').firstMatch(logLine);
        if (rankMatch != null) {
          parsedData['rank'] = rankMatch.group(1);
        }
      }

      if (logLine.contains('Status[')) {
        final statusMatch = RegExp(r'Status\[([^\]]+)\]').firstMatch(logLine);
        if (statusMatch != null) {
          parsedData['status'] = statusMatch.group(1);
        }
      }

      if (logLine.contains('amount[')) {
        final amountMatch = RegExp(r'amount\[(\d+)\]').firstMatch(logLine);
        if (amountMatch != null) {
          parsedData['amount'] = int.parse(amountMatch.group(1)!);
        }
      }

      if (logLine.contains('stack(s)')) {
        final stackMatch = RegExp(r'(\d+)\s+stack\(s\)').firstMatch(logLine);
        if (stackMatch != null) {
          parsedData['stacks'] = int.parse(stackMatch.group(1)!);
        }
      }

      return GameLog(
        timestamp: timestamp,
        logLevel: logLevel,
        logType: logType,
        subType: subType,
        playerId: playerId,
        playerName: playerName,
        requestId: requestId,
        entityId: entityId,
        entityName: entityName,
        entityClass: entityClass,
        location: location,
        inventoryId: inventoryId,
        action: action,
        result: result,
        elapsed: elapsed,
        content: logLine.trim(),
        parsedData: parsedData.isNotEmpty ? parsedData : null,
      );
    } catch (e) {
      print('Error parsing log line: $e');
      print('Log line: $logLine');
      return null;
    }
  }

  // 批量解析日志文本
  static List<GameLog> parseLogText(String logText) {
    final lines = logText.split('\n').where((line) => line.trim().isNotEmpty);
    final logs = <GameLog>[];

    for (final line in lines) {
      final log = parseLine(line);
      if (log != null) {
        logs.add(log);
      }
    }

    return logs;
  }

  // 从文件解析日志
  static Future<List<GameLog>> parseLogFile(String filePath) async {
    // 这里可以添加文件读取逻辑
    // 目前返回空列表，需要时可以实现
    return [];
  }

  // 验证日志行是否为有效的游戏日志
  static bool isValidLogLine(String line) {
    return _timestampPattern.hasMatch(line) && _logTypePattern.hasMatch(line);
  }

  // 提取日志类型列表（用于分类）
  static Set<String> extractLogTypes(List<GameLog> logs) {
    return logs.map((log) => log.logType).toSet();
  }

  // 提取玩家列表
  static Set<String> extractPlayers(List<GameLog> logs) {
    return logs
        .where((log) => log.playerName != null)
        .map((log) => log.playerName!)
        .toSet();
  }

  // 按请求ID分组日志
  static Map<int, List<GameLog>> groupByRequestId(List<GameLog> logs) {
    final grouped = <int, List<GameLog>>{};

    for (final log in logs) {
      if (log.requestId != null) {
        grouped.putIfAbsent(log.requestId!, () => []).add(log);
      }
    }

    // 按时间排序每个请求的日志
    grouped.forEach((key, value) {
      value.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    });

    return grouped;
  }

  // 分析请求的生命周期
  static Map<String, dynamic>? analyzeRequest(List<GameLog> requestLogs) {
    if (requestLogs.isEmpty) return null;

    final firstLog = requestLogs.first;
    final lastLog = requestLogs.last;

    // 找出请求的结果
    final resultLog = requestLogs.firstWhere(
      (log) => log.result != null,
      orElse: () => requestLogs.last,
    );

    return {
      'request_id': firstLog.requestId,
      'player_name': firstLog.playerName,
      'player_id': firstLog.playerId,
      'start_time': firstLog.timestamp.toIso8601String(),
      'end_time': lastLog.timestamp.toIso8601String(),
      'duration': lastLog.timestamp.difference(firstLog.timestamp).inMilliseconds / 1000.0,
      'result': resultLog.result,
      'action': firstLog.action,
      'entity_name': firstLog.entityName,
      'entity_id': firstLog.entityId,
      'log_count': requestLogs.length,
    };
  }
}