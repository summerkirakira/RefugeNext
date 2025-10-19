import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class TrayManagerService extends TrayListener {
  static final TrayManagerService _instance = TrayManagerService._internal();

  factory TrayManagerService() {
    return _instance;
  }

  TrayManagerService._internal();

  /// 初始化系统托盘
  Future<void> initialize() async {
    // 只在桌面平台启用
    if (!_isDesktopPlatform()) {
      return;
    }

    // 注册托盘监听器
    trayManager.addListener(this);

    // 设置托盘图标
    await _setTrayIcon();

    // 设置托盘菜单
    await _setTrayMenu();

    // 设置提示文字
    await trayManager.setToolTip('星河避难所');
  }

  /// 从 assets 中提取图标文件到临时目录
  /// 返回提取后的文件路径
  Future<String> _extractIconFromAssets(String assetPath) async {
    try {
      // 获取临时目录
      final tempDir = await getTemporaryDirectory();

      // 从 asset 路径中提取文件名
      final fileName = path.basename(assetPath);

      // 构建临时文件路径
      final filePath = path.join(tempDir.path, fileName);
      final file = File(filePath);

      // 如果文件已存在，直接返回路径
      if (await file.exists()) {
        return filePath;
      }

      // 从 assets 读取文件数据
      final byteData = await rootBundle.load(assetPath);

      // 写入临时目录
      await file.writeAsBytes(
        byteData.buffer.asUint8List(
          byteData.offsetInBytes,
          byteData.lengthInBytes,
        ),
      );

      return filePath;
    } catch (e) {
      if (kDebugMode) {
        print('提取图标文件失败: $e');
      }
      rethrow;
    }
  }

  /// 设置托盘图标
  Future<void> _setTrayIcon() async {
    String assetPath;

    if (Platform.isWindows) {
      // Windows优先使用ICO
      assetPath = 'assets/icons/tray_icon.ico';
    } else if (Platform.isMacOS) {
      // macOS使用PNG
      assetPath = 'assets/icons/rocket.png';
    } else {
      // Linux使用PNG
      assetPath = 'assets/icons/rocket.png';
    }

    try {
      // 从 assets 提取图标到临时目录
      final iconPath = await _extractIconFromAssets(assetPath);
      await trayManager.setIcon(iconPath);
    } catch (e) {
      if (kDebugMode) {
        print('设置托盘图标失败: $e');
      }
      // 如果提取 ICO 失败且在 Windows 上，尝试使用 PNG 作为后备
      if (Platform.isWindows && assetPath.endsWith('.ico')) {
        try {
          final fallbackPath = await _extractIconFromAssets('assets/icons/rocket.png');
          await trayManager.setIcon(fallbackPath);
        } catch (fallbackError) {
          if (kDebugMode) {
            print('设置后备托盘图标也失败: $fallbackError');
          }
        }
      }
    }
  }

  /// 设置托盘菜单
  Future<void> _setTrayMenu() async {
    Menu menu = Menu(
      items: [
        MenuItem(
          key: 'show_window',
          label: '显示窗口',
        ),
        MenuItem.separator(),
        MenuItem(
          key: 'exit',
          label: '退出',
        ),
      ],
    );

    await trayManager.setContextMenu(menu);
  }

  /// 检查是否为桌面平台
  bool _isDesktopPlatform() {
    return Platform.isWindows || Platform.isMacOS || Platform.isLinux;
  }

  @override
  void onTrayIconMouseDown() {
    // 单击托盘图标时显示窗口
    _showWindow();
  }

  @override
  void onTrayIconRightMouseDown() {
    // 右键点击显示菜单（Windows和Linux）
    trayManager.popUpContextMenu();
  }

  @override
  void onTrayMenuItemClick(MenuItem menuItem) {
    switch (menuItem.key) {
      case 'show_window':
        _showWindow();
        break;
      case 'exit':
        _exitApp();
        break;
    }
  }

  /// 显示主窗口
  Future<void> _showWindow() async {
    await windowManager.show();
    await windowManager.focus();
    await windowManager.setSkipTaskbar(false);
  }

  /// 退出应用
  Future<void> _exitApp() async {
    await windowManager.destroy();
  }

  /// 销毁托盘
  Future<void> dispose() async {
    if (!_isDesktopPlatform()) {
      return;
    }

    trayManager.removeListener(this);
    await trayManager.destroy();
  }
}
