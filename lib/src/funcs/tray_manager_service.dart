import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart';

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

  /// 设置托盘图标
  Future<void> _setTrayIcon() async {
    String iconPath;

    if (Platform.isWindows) {
      // Windows优先使用ICO，如果不存在则使用PNG
      iconPath = 'assets/icons/tray_icon.ico';
      // 检查ICO文件是否存在，如果不存在则回退到PNG
      final icoFile = File(iconPath);
      if (!await icoFile.exists()) {
        iconPath = 'assets/icons/rocket.png';
      }
    } else if (Platform.isMacOS) {
      // macOS使用PNG
      iconPath = 'assets/icons/rocket.png';
    } else {
      // Linux使用PNG
      iconPath = 'assets/icons/rocket.png';
    }

    await trayManager.setIcon(iconPath);
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
