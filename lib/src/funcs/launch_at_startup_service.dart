import 'dart:io';
import 'package:launch_at_startup/launch_at_startup.dart';
import 'package:package_info_plus/package_info_plus.dart';

class LaunchAtStartupService {
  static final LaunchAtStartupService _instance = LaunchAtStartupService._internal();

  factory LaunchAtStartupService() {
    return _instance;
  }

  LaunchAtStartupService._internal();

  bool _initialized = false;

  /// 初始化开机自启动服务
  Future<void> initialize() async {
    // 仅在桌面平台初始化
    if (!_isDesktopPlatform()) {
      return;
    }

    if (_initialized) {
      return;
    }

    try {
      final packageInfo = await PackageInfo.fromPlatform();

      launchAtStartup.setup(
        appName: packageInfo.appName,
        appPath: Platform.resolvedExecutable,
      );

      _initialized = true;
    } catch (e) {
      print('Failed to initialize launch_at_startup: $e');
    }
  }

  /// 启用开机自启动
  Future<bool> enable() async {
    if (!_isDesktopPlatform() || !_initialized) {
      return false;
    }

    try {
      await launchAtStartup.enable();
      return true;
    } catch (e) {
      print('Failed to enable launch_at_startup: $e');
      return false;
    }
  }

  /// 禁用开机自启动
  Future<bool> disable() async {
    if (!_isDesktopPlatform() || !_initialized) {
      return false;
    }

    try {
      await launchAtStartup.disable();
      return true;
    } catch (e) {
      print('Failed to disable launch_at_startup: $e');
      return false;
    }
  }

  /// 检查是否已启用开机自启动
  Future<bool> isEnabled() async {
    if (!_isDesktopPlatform() || !_initialized) {
      return false;
    }

    try {
      return await launchAtStartup.isEnabled();
    } catch (e) {
      print('Failed to check launch_at_startup status: $e');
      return false;
    }
  }

  /// 检查是否为桌面平台
  bool _isDesktopPlatform() {
    return Platform.isWindows || Platform.isMacOS || Platform.isLinux;
  }

  /// 检查是否为桌面平台（静态方法）
  static bool isDesktopPlatform() {
    return Platform.isWindows || Platform.isMacOS || Platform.isLinux;
  }
}
