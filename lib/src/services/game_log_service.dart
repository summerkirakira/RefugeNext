import 'dart:io';
import 'dart:convert';
import 'package:path/path.dart' as path;

class GameLogService {
  static final GameLogService _instance = GameLogService._internal();

  GameLogService._internal();

  factory GameLogService() => _instance;

  // 验证是否为有效的Star Citizen游戏目录
  static bool isValidGameDirectory(String dirPath) {
    final dir = Directory(dirPath);
    if (!dir.existsSync()) return false;

    // 检查是否存在LIVE文件夹
    final liveDir = Directory(path.join(dirPath, 'LIVE'));
    if (!liveDir.existsSync()) return false;

    return true;
  }

  // 获取游戏日志文件路径
  static String getGameLogPath(String gameDir) {
    return path.join(gameDir, 'LIVE', 'Game.log');
  }

  // 读取游戏日志文件
  static Future<String?> readGameLog(String gameDir) async {
    try {
      final logPath = getGameLogPath(gameDir);
      final logFile = File(logPath);

      if (!logFile.existsSync()) {
        return null;
      }

      // 读取日志文件内容
      return await logFile.readAsString(encoding: utf8);
    } catch (e) {
      print('Error reading game log: $e');
      return null;
    }
  }

  // 读取最后N行日志
  static Future<String?> readLastNLines(String gameDir, int n) async {
    try {
      final logPath = getGameLogPath(gameDir);
      final logFile = File(logPath);

      if (!logFile.existsSync()) {
        return null;
      }

      final bytes = await logFile.readAsBytes();
      final start = bytes.length >= 3 && bytes[0] == 0xEF && bytes[1] == 0xBB && bytes[2] == 0xBF ? 3 : 0;


      final content = utf8.decode(bytes.sublist(start), allowMalformed: true);
      final lines = content.split('\n');
      final lastLines = lines.length > n ? lines.sublist(lines.length - n) : lines;

      return lastLines.join('\n');
    } catch (e) {
      print('Error reading last N lines: $e');
      return null;
    }
  }

  // 获取日志文件大小（MB）
  static Future<double?> getLogFileSize(String gameDir) async {
    try {
      final logPath = getGameLogPath(gameDir);
      final logFile = File(logPath);

      if (!logFile.existsSync()) {
        return null;
      }

      final bytes = await logFile.length();
      return bytes / (1024 * 1024); // 转换为MB
    } catch (e) {
      print('Error getting log file size: $e');
      return null;
    }
  }

  // 获取日志文件最后修改时间
  static Future<DateTime?> getLogFileLastModified(String gameDir) async {
    try {
      final logPath = getGameLogPath(gameDir);
      final logFile = File(logPath);

      if (!logFile.existsSync()) {
        return null;
      }

      return await logFile.lastModified();
    } catch (e) {
      print('Error getting log file last modified time: $e');
      return null;
    }
  }

  // 尝试自动查找Star Citizen安装目录
  static Future<String?> findGameDirectory() async {
    if (!Platform.isWindows) return null;

    // 常见的安装路径
    final possiblePaths = [
      r'C:\Program Files\Roberts Space Industries\StarCitizen',
      r'C:\Program Files (x86)\Roberts Space Industries\StarCitizen',
      r'D:\Program Files\Roberts Space Industries\StarCitizen',
      r'D:\Roberts Space Industries\StarCitizen',
      r'E:\Program Files\Roberts Space Industries\StarCitizen',
      r'E:\Roberts Space Industries\StarCitizen',
    ];

    for (final dirPath in possiblePaths) {
      if (isValidGameDirectory(dirPath)) {
        return dirPath;
      }
    }

    return null;
  }

  // 监控日志文件变化
  static Stream<FileSystemEvent>? watchLogFile(String gameDir) {
    try {
      final logPath = getGameLogPath(gameDir);
      final logFile = File(logPath);

      if (!logFile.existsSync()) {
        return null;
      }

      return logFile.watch();
    } catch (e) {
      print('Error watching log file: $e');
      return null;
    }
  }

  // 读取指定时间之后的日志
  static Future<String?> readLogsSince(String gameDir, DateTime since) async {
    try {
      final logPath = getGameLogPath(gameDir);
      final logFile = File(logPath);

      if (!logFile.existsSync()) {
        return null;
      }

      final lines = await logFile.readAsLines(encoding: utf8);
      final filteredLines = <String>[];

      for (final line in lines) {
        // 提取时间戳并比较
        final timestampMatch = RegExp(r'<(\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d{3}Z)>')
            .firstMatch(line);

        if (timestampMatch != null) {
          try {
            final timestamp = DateTime.parse(timestampMatch.group(1)!);
            if (timestamp.isAfter(since)) {
              filteredLines.add(line);
            }
          } catch (_) {
            // 如果解析失败，跳过这一行
            continue;
          }
        }
      }

      return filteredLines.isEmpty ? null : filteredLines.join('\n');
    } catch (e) {
      print('Error reading logs since: $e');
      return null;
    }
  }

