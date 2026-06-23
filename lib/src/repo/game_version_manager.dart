import 'package:shared_preferences/shared_preferences.dart';

/// 全局游戏版本设置(持久化于单个 SharedPreferences 键)。
///
/// 一处设置后,所有 [VersionedListRepo] 默认都用该版本;
/// [version] 为 null 表示「最新/默认」(各 repo 回退到服务端默认或本地最新)。
class GameVersionManager {
  static final GameVersionManager _instance = GameVersionManager._internal();
  GameVersionManager._internal();
  factory GameVersionManager() => _instance;

  static const String _prefKey = 'app.game_version.selected';

  String? _version;

  /// 当前全局版本码;null = 跟随默认/本地最新。
  String? get version => _version;

  /// 应用启动时调用:从持久化读取已选版本。
  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final v = prefs.getString(_prefKey);
    _version = (v != null && v.isNotEmpty) ? v : null;
  }

  /// 设置全局版本(null/空 = 清除,回到默认);持久化。
  Future<void> setVersion(String? code) async {
    _version = (code != null && code.isNotEmpty) ? code : null;
    final prefs = await SharedPreferences.getInstance();
    if (_version == null) {
      await prefs.remove(_prefKey);
    } else {
      await prefs.setString(_prefKey, _version!);
    }
  }
}
