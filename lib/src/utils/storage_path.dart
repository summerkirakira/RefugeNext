import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

/// 获取应用数据存储目录
///
/// 在桌面平台（Windows/macOS/Linux）上：
/// - 返回 Documents/refuge_next/ 目录
/// - 用于隔离应用数据，避免污染用户的 Documents 目录
///
/// 在移动平台（Android/iOS）上：
/// - 返回应用沙盒的 Documents 目录
/// - 已经是应用独立的，无需额外子目录
class StoragePath {
  /// 获取应用数据根目录
  static Future<Directory> getAppDataDirectory() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();

    // 判断是否为桌面平台
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      // 桌面平台：使用 refuge_next 子目录
      final appDataPath = path.join(documentsDirectory.path, 'refuge_next');
      final appDataDirectory = Directory(appDataPath);

      // 确保目录存在
      if (!await appDataDirectory.exists()) {
        await appDataDirectory.create(recursive: true);
      }

      return appDataDirectory;
    } else {
      // 移动平台：直接使用应用文档目录（已经是应用沙盒）
      return documentsDirectory;
    }
  }

  /// 获取应用数据根目录的路径字符串
  static Future<String> getAppDataPath() async {
    final directory = await getAppDataDirectory();
    return directory.path;
  }
}