  // 获取 LogBackups 目录路径
  static String getLogBackupsPath(String gameDir) {
    return path.join(gameDir, 'LIVE', 'LogBackups');
  }

  // 扫描历史日志文件
  static Future<List<File>> scanHistoricalLogs(String gameDir) async {
    try {
      final backupsPath = getLogBackupsPath(gameDir);
      final backupsDir = Directory(backupsPath);

      if (!backupsDir.existsSync()) {
        return [];
      }

      // 获取所有 .log 文件
      final files = backupsDir
          .listSync()
          .whereType<File>()
          .where((file) => file.path.endsWith('.log'))
          .toList();

      // 按修改时间排序（最新的在前）
      files.sort((a, b) => b.lastModifiedSync().compareTo(a.lastModifiedSync()));

      return files;
    } catch (e) {
      print('Error scanning historical logs: $e');
      return [];
    }
  }

  // 解析日志文件名提取信息
  // 格式: Game Build(10392434) 09 Oct 25 (23 07 03).log
  static Map<String, dynamic>? parseLogFileName(String fileName) {
    try {
      // 移除 .log 后缀
      final nameWithoutExt = fileName.replaceAll('.log', '');

      // 提取构建版本号
      final buildMatch = RegExp(r'Build\((\d+)\)').firstMatch(nameWithoutExt);
      final buildNumber = buildMatch?.group(1);

      // 提取日期和时间
      // 格式: DD MMM YY (HH MM SS)
      final dateTimeMatch = RegExp(
        r'(\d{2})\s+(\w{3})\s+(\d{2})\s+\((\d{2})\s+(\d{2})\s+(\d{2})\)'
      ).firstMatch(nameWithoutExt);

      if (dateTimeMatch == null) return null;

      final day = int.parse(dateTimeMatch.group(1)!);
      final monthStr = dateTimeMatch.group(2)!;
      final year = int.parse('20${dateTimeMatch.group(3)!}'); // 假设是21世纪
      final hour = int.parse(dateTimeMatch.group(4)!);
      final minute = int.parse(dateTimeMatch.group(5)!);
      final second = int.parse(dateTimeMatch.group(6)!);

      // 月份映射
      const monthMap = {
        'Jan': 1, 'Feb': 2, 'Mar': 3, 'Apr': 4,
        'May': 5, 'Jun': 6, 'Jul': 7, 'Aug': 8,
        'Sep': 9, 'Oct': 10, 'Nov': 11, 'Dec': 12,
      };

      final month = monthMap[monthStr];
      if (month == null) return null;

      final dateTime = DateTime(year, month, day, hour, minute, second);

      return {
        'build_number': buildNumber,
        'date_time': dateTime,
        'file_name': fileName,
      };
    } catch (e) {
      print('Error parsing log file name: $e');
      return null;
    }
  }

  // 读取历史日志文件
  static Future<String?> readHistoricalLog(File logFile) async {
    try {
      if (!logFile.existsSync()) {
        return null;
      }

      final bytes = await logFile.readAsBytes();
      final start = bytes.length >= 3 && bytes[0] == 0xEF && bytes[1] == 0xBB && bytes[2] == 0xBF ? 3 : 0;

      return utf8.decode(bytes.sublist(start), allowMalformed: true);
    } catch (e) {
      print('Error reading historical log: $e');
      return null;
    }
  }

  // 批量读取历史日志（带进度回调）
  static Future<List<Map<String, dynamic>>> batchReadHistoricalLogs(
    String gameDir,
    {Function(int current, int total, String fileName)? onProgress}
  ) async {
    final files = await scanHistoricalLogs(gameDir);
    final results = <Map<String, dynamic>>[];

    for (int i = 0; i < files.length; i++) {
      final file = files[i];
      final fileName = path.basename(file.path);

      onProgress?.call(i + 1, files.length, fileName);

      final fileInfo = parseLogFileName(fileName);
      if (fileInfo == null) {
        continue;
      }

      final content = await readHistoricalLog(file);
      if (content != null && content.isNotEmpty) {
        results.add({
          'file_name': fileName,
          'file_path': file.path,
          'build_number': fileInfo['build_number'],
          'date_time': fileInfo['date_time'],
          'content': content,
        });
      }
    }

    return results;
  }
}