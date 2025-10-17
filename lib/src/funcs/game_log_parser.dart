import 'dart:math' as math;
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
    // 'AsyncLoginCallback',
    'AttachmentReceived',
    // 'Inventory Token Flow',
    'Spawn Flow',
    // 'Connection Flow',
    'Vehicle Control Flow',
    'Jump Drive State Changed',
    'Vehicle Destruction',
    // 'ObjectiveUpserted',
    // 'Authority Changed',
    'Actor Death',
    // 'MissionEnded',
    'EndMission',
    'SystemQuit',
    'CSessionManager::OnClientSpawned',
    'AccountLoginCharacterStatus_Character'
  ];
  // 解析单行日志
  static GameLog? parseLine(String logLine, {String? accountOverride}) {
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

      // 提取account信息（仅针对AccountLoginCharacterStatus_Character类型）
      String? account;
      if (logType == 'AccountLoginCharacterStatus_Character') {
        final accountIdMatch = RegExp(r'accountId\s+(\d+)').firstMatch(logLine);
        final nameMatch = RegExp(r'name\s+(\S+)').firstMatch(logLine);

        if (accountIdMatch != null && nameMatch != null) {
          final accountId = accountIdMatch.group(1);
          final name = nameMatch.group(1);
          account = '$name#$accountId';
        }
      }

      // 优先使用传入的 accountOverride
      final finalAccount = accountOverride ?? account;

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
        parsedData: null,
        account: finalAccount,
      );
    } catch (e) {
      print('Error parsing log line: $e');
      print('Log line: $logLine');
      return null;
    }
  }

  // 批量解析日志文本
  static List<GameLog> parseLogText(String logText) {
    final lines = logText.split('\n').where((line) => line.trim().isNotEmpty).toList();
    final logs = <GameLog>[];
    String? detectedAccount;

    // 第一次遍历：只找 account（找到就退出）
    for (final line in lines) {
      final log = parseLine(line);
      if (log?.account != null) {
        detectedAccount = log!.account;
        break; // 找到第一个 account 就退出
      }
    }

    // 第二次遍历：带着找到的 account 解析所有日志
    for (final line in lines) {
      final log = parseLine(line, accountOverride: detectedAccount);
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

  // ==================== 专用解析方法 ====================

  /// 从原始日志内容解析特定数据（公开方法供UI层调用）
  static Map<String, dynamic> parseData(String logType, String content) {
    return _parseSpecificData(logType, content);
  }

  /// 根据日志类型分发到对应的解析方法
  static Map<String, dynamic> _parseSpecificData(String logType, String logLine) {
    switch (logType) {
      case 'Vehicle Destruction':
        return _parseVehicleDestruction(logLine);
      case 'Game Version':
        return _parseGameVersion(logLine);
      case 'InitiateLogin':
      case 'AsyncLoginCallback':
        return _parseLogin(logLine);
      case 'Inventory Token Flow':
        return _parseInventory(logLine);
      case 'AttachmentReceived':
        return _parseAttachment(logLine);
      case 'Spawn Flow':
        return _parseSpawnFlow(logLine);
      case 'Connection Flow':
        return _parseConnectionFlow(logLine);
      case 'Vehicle Control Flow':
        return _parseVehicleControl(logLine);
      case 'Jump Drive State Changed':
        return _parseJumpDrive(logLine);
      case 'ObjectiveUpserted':
        return _parseObjective(logLine);
      case 'Authority Changed':
        return _parseAuthority(logLine);
      case 'Actor Death':
        return _parseActorDeath(logLine);
      case 'MissionEnded':
      case 'EndMission':
        return _parseMission(logLine);
      case 'SystemQuit':
        return _parseSystemQuit(logLine);
      default:
        return {};
    }
  }

  /// 解析载具摧毁日志
  static Map<String, dynamic> _parseVehicleDestruction(String logLine) {
    final data = <String, dynamic>{};

    if (!logLine.contains('OnAdvanceDestroyLevel')) return data;

    // 提取载具名称和ID
    final vehicleMatch = RegExp(r"Vehicle '([^']+)'\s*\[(\d+)\]").firstMatch(logLine);
    if (vehicleMatch != null) {
      final fullName = vehicleMatch.group(1)!;
      final vehicleId = vehicleMatch.group(2)!;

      // 清理载具名称（移除末尾的ID）
      final cleanName = fullName.replaceAll(RegExp(r'_\d+$'), '').replaceAll('_', ' ');

      data['vehicle_name'] = cleanName;
      data['vehicle_id'] = vehicleId;
    }

    // 提取区域
    final zoneMatch = RegExp(r"in zone '([^']+)'").firstMatch(logLine);
    if (zoneMatch != null) {
      final rawZone = zoneMatch.group(1)!;
      // 清理区域名称
      final cleanZone = rawZone
          .replaceAll('OOC_', '')
          .replaceAll('Stanton_', 'Stanton ')
          .replaceAll('_', ' ');
      data['zone'] = cleanZone;
    }

    // 提取位置坐标
    final posMatch = RegExp(r'pos x:\s*([-\d.]+),\s*y:\s*([-\d.]+),\s*z:\s*([-\d.]+)').firstMatch(logLine);
    if (posMatch != null) {
      data['position'] = {
        'x': double.parse(posMatch.group(1)!),
        'y': double.parse(posMatch.group(2)!),
        'z': double.parse(posMatch.group(3)!),
      };
    }

    // 提取速度向量
    final velMatch = RegExp(r'vel x:\s*([-\d.]+),\s*y:\s*([-\d.]+),\s*z:\s*([-\d.]+)').firstMatch(logLine);
    if (velMatch != null) {
      final vx = double.parse(velMatch.group(1)!);
      final vy = double.parse(velMatch.group(2)!);
      final vz = double.parse(velMatch.group(3)!);

      data['velocity'] = {'x': vx, 'y': vy, 'z': vz};

      // 计算速度大小
      final speed = math.sqrt((vx * vx + vy * vy + vz * vz).abs());
      data['speed'] = speed;
    }

    // 提取驾驶员信息
    final driverMatch = RegExp(r"driven by '([^']+)'\s*\[(\d+)\]").firstMatch(logLine);
    if (driverMatch != null) {
      data['driver_name'] = driverMatch.group(1);
      data['driver_id'] = driverMatch.group(2);
    }

    // 提取摧毁等级变化
    final destroyMatch = RegExp(r'from destroy level (\d+) to (\d+)').firstMatch(logLine);
    if (destroyMatch != null) {
      data['destroy_from'] = int.parse(destroyMatch.group(1)!);
      data['destroy_to'] = int.parse(destroyMatch.group(2)!);
    }

    // 提取攻击者信息
    final attackerMatch = RegExp(r"caused by '([^']+)'\s*\[(\d+)\]").firstMatch(logLine);
    if (attackerMatch != null) {
      data['attacker_name'] = attackerMatch.group(1);
      data['attacker_id'] = attackerMatch.group(2);
    }

    // 提取战斗类型
    final combatMatch = RegExp(r"with '([^']+)'").firstMatch(logLine);
    if (combatMatch != null) {
      data['combat_type'] = combatMatch.group(1);
    }

    return data;
  }

  /// 解析游戏版本日志
  static Map<String, dynamic> _parseGameVersion(String logLine) {
    final data = <String, dynamic>{};

    // 提取版本标识符
    final identifierMatch = RegExp(r'Game Version Identifier:\s*([a-f0-9-]+)').firstMatch(logLine);
    if (identifierMatch != null) {
      data['version_identifier'] = identifierMatch.group(1);
    }

    // 提取游戏版本
    final gameVersionMatch = RegExp(r'GameVersion:\s*(\d+)').firstMatch(logLine);
    if (gameVersionMatch != null) {
      data['game_version'] = int.parse(gameVersionMatch.group(1)!);
    }

    // 提取DataCore版本
    final dataCoreMatch = RegExp(r'DataCore:\s*(\d+)').firstMatch(logLine);
    if (dataCoreMatch != null) {
      data['data_core'] = int.parse(dataCoreMatch.group(1)!);
    }

    // 提取ClassRegistry版本
    final classRegistryMatch = RegExp(r'ClassRegistry:\s*(\d+)').firstMatch(logLine);
    if (classRegistryMatch != null) {
      data['class_registry'] = int.parse(classRegistryMatch.group(1)!);
    }

    // 提取Archetypes版本
    final archetypesMatch = RegExp(r'Archetypes:\s*(\d+)').firstMatch(logLine);
    if (archetypesMatch != null) {
      data['archetypes'] = int.parse(archetypesMatch.group(1)!);
    }

    // 提取Components版本
    final componentsMatch = RegExp(r'Components:\s*(\d+)').firstMatch(logLine);
    if (componentsMatch != null) {
      data['components'] = int.parse(componentsMatch.group(1)!);
    }

    // 提取OC版本
    final ocMatch = RegExp(r'OC:\s*(\d+)').firstMatch(logLine);
    if (ocMatch != null) {
      data['oc'] = int.parse(ocMatch.group(1)!);
    }

    return data;
  }

  /// 解析登录日志
  static Map<String, dynamic> _parseLogin(String logLine) {
    final data = <String, dynamic>{};

    // 提取状态（Started/Completed/Failed等）
    final statusMatch = RegExp(r'<InitiateLogin>\s+(\w+)\.').firstMatch(logLine);
    if (statusMatch != null) {
      final status = statusMatch.group(1)!;
      data['status'] = status;

      // 翻译状态
      switch (status) {
        case 'Started':
          data['status_description'] = '开始';
          break;
        case 'Completed':
          data['status_description'] = '完成';
          break;
        case 'Failed':
          data['status_description'] = '失败';
          break;
        default:
          data['status_description'] = status;
      }
    }

    // 提取游戏版本标识符
    final versionMatch = RegExp(r'Game Version Identifier:\s*([a-f0-9-]+)').firstMatch(logLine);
    if (versionMatch != null) {
      data['version_identifier'] = versionMatch.group(1);
    }

    return data;
  }

  /// 解析库存日志 (占位符)
  static Map<String, dynamic> _parseInventory(String logLine) {
    // TODO: 实现库存日志解析
    return {};
  }

  /// 解析装备附件日志
  static Map<String, dynamic> _parseAttachment(String logLine) {
    final data = <String, dynamic>{};

    // 提取装备信息（Attachment[name, class, id]格式）
    final attachmentMatch = RegExp(r'Attachment\[([^,]+),\s*([^,]+),\s*(\d+)\]').firstMatch(logLine);
    if (attachmentMatch != null) {
      final fullName = attachmentMatch.group(1)!.trim();
      final attachmentClass = attachmentMatch.group(2)!.trim();
      final attachmentId = attachmentMatch.group(3)!;

      // 清理装备名称（使用class字段，因为它更干净）
      final cleanName = attachmentClass.replaceAll('_', ' ');

      data['attachment_name'] = cleanName;
      data['attachment_id'] = attachmentId;
      data['attachment_class'] = attachmentClass;
      data['attachment_full_name'] = fullName;
    }

    // 提取状态
    final statusMatch = RegExp(r'Status\[([^\]]+)\]').firstMatch(logLine);
    if (statusMatch != null) {
      data['status'] = statusMatch.group(1);
    }

    // 提取端口信息
    final portMatch = RegExp(r'Port\[([^\]]+)\]').firstMatch(logLine);
    if (portMatch != null) {
      final rawPort = portMatch.group(1)!;
      // 清理端口名称（替换下划线为空格）
      final cleanPort = rawPort.replaceAll('_', ' ');
      data['port'] = cleanPort;
      data['port_raw'] = rawPort;
    }

    return data;
  }

  /// 解析生成流程日志
  static Map<String, dynamic> _parseSpawnFlow(String logLine) {
    final data = <String, dynamic>{};

    // 提取玩家名称和ID
    final playerMatch = RegExp(r"Player '([^']+)'\s*\[(\d+)\]").firstMatch(logLine);
    if (playerMatch != null) {
      data['player_name'] = playerMatch.group(1);
      data['player_id'] = playerMatch.group(2);
    }

    // 提取动作类型并翻译
    final actionMatch = RegExp(r'(lost|gained) reservation').firstMatch(logLine);
    if (actionMatch != null) {
      final action = actionMatch.group(1);
      if (action == 'lost') {
        data['action_description'] = '失去出生点预订';
      } else if (action == 'gained') {
        data['action_description'] = '获得出生点预订';
      }
      data['action_type'] = action;
    }

    // 提取出生点名称和ID
    final spawnpointMatch = RegExp(r'spawnpoint ([A-Za-z_\d-]+)\s*\[(\d+)\]').firstMatch(logLine);
    if (spawnpointMatch != null) {
      final fullName = spawnpointMatch.group(1)!;
      final spawnpointId = spawnpointMatch.group(2)!;

      // 清理出生点名称（替换下划线为空格）
      final cleanName = fullName.replaceAll('_', ' ');

      data['spawnpoint_name'] = cleanName;
      data['spawnpoint_id'] = spawnpointId;
      data['spawnpoint_full_name'] = fullName;
    }

    // 提取位置ID
    final locationMatch = RegExp(r'at location (\d+)').firstMatch(logLine);
    if (locationMatch != null) {
      data['location_id'] = locationMatch.group(1);
    }

    return data;
  }

  /// 解析连接流程日志 (占位符)
  static Map<String, dynamic> _parseConnectionFlow(String logLine) {
    // TODO: 实现连接流程解析
    return {};
  }

  /// 解析载具控制日志
  static Map<String, dynamic> _parseVehicleControl(String logLine) {
    final data = <String, dynamic>{};

    // 提取载具信息
    final vehicleMatch = RegExp(r"for '([^']+)'\s*\[(\d+)\]").firstMatch(logLine);
    if (vehicleMatch != null) {
      final fullName = vehicleMatch.group(1)!;
      final vehicleId = vehicleMatch.group(2)!;

      // 清理载具名称
      final cleanName = fullName.replaceAll(RegExp(r'_\d+$'), '').replaceAll('_', ' ');

      data['vehicle_name'] = cleanName;
      data['vehicle_id'] = vehicleId;
      data['vehicle_full_name'] = fullName;
    }

    // 提取动作描述
    if (logLine.contains('releasing control token')) {
      data['action_description'] = '释放控制权';
    } else if (logLine.contains('granted control token')) {
      data['action_description'] = '获取控制权';
    } else if (logLine.contains('requesting control token')) {
      data['action_description'] = '请求控制权';
    }

    return data;
  }

  /// 解析跃迁驱动日志
  static Map<String, dynamic> _parseJumpDrive(String logLine) {
    final data = <String, dynamic>{};

    // 提取状态
    final stateMatch = RegExp(r'Now (\w+)').firstMatch(logLine);
    if (stateMatch != null) {
      data['state'] = stateMatch.group(1);
    }

    // 提取CL版本号
    final clMatch = RegExp(r'CL(\d+)').firstMatch(logLine);
    if (clMatch != null) {
      data['cl_version'] = int.parse(clMatch.group(1)!);
    }

    // 提取权限状态
    if (logLine.contains('NOT AUTH')) {
      data['authority'] = 'NOT AUTH';
    } else if (logLine.contains('AUTH')) {
      data['authority'] = 'AUTH';
    }

    // 提取位置
    final locationMatch = RegExp(r'\|\s*(\w+)\s*\|').firstMatch(logLine);
    if (locationMatch != null) {
      data['location'] = locationMatch.group(1);
    }

    // 提取跃迁驱动设备信息
    final jumpDriveMatch = RegExp(r'\|\s*([A-Za-z_\d]+)\s*\[(\d+)\]').firstMatch(logLine);
    if (jumpDriveMatch != null) {
      final fullName = jumpDriveMatch.group(1)!;
      final jumpDriveId = jumpDriveMatch.group(2)!;

      // 清理跃迁驱动名称
      final cleanName = fullName.replaceAll(RegExp(r'_SCItem_\d+$'), '').replaceAll('_', ' ');

      data['jump_drive_name'] = cleanName;
      data['jump_drive_id'] = jumpDriveId;
      data['jump_drive_full_name'] = fullName;
    }

    // 提取所属飞船
    final shipMatch = RegExp(r'adam:\s*([A-Za-z_\d]+)').firstMatch(logLine);
    if (shipMatch != null) {
      final shipFullName = shipMatch.group(1)!;
      final cleanShipName = shipFullName.replaceAll(RegExp(r'_\d+$'), '').replaceAll('_', ' ');
      data['parent_ship'] = cleanShipName;
      data['parent_ship_full_name'] = shipFullName;
    }

    // 提取区域
    final zoneMatch = RegExp(r'in zone ([A-Za-z_\d]+)').firstMatch(logLine);
    if (zoneMatch != null) {
      final rawZone = zoneMatch.group(1)!;
      // 清理区域名称
      final cleanZone = rawZone
          .replaceAll(RegExp(r'_\d+$'), '')
          .replaceAll('OOC_', '')
          .replaceAll('Stanton_', 'Stanton ')
          .replaceAll('_', ' ');
      data['zone'] = cleanZone;
    }

    return data;
  }

  /// 解析目标更新日志 (占位符)
  static Map<String, dynamic> _parseObjective(String logLine) {
    // TODO: 实现目标更新解析
    return {};
  }

  /// 解析权限变更日志 (占位符)
  static Map<String, dynamic> _parseAuthority(String logLine) {
    // TODO: 实现权限变更解析
    return {};
  }

  /// 解析角色死亡日志
  static Map<String, dynamic> _parseActorDeath(String logLine) {
    final data = <String, dynamic>{};

    if (!logLine.contains('CActor::Kill')) return data;

    // 提取被杀者名称和ID
    final victimMatch = RegExp(r"CActor::Kill:\s*'([^']+)'\s*\[(\d+)\]").firstMatch(logLine);
    if (victimMatch != null) {
      final fullName = victimMatch.group(1)!;
      final victimId = victimMatch.group(2)!;

      // 清理被杀者名称（移除末尾的ID）
      final cleanName = fullName.replaceAll(RegExp(r'_\d+$'), '').replaceAll('_', ' ');

      data['victim_name'] = cleanName;
      data['victim_id'] = victimId;
      data['victim_full_name'] = fullName;
    }

    // 提取区域
    final zoneMatch = RegExp(r"in zone '([^']+)'").firstMatch(logLine);
    if (zoneMatch != null) {
      final rawZone = zoneMatch.group(1)!;
      // 清理区域名称
      final cleanZone = rawZone
          .replaceAll('OOC_', '')
          .replaceAll('Stanton_', 'Stanton ')
          .replaceAll('_', ' ');
      data['zone'] = cleanZone;
    }

    // 提取杀手名称和ID
    final killerMatch = RegExp(r"killed by '([^']+)'\s*\[(\d+)\]").firstMatch(logLine);
    if (killerMatch != null) {
      data['killer_name'] = killerMatch.group(1);
      data['killer_id'] = killerMatch.group(2);
    }

    // 提取武器信息
    final weaponMatch = RegExp(r"using '([^']+)'\s*\[(\d+)\]\s*\[Class ([^\]]+)\]").firstMatch(logLine);
    if (weaponMatch != null) {
      final weaponFullName = weaponMatch.group(1)!;
      final weaponId = weaponMatch.group(2)!;
      final weaponClass = weaponMatch.group(3)!;

      // 清理武器名称
      final cleanWeapon = weaponFullName
          .replaceAll(RegExp(r'_\d+$'), '')
          .replaceAll('_', ' ');

      data['weapon_name'] = cleanWeapon;
      data['weapon_id'] = weaponId;
      data['weapon_class'] = weaponClass;
      data['weapon_full_name'] = weaponFullName;
    }

    // 提取伤害类型
    final damageMatch = RegExp(r"with damage type '([^']+)'").firstMatch(logLine);
    if (damageMatch != null) {
      data['damage_type'] = damageMatch.group(1);
    }

    // 提取击杀方向
    final dirMatch = RegExp(r'from direction x:\s*([-\d.]+),\s*y:\s*([-\d.]+),\s*z:\s*([-\d.]+)').firstMatch(logLine);
    if (dirMatch != null) {
      data['direction'] = {
        'x': double.parse(dirMatch.group(1)!),
        'y': double.parse(dirMatch.group(2)!),
        'z': double.parse(dirMatch.group(3)!),
      };
    }

    // 判断是否自杀
    if (data['victim_id'] != null && data['killer_id'] != null) {
      data['is_suicide'] = data['victim_id'] == data['killer_id'];
    }

    return data;
  }

  /// 解析任务日志
  static Map<String, dynamic> _parseMission(String logLine) {
    final data = <String, dynamic>{};

    // 提取任务ID
    final missionIdMatch = RegExp(r'MissionId\[([a-f0-9-]+)\]').firstMatch(logLine);
    if (missionIdMatch != null) {
      data['mission_id'] = missionIdMatch.group(1);
    }

    // 提取玩家名称
    final playerMatch = RegExp(r'Player\[([^\]]+)\]').firstMatch(logLine);
    if (playerMatch != null) {
      data['player_name'] = playerMatch.group(1);
    }

    // 提取玩家ID
    final playerIdMatch = RegExp(r'PlayerId\[(\d+)\]').firstMatch(logLine);
    if (playerIdMatch != null) {
      data['player_id'] = playerIdMatch.group(1);
    }

    // 提取完成类型并翻译
    final completionMatch = RegExp(r'CompletionType\[([^\]]+)\]').firstMatch(logLine);
    if (completionMatch != null) {
      final completionType = completionMatch.group(1)!;
      data['completion_type'] = completionType;

      // 翻译完成类型
      switch (completionType) {
        case 'Complete':
          data['completion_description'] = '完成';
          break;
        case 'Failed':
          data['completion_description'] = '失败';
          break;
        case 'Abandoned':
          data['completion_description'] = '放弃';
          break;
        default:
          data['completion_description'] = completionType;
      }
    }

    // 提取结束原因
    final reasonMatch = RegExp(r'Reason\[([^\]]+)\]').firstMatch(logLine);
    if (reasonMatch != null) {
      data['reason'] = reasonMatch.group(1);
    }

    return data;
  }

  /// 解析系统退出日志
  static Map<String, dynamic> _parseSystemQuit(String logLine) {
    final data = <String, dynamic>{};

    if (!logLine.contains('CSystem::Quit')) return data;

    // 提取退出原因代码
    final causeMatch = RegExp(r'cause=(\d+)').firstMatch(logLine);
    if (causeMatch != null) {
      data['cause'] = int.parse(causeMatch.group(1)!);
    }

    // 提取退出原因描述
    final reasonMatch = RegExp(r'reason=([^,]+)').firstMatch(logLine);
    if (reasonMatch != null) {
      data['reason'] = reasonMatch.group(1)!.trim();
    }

    // 提取退出代码
    final exitCodeMatch = RegExp(r'exitCode=(\d+)').firstMatch(logLine);
    if (exitCodeMatch != null) {
      data['exit_code'] = int.parse(exitCodeMatch.group(1)!);
    }

    // 提取线程ID
    final threadMatch = RegExp(r'thread id=(\d+)').firstMatch(logLine);
    if (threadMatch != null) {
      data['thread_id'] = int.parse(threadMatch.group(1)!);
    }

    // 提取主线程ID
    final mainThreadMatch = RegExp(r'main thread id=(\d+)').firstMatch(logLine);
    if (mainThreadMatch != null) {
      data['main_thread_id'] = int.parse(mainThreadMatch.group(1)!);
    }

    return data;
  }
}