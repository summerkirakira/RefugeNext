import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:refuge_next/src/datasource/models/buyback.dart';
import 'package:refuge_next/src/datasource/models/ship_info/ship.dart';
import 'package:refuge_next/src/datasource/models/upgradeInfo.dart';
import 'package:refuge_next/src/widgets/hangar/ccu_optimizor/utils.dart';
import '../repo/hangar_log.dart';
import '../repo/refuge_account.dart';
import '../repo/ship_info.dart';
import './models/hangar.dart';
import './models/user.dart';
import '../repo/hangar.dart';
import '../repo/user.dart';
import '../repo/catalog.dart';
import '../funcs/hangar_utils.dart';
import '../funcs/buyback_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../network/api_service.dart';
import '../funcs/search.dart' show processBuybackSearch, processSearch, processShopSearch;
import './models/searchProperty.dart';
import './models/shop_search_property.dart';
import '../repo/buyback.dart';
import '../repo/ship_upgrade.dart';
import '../repo/translation.dart';
import '../repo/ship_alias.dart';
import '../repo/game_log.dart';
import 'package:dio/dio.dart';
import '../network/parsers/hangar_parser.dart';
import '../funcs/toast.dart';
import '../funcs/login.dart';
import '../funcs/game_log_parser.dart';
import '../services/game_log_service.dart';
import '../datasource/models/shop/upgrade_ship_info.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_property.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_types.dart';
import '../network/cirno/cirno_api.dart';
import '../datasource/models/cirno/account.dart';

import 'package:refuge_next/src/funcs/initial.dart' show startup;
import 'package:refuge_next/src/funcs/cirno_auth.dart' show CirnoAuth;
import 'package:refuge_next/src/datasource/models/cirno/property.dart' show RefugeVersionProperty;
import 'package:refuge_next/src/funcs/theme.dart' show ThemeManager, FlexSchemeHelper;
import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'models/hangar/hangar_log.dart';
import 'models/game_log.dart';
import 'models/game_log_status.dart';


enum HangarItemType {
  all,
  ship,
  paint,
  subscription,
  upgrade,
}

class MainDataModel extends ChangeNotifier {
  String _data = "Initial Data";
  int _selectedPage = 0;

  String get data => _data;

  int get selectedPage => _selectedPage;

  List<HangarItemType> _selectedHangarItemType = [HangarItemType.all];

  List<HangarItemType> get selectedHangarItemType => _selectedHangarItemType;

  SearchProperty? _searchProperty = null;

  bool get isSearched => _searchProperty != null;

  SearchProperty? get searchProperty => _searchProperty;

  ShopSearchProperty? _shopSearchProperty = null;

  bool get isShopSearched => _shopSearchProperty != null;

  ShopSearchProperty? get shopSearchProperty => _shopSearchProperty;

  List<HangarItem> _hangarItems = [];

  List<List<UpgradeStep>> _upgradeSteps = [];

  List<HangarItem> get hangarItems => processSearch(_hangarItems, searchProperty, _upgradeSteps);

  List<HangarItem> get rawHangarItems => _hangarItems;

  List<BuybackItem> _buybackItems = [];

  List<BuybackItem> get buybackItems => processBuybackSearch(_buybackItems, searchProperty);

  List<UpgradeShipInfo> upgradeFromShip = [];

  List<UpgradeShipInfo> upgradeToShip = [];

  List<HangarLog> _hangarLogs = [];

  List<HangarLog> get hangarLogs => _hangarLogs;

  List<HangarLog> getHangarLogByTargetId(int? targetId) {
    if (targetId == null) {
      return _hangarLogs;
    }
    return _hangarLogs.where((element) => element.target == targetId.toString()).toList();
  }

  UpgradeShipInfo? _fromShip = null;
  Skus? _toSku = null;


  UpgradeShipInfo? get fromShip => _fromShip;
  Skus? get toSku => _toSku;

  int _upgradeWbNumber = 0;
  int _cartItemNumber = 0;


  int get upgradeWbNumber => _upgradeWbNumber;
  int get cartItemNumber => _cartItemNumber;

  bool _isDevMode = false;

  bool get isDevMode => _isDevMode;

  void setDevMode(bool isDevMode) {
    _isDevMode = isDevMode;
    notifyListeners();
  }

  bool _showRefreshButton = Platform.isWindows || Platform.isMacOS || Platform.isLinux;

  bool get showRefreshButton => _showRefreshButton;

  Future<void> setShowRefreshButton(bool show) async {
    _showRefreshButton = show;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('app.settings.showRefreshButton', show);
    notifyListeners();
  }

  Future<void> loadShowRefreshButtonSetting() async {
    final prefs = await SharedPreferences.getInstance();
    // 桌面端默认开启，移动端默认关闭
    final defaultValue = Platform.isWindows || Platform.isMacOS || Platform.isLinux;
    _showRefreshButton = prefs.getBool('app.settings.showRefreshButton') ?? defaultValue;
  }

  bool _enableHangarTranslation = true;

  bool get enableHangarTranslation => _enableHangarTranslation;

  Future<void> setEnableHangarTranslation(bool enabled) async {
    _enableHangarTranslation = enabled;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('app.settings.enableHangarTranslation', enabled);
    TranslationRepo().setTranslationEnabled(enabled);
    readHangarItems();
    notifyListeners();
  }

  Future<void> loadEnableHangarTranslationSetting() async {
    final prefs = await SharedPreferences.getInstance();
    _enableHangarTranslation = prefs.getBool('app.settings.enableHangarTranslation') ?? true;
    TranslationRepo().setTranslationEnabled(_enableHangarTranslation);
  }

  bool _enableRealtimeLogSync = false;

  bool get enableRealtimeLogSync => _enableRealtimeLogSync;

  Future<void> setEnableRealtimeLogSync(bool enabled) async {
    print('[RealtimeLogSync] 用户设置实时同步: $enabled');

    // VIP检查：非VIP用户静默关闭功能
    if (enabled && !isVIP) {
      _enableRealtimeLogSync = false;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('app.settings.enableRealtimeLogSync', false);
      notifyListeners();
      return;
    }

    _enableRealtimeLogSync = enabled;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('app.settings.enableRealtimeLogSync', enabled);
    notifyListeners();

    // 根据设置启动或停止监控
    if (enabled) {
      print('[RealtimeLogSync] 开关已开启，正在启动监控...');
      await startRealtimeLogSync();
    } else {
      print('[RealtimeLogSync] 开关已关闭，正在停止监控...');
      await stopRealtimeLogSync();
    }
  }

  Future<void> loadEnableRealtimeLogSyncSetting() async {
    final prefs = await SharedPreferences.getInstance();
    _enableRealtimeLogSync = prefs.getBool('app.settings.enableRealtimeLogSync') ?? false;
    print('[RealtimeLogSync] 加载实时同步设置: $_enableRealtimeLogSync');

    // VIP检查：非VIP用户静默关闭功能
    if (_enableRealtimeLogSync && !isVIP) {
      _enableRealtimeLogSync = false;
      await prefs.setBool('app.settings.enableRealtimeLogSync', false);
      notifyListeners();
      return;
    }

    // 如果实时同步已启用且游戏目录已设置，自动启动监控
    // 注意：需要在 loadGameDirectory() 之后调用此方法
    if (_enableRealtimeLogSync && _gameDirectory != null) {
      print('[RealtimeLogSync] 应用启动时自动启动监控 (游戏目录: $_gameDirectory)');
      await startRealtimeLogSync();
    } else if (_enableRealtimeLogSync && _gameDirectory == null) {
      print('[RealtimeLogSync] ⚠️ 实时同步已启用但游戏目录未设置，无法启动监控');
    }
  }

  // 开机自启动设置
  bool _enableLaunchAtStartup = false;

  bool get enableLaunchAtStartup => _enableLaunchAtStartup;

  Future<void> setEnableLaunchAtStartup(bool enabled) async {
    _enableLaunchAtStartup = enabled;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('app.settings.enableLaunchAtStartup', enabled);
    notifyListeners();
  }

  Future<void> loadEnableLaunchAtStartupSetting() async {
    final prefs = await SharedPreferences.getInstance();
    _enableLaunchAtStartup = prefs.getBool('app.settings.enableLaunchAtStartup') ?? false;
  }

  // 实时日志同步相关状态
  StreamSubscription<FileSystemEvent>? _logFileWatcher;
  DateTime? _lastProcessedTime;
  bool _isProcessingLogChange = false;
  Timer? _debounceTimer;
  Timer? _pollingTimer;  // 轮询定时器
  DateTime? _lastFileModifiedTime;  // 上次文件修改时间

  Map<String, List<CatalogProperty>> _catalog = {};

  List<CatalogProperty> getCataLog(CatalogTypes catalogType) {
    if (_catalog[catalogType.value] == null) {
      // refreshCatalog(catalogType).then((value) => readCatalogs());
      return [];
    }
    return processShopSearch(_catalog[catalogType.value]!, _shopSearchProperty);
  }


  User? _currentUser;

  User? get currentUser => _currentUser;
  bool userInitFinished = false;

  Ship? _currentShipInfo;

  Ship? get currentShipInfo => _currentShipInfo;

  void removeCurrentUser() {
    _currentUser = null;
    notifyListeners();
  }

  void setCurrentShipInfo(Ship? ship) {
    _currentShipInfo = ship;
    notifyListeners();
  }

  ThemeData getTheme(BuildContext context) {
    return ThemeManager.getTheme(context);
  }

  Future<void> setTheme(bool? isDark, FlexScheme scheme) async {
    final themeName = scheme.name;
    await ThemeManager.setTheme(isDark, themeName);
    notifyListeners();
  }

  Future<void> toggleDarkMode() async {
    await ThemeManager.setTheme(!isDarkMode, null);
    notifyListeners();
  }

  bool get isDarkMode => ThemeManager().isDark;


  Future<void> setUpdateStep(List<int> slots) async {
    _upgradeSteps = [];
    for (var slot in slots) {
      final steps = await getStepsFromStorage(slot);
      _upgradeSteps.add(steps);
    }
  }

  // 可上传的日志类型白名单（排除包含 Flow 的类型）
  static const List<String> _uploadableLogTypes = [
    'Game Version',
    // 'InitiateLogin',
    // 'AttachmentReceived',
    // 'Jump Drive State Changed',
    'Vehicle Destruction',
    'Actor Death',
    'EndMission',
    'SystemQuit',
    'CSessionManager::OnClientSpawned',
    'AccountLoginCharacterStatus_Character',
  ];

  final hangarRepo = HangarRepo();
  final userRepo = UserRepo();
  final buybackRepo = BuybackRepo();
  final shipUpgradeRepo = ShipUpgradeRepo();
  final catalogRepo = CatalogRepo();
  final translationRepo = TranslationRepo();
  final shipAliasRepo = ShipAliasRepo();
  final hangarLogRepo = HangarLogRepo();
  final shipInfoRepo = ShipInfoRepo();
  final gameLogRepo = GameLogRepo();


  RefugeVersionProperty? get property => CirnoAuth.instance?.property;

  bool get isVIP {
    if (property == null) {
      return true;
    }
    return property!.isVip;
  }

  /// 刷新VIP订阅状态
  Future<void> refreshVipStatus() async {
    final cirnoAuth = await CirnoAuth.getInstance();
    await cirnoAuth.refreshProperty();
    notifyListeners();

    // 刷新VIP状态后检查实时同步，非VIP静默关闭
    if (!isVIP && _enableRealtimeLogSync) {
      await setEnableRealtimeLogSync(false);
    }
  }


  MainDataModel() {
    initUser();
    initialize();
  }

  Future<void> initialize() async {
    await initUser();
    await loadShowRefreshButtonSetting();
    await loadEnableHangarTranslationSetting();
    await loadGameDirectory();
    await loadEnableRealtimeLogSyncSetting();
    await loadEnableLaunchAtStartupSetting();
    await translationRepo.readTranslation();
    await shipAliasRepo.getShipAliases();
    readHangarItems();
    readBuybackItems();
    readCatalogs();
    try {
      await shipInfoRepo.getShips();
      await initShipUpgrade();
      await filterShipUpgrade(null, null);
      await readHangarLogs();
      await refreshHangarLogs();
    } catch (e) {
      print(e);
    }

  }


  Future<void> initShipUpgrade() async {
    await shipUpgradeRepo.initShipUpgrade();
  }

  Future<void> refreshShipUpgrade() async {
    await shipUpgradeRepo.initShipUpgrade();
  }

  void readCatalogs() {
    catalogRepo.readCatalogs().then((value) => _catalog = value);
    notifyListeners();
  }

  Future<void> refreshCatalog(CatalogTypes catalogType) async {
    await catalogRepo.refreshCatalog(catalogType);
    _catalog = await catalogRepo.readCatalogs();
    notifyListeners();
  }

  List<UpgradeShipInfo> translateShipUpgrade(List<UpgradeShipInfo> ships) {
    return ships.map((ship) {
      ship.chineseName = translationRepo.getTranslationSync(ship.name!);
      return ship;
    }).toList();
  }

  Future<void> filterShipUpgrade(int? fromId, int? toId) async {
    final response = await shipUpgradeRepo.filterShipUpgrade(fromId, toId);
    upgradeFromShip = translateShipUpgrade(response[0]);
    upgradeToShip = translateShipUpgrade(response[1]);

    if (toId == null) {
      int totalWbNumber = 0;
      for (var ship in upgradeToShip) {
        if (ship.skus != null && ship.skus!.length > 1) {
          totalWbNumber += 1;
        }
      }
      if (totalWbNumber != _upgradeWbNumber) {
        _upgradeWbNumber = totalWbNumber;
      }
    }
    notifyListeners();
  }

  void setFromShip(UpgradeShipInfo ship) {
    _fromShip = ship;
    notifyListeners();
  }

  void setToSku(Skus sku) {
    _toSku = sku;
    notifyListeners();
  }


  Future<void> initUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? handle = prefs.getString('vip.kirakira.user.handle');
    if (handle == null) {
      userInitFinished = true;
      notifyListeners();
      return;
    }
    final user = await userRepo.getUser(handle: handle);
    _currentUser = user;
    userInitFinished = true;
    notifyListeners();
  }


  void clearSearch() {
    _searchProperty = null;
    _upgradeSteps = [];
    notifyListeners();
  }

  void updateData(String newData) {
    _data = newData;
    notifyListeners();
  }

  void updateSelectedPage(int newPage) {
    _selectedPage = newPage;
    // readHangarItems();
    notifyListeners();
  }

  void updateSelectedHangarItemType(List<HangarItemType> newTypes) {
    _selectedHangarItemType = newTypes;
    // notifyListeners();
  }

  void updateUpgradeWbNumber(int newNumber) {
    _upgradeWbNumber = newNumber;
    notifyListeners();
  }

  void updateCartItemNumber(int newNumber) {
    _cartItemNumber = newNumber;
    notifyListeners();
  }


  void readHangarItems() {
    hangarRepo.readHangarItems().then((value) {
      final filteredItems = filterHangarItemsByType(this, value);
      final stackedItems = stackHangarItems(filteredItems);
      calculateShipPrice(stackedItems).then((shipValue) {
        int totalPrice = 0;
        int totalCurrentPrice = 0;
        shipValue.forEach((element) {
          totalPrice += element.price * element.number;
          totalCurrentPrice += element.currentPrice * element.number;
        });

        if (_currentUser != null) {
          if (_currentUser!.hangarValue != totalPrice || _currentUser!.currentHangarValue != totalCurrentPrice) {
            _currentUser!.hangarValue = totalPrice;
            _currentUser!.currentHangarValue = totalCurrentPrice;
            notifyListeners();
            userRepo.addUser(_currentUser!);
          }
        }
        translateHangarItem(shipValue).then((value) {
          _hangarItems = value;
          notifyListeners();
        });
      });

    });
  }

  Future<void> readHangarLogs() async {
    _hangarLogs = await hangarLogRepo.readHangarLogs();
    notifyListeners();
  }

  Future<void> refreshHangarLogs() async {
    _hangarLogs = await hangarLogRepo.refreshHangarLogs();
    notifyListeners();
  }

  // Game Log 相关方法
  List<GameLog> _gameLogs = [];
  List<GameLog> get gameLogs => _gameLogs;

  // 游戏日志状态
  GameLogStatus? _gameLogStatus;
  GameLogStatus? get gameLogStatus => _gameLogStatus;

  // 游戏目录相关
  String? _gameDirectory;
  String? get gameDirectory => _gameDirectory;

  Future<void> loadGameDirectory() async {
    final prefs = await SharedPreferences.getInstance();
    _gameDirectory = prefs.getString('app.settings.gameDirectory');
    notifyListeners();
  }

  Future<void> setGameDirectory(String? directory) async {
    _gameDirectory = directory;
    final prefs = await SharedPreferences.getInstance();
    if (directory != null) {
      await prefs.setString('app.settings.gameDirectory', directory);
    } else {
      await prefs.remove('app.settings.gameDirectory');
    }
    notifyListeners();

    // 如果实时同步已开启，重启监控
    if (_enableRealtimeLogSync) {
      await stopRealtimeLogSync();
      if (directory != null) {
        await startRealtimeLogSync();
      }
    }
  }

  // 启动实时日志同步
  Future<void> startRealtimeLogSync() async {
    // 仅Windows平台支持
    if (!Platform.isWindows) {
      print('[RealtimeLogSync] 仅Windows平台支持实时同步');
      return;
    }

    if (_gameDirectory == null) {
      print('[RealtimeLogSync] 游戏目录未设置');
      return;
    }

    print('[RealtimeLogSync] 游戏目录: $_gameDirectory');

    if (!GameLogService.isValidGameDirectory(_gameDirectory!)) {
      print('[RealtimeLogSync] 无效的游戏目录');
      return;
    }

    // 停止现有监控
    await stopRealtimeLogSync();

    try {
      final logPath = GameLogService.getGameLogPath(_gameDirectory!);
      print('[RealtimeLogSync] 日志文件路径: $logPath');

      final logStream = GameLogService.watchLogFile(_gameDirectory!);
      if (logStream == null) {
        print('[RealtimeLogSync] 无法监控日志文件（文件可能不存在）');
        return;
      }

      // 初始化最后处理时间为当前时间
      _lastProcessedTime = DateTime.tryParse("1970-01-01");
      print('[RealtimeLogSync] 初始化起始时间: $_lastProcessedTime');

      // 订阅文件变化事件
      _logFileWatcher = logStream.listen(
        (event) {
          print('[RealtimeLogSync] 收到文件事件: ${event.type}, 路径: ${event.path}');

          // 只处理文件修改事件
          if (event is FileSystemModifyEvent) {
            print('[RealtimeLogSync] 检测到文件修改事件，启动防抖定时器');
            // 使用防抖机制，避免频繁触发
            _debounceTimer?.cancel();
            _debounceTimer = Timer(const Duration(seconds: 2), () {
              print('[RealtimeLogSync] 防抖定时器触发，开始处理日志变化');
              _processLogFileChange();
            });
          } else {
            print('[RealtimeLogSync] 忽略事件类型: ${event.runtimeType}');
          }
        },
        onError: (error) {
          print('[RealtimeLogSync] 监控错误: $error');
        },
        cancelOnError: false,
      );

      print('[RealtimeLogSync] ✅ 已成功启动文件系统事件监控');
    } catch (e) {
      print('[RealtimeLogSync] ❌ 启动文件系统事件监控失败: $e');
    }

    // 启动轮询后备机制（每10秒检查一次文件修改时间）
    try {
      // 初始化文件修改时间
      _lastFileModifiedTime = await GameLogService.getLogFileModifiedTime(_gameDirectory!);
      print('[RealtimeLogSync] 初始文件修改时间: $_lastFileModifiedTime');

      _pollingTimer = Timer.periodic(const Duration(seconds: 10), (timer) async {
        await _checkFileModificationByPolling();
      });
      print('[RealtimeLogSync] ✅ 已启动轮询后备机制（每10秒检查一次）');
    } catch (e) {
      print('[RealtimeLogSync] ❌ 启动轮询机制失败: $e');
    }
  }

  // 轮询检查文件修改（后备机制）
  Future<void> _checkFileModificationByPolling() async {
    if (_gameDirectory == null) {
      return;
    }

    try {
      final modifiedTime = await GameLogService.getLogFileModifiedTime(_gameDirectory!);

      if (modifiedTime == null) {
        print('[RealtimeLogSync] 轮询: 无法获取文件修改时间');
        return;
      }

      print('[RealtimeLogSync] 轮询检查: 当前修改时间 $modifiedTime, 上次 $_lastFileModifiedTime');

      // 如果是第一次检查或者文件时间被重置了，只记录时间
      if (_lastFileModifiedTime == null) {
        _lastFileModifiedTime = modifiedTime;
        print('[RealtimeLogSync] 轮询: 初始化修改时间');
        return;
      }

      // 检查文件是否被修改（时间晚于上次记录）
      if (modifiedTime.isAfter(_lastFileModifiedTime!)) {
        print('[RealtimeLogSync] ✅ 轮询检测到文件修改! 上次: $_lastFileModifiedTime, 现在: $modifiedTime');
        _lastFileModifiedTime = modifiedTime;

        // 触发日志处理（使用防抖避免与文件监听冲突）
        _debounceTimer?.cancel();
        _debounceTimer = Timer(const Duration(seconds: 1), () {
          print('[RealtimeLogSync] 轮询触发日志处理');
          _processLogFileChange();
        });
      }
    } catch (e) {
      print('[RealtimeLogSync] ❌ 轮询检查失败: $e');
    }
  }

  // 停止实时日志同步
  Future<void> stopRealtimeLogSync() async {
    _debounceTimer?.cancel();
    _debounceTimer = null;

    _pollingTimer?.cancel();
    _pollingTimer = null;

    await _logFileWatcher?.cancel();
    _logFileWatcher = null;

    _lastProcessedTime = null;
    _lastFileModifiedTime = null;
    _isProcessingLogChange = false;

    print('[RealtimeLogSync] 已停止实时日志监控（文件事件 + 轮询）');
  }

  // 处理日志文件变化
  Future<void> _processLogFileChange() async {
    print('[RealtimeLogSync] >>> 进入 _processLogFileChange()');

    // 防止并发处理
    if (_isProcessingLogChange) {
      print('[RealtimeLogSync] 已有处理正在进行，跳过');
      return;
    }

    if (_gameDirectory == null || _lastProcessedTime == null) {
      print('[RealtimeLogSync] 游戏目录或起始时间为空，跳过');
      return;
    }

    _isProcessingLogChange = true;
    print('[RealtimeLogSync] 上次处理时间: $_lastProcessedTime');

    try {
      // 读取增量日志
      print('[RealtimeLogSync] 开始读取增量日志...');
      final incrementalLog = await GameLogService.readLogsSince(
        _gameDirectory!,
        _lastProcessedTime!,
      );

      if (incrementalLog == null || incrementalLog.isEmpty) {
        print('[RealtimeLogSync] 未读取到增量内容（可能无新日志或时间戳不匹配）');
        return;
      }

      print('[RealtimeLogSync] 读取到增量内容: ${incrementalLog.length} 字符, ${incrementalLog.split('\n').length} 行');

      // 解析日志
      final logs = GameLogParser.parseLogText(incrementalLog);
      print('[RealtimeLogSync] 解析出日志数量: ${logs.length} 条');

      if (logs.isEmpty) {
        print('[RealtimeLogSync] 解析后没有有效日志');
        return;
      }

      // 保存到数据库
      final result = await gameLogRepo.insertLogs(logs);
      final inserted = result['inserted'] ?? 0;
      final skipped = result['skipped'] ?? 0;
      print('[RealtimeLogSync] 数据库插入结果: 新增 $inserted 条, 跳过 $skipped 条');

      if (inserted > 0) {
        print('[RealtimeLogSync] ✅ 自动导入 $inserted 条新日志');

        // 更新最后处理时间为最新日志的时间
        _lastProcessedTime = logs.last.timestamp;
        print('[RealtimeLogSync] 更新起始时间为: $_lastProcessedTime');

        // 更新UI
        _gameLogs = await gameLogRepo.getRecentLogs(100);
        notifyListeners();

        // 静默上传到服务器（不显示Toast）
        _silentUploadNewLogs();
      }
    } catch (e) {
      print('[RealtimeLogSync] ❌ 处理日志变化失败: $e');
      print('[RealtimeLogSync] 错误堆栈: ${StackTrace.current}');
    } finally {
      _isProcessingLogChange = false;
      print('[RealtimeLogSync] <<< 退出 _processLogFileChange()');
    }
  }

  // 静默上传新日志到服务器
  Future<void> _silentUploadNewLogs() async {
    try {
      // 检查是否登录
      final isLoggedIn = await RefugeAccountRepo().isLoggedIn();
      if (!isLoggedIn) {
        return;
      }

      final cirnoApi = CirnoApiClient();
      final syncInfo = await cirnoApi.getGameLogSyncInfo();

      // 确定需要上传的日志
      List<GameLog> logsToUpload;

      if (syncInfo.latestLogTime != null && syncInfo.latestLogTime!.isNotEmpty) {
        final latestServerTime = DateTime.parse(syncInfo.latestLogTime!);
        logsToUpload = await gameLogRepo.getLogsAfter(afterTime: latestServerTime);
      } else {
        logsToUpload = await gameLogRepo.getAllLogs();
      }

      // 过滤上传类型
      logsToUpload = logsToUpload
          .where((log) => _uploadableLogTypes.contains(log.logType))
          .toList();

      if (logsToUpload.isEmpty) {
        return;
      }

      // 转换为上传格式
      final logsToUploadRequests = logsToUpload.map((log) {
        return GameLogRequest(
          logTime: log.timestamp.toIso8601String(),
          gameAccountName: log.account,
          logType: log.logType,
          content: log.content,
        );
      }).toList();

      // 上传到服务器
      await cirnoApi.addGameLogBatch(logsToUploadRequests);
      print('[RealtimeLogSync] 静默上传 ${logsToUpload.length} 条日志到服务器');
    } catch (e) {
      print('[RealtimeLogSync] 静默上传失败: $e');
    }
  }

  // 从游戏目录导入日志
  Future<bool> importGameLogs() async {
    if (_gameDirectory == null) {
      showToast(message: "请先设置游戏目录");
      return false;
    }

    if (!GameLogService.isValidGameDirectory(_gameDirectory!)) {
      showToast(message: "无效的游戏目录");
      return false;
    }

    final logContent = await GameLogService.readGameLog(_gameDirectory!);
    if (logContent == null || logContent.isEmpty) {
      showToast(message: "未找到游戏日志文件");
      return false;
    }

    await parseAndSaveGameLogs(logContent);
    showToast(message: "游戏日志导入成功");
    return true;
  }

  // 导入最近的N行日志
  Future<bool> importRecentGameLogs(int lines) async {
    if (_gameDirectory == null) {
      showToast(message: "请先设置游戏目录");
      return false;
    }

    if (!GameLogService.isValidGameDirectory(_gameDirectory!)) {
      showToast(message: "无效的游戏目录");
      return false;
    }

    final logContent = await GameLogService.readLastNLines(_gameDirectory!, lines);
    if (logContent == null || logContent.isEmpty) {
      showToast(message: "未找到游戏日志");
      return false;
    }

    await parseAndSaveGameLogs(logContent);
    showToast(message: "导入了最近 $lines 行日志");
    return true;
  }

  // 从文本解析并保存游戏日志
  Future<void> parseAndSaveGameLogs(String logText) async {
    final logs = GameLogParser.parseLogText(logText);
    if (logs.isNotEmpty) {
      final result = await gameLogRepo.insertLogs(logs);
      final inserted = result['inserted'] ?? 0;
      final skipped = result['skipped'] ?? 0;

      if (skipped > 0) {
        showToast(message: "成功导入 $inserted 条新日志，跳过 $skipped 条重复");
      } else {
        showToast(message: "成功导入 $inserted 条日志");
      }

      _gameLogs = await gameLogRepo.getRecentLogs(100); // 获取最近100条日志
      notifyListeners();
    }
  }

  // 获取最近的游戏日志
  Future<void> loadRecentGameLogs([int count = 100]) async {
    _gameLogs = await gameLogRepo.getRecentLogs(count);
    notifyListeners();
  }

  // 刷新游戏日志状态
  Future<void> refreshGameLogStatus() async {
    final latestTime = await gameLogRepo.getLatestLogTime();
    final missionCount = await gameLogRepo.getMissionCompletedCount();
    final gamePlayTime = await gameLogRepo.getGamePlayTimeInTwoWeeks();

    // 获取当前用户的击杀数和被杀数
    int killCount = 0;
    int deathCount = 0;
    if (_currentUser != null) {
      killCount = await gameLogRepo.getPlayerKillCount(_currentUser!.handle);
      deathCount = await gameLogRepo.getPlayerDeathCount(_currentUser!.handle);
    }

    _gameLogStatus = GameLogStatus(
      latestGameTime: latestTime,
      lastRefreshTime: DateTime.now(),
      missionCompletedCount: missionCount,
      playerKillCount: killCount,
      playerDeathCount: deathCount,
      gamePlayTimeMinutes: gamePlayTime,
    );
    notifyListeners();
  }

  // 根据时间范围获取游戏日志
  Future<void> loadGameLogsByTimeRange(DateTime startTime, DateTime endTime) async {
    _gameLogs = await gameLogRepo.getLogsByTimeRange(
      startTime: startTime,
      endTime: endTime,
    );
    notifyListeners();
  }

  // 根据玩家ID获取游戏日志
  Future<void> loadGameLogsByPlayer(String playerId) async {
    _gameLogs = await gameLogRepo.getLogsByPlayerId(playerId: playerId);
    notifyListeners();
  }

  // 根据类型获取游戏日志
  Future<void> loadGameLogsByType(String logType, {String? subType}) async {
    _gameLogs = await gameLogRepo.getLogsByType(
      logType: logType,
      subType: subType,
    );
    notifyListeners();
  }

  // 搜索游戏日志
  Future<void> searchGameLogs(String keyword) async {
    _gameLogs = await gameLogRepo.searchLogs(keyword: keyword);
    notifyListeners();
  }

  // 获取日志统计信息
  Future<Map<String, dynamic>> getGameLogStatistics({
    DateTime? startTime,
    DateTime? endTime,
  }) async {
    return await gameLogRepo.getStatistics(
      startTime: startTime,
      endTime: endTime,
    );
  }

  // 清理旧的游戏日志
  Future<int> clearOldGameLogs(DateTime beforeDate) async {
    final deletedCount = await gameLogRepo.clearOldLogs(beforeDate);
    await loadRecentGameLogs(); // 重新加载日志
    return deletedCount;
  }

  // 导出游戏日志
  Future<String> exportGameLogs({
    DateTime? startTime,
    DateTime? endTime,
  }) async {
    return await gameLogRepo.exportLogsToJson(
      startTime: startTime,
      endTime: endTime,
    );
  }

  // 清理重复日志
  Future<int> removeDuplicateGameLogs() async {
    final deletedCount = await gameLogRepo.removeDuplicates();
    if (deletedCount > 0) {
      await loadRecentGameLogs(); // 重新加载日志
    }
    return deletedCount;
  }

  // 获取重复日志数量
  Future<int> getDuplicateLogCount() async {
    return await gameLogRepo.getDuplicateCount();
  }

  // 清空所有游戏日志和处理记录
  Future<int> clearAllGameLogs() async {
    // 清空日志数据库
    final deletedCount = await gameLogRepo.clearAllLogs();
    // 清空已处理文件记录
    await gameLogRepo.clearProcessedFiles();
    // 重新加载日志（此时应该为空）
    await loadRecentGameLogs();
    return deletedCount;
  }

  // 导入历史日志
  Future<Map<String, int>> importHistoricalGameLogs() async {
    if (_gameDirectory == null) {
      showToast(message: "请先设置游戏目录");
      return {'files': 0, 'inserted': 0, 'skipped': 0};
    }

    if (!GameLogService.isValidGameDirectory(_gameDirectory!)) {
      showToast(message: "无效的游戏目录");
      return {'files': 0, 'inserted': 0, 'skipped': 0};
    }

    showToast(message: "正在扫描历史日志...");

    int totalInserted = 0;
    int totalSkipped = 0;
    int filesProcessed = 0;

    try {
      final historicalLogs = await GameLogService.batchReadHistoricalLogs(
        _gameDirectory!,
        onProgress: (current, total, fileName) {
          // 可以在这里更新UI显示进度
          print('Processing $current/$total: $fileName');
        },
      );

      if (historicalLogs.isEmpty) {
        showToast(message: "未找到历史日志文件");
        return {'files': 0, 'inserted': 0, 'skipped': 0};
      }

      showToast(message: "找到 ${historicalLogs.length} 个历史日志文件，开始导入...");

      // 批量导入每个文件的日志
      for (final logData in historicalLogs) {
        final content = logData['content'] as String;
        final logs = GameLogParser.parseLogText(content);

        if (logs.isNotEmpty) {
          final result = await gameLogRepo.insertLogs(logs);
          totalInserted += (result['inserted'] ?? 0);
          totalSkipped += (result['skipped'] ?? 0);
          filesProcessed++;
        }
      }

      // 重新加载日志
      await loadRecentGameLogs(100);

      return {
        'files': filesProcessed,
        'inserted': totalInserted,
        'skipped': totalSkipped,
      };
    } catch (e) {
      print('Error importing historical logs: $e');
      showToast(message: "导入历史日志时出错: $e");
      return {
        'files': filesProcessed,
        'inserted': totalInserted,
        'skipped': totalSkipped,
      };
    }
  }

  // 导入所有游戏日志（当前日志 + 未处理的历史日志）
  Future<Map<String, int>> importAllGameLogs() async {
    // 非Windows平台静默跳过（游戏只在Windows上运行）
    if (!Platform.isWindows) {
      return {
        'current_inserted': 0,
        'current_skipped': 0,
        'historical_files': 0,
        'historical_inserted': 0,
        'historical_skipped': 0,
        'skipped_processed_files': 0,
      };
    }

    if (_gameDirectory == null) {
      showToast(message: "请先设置游戏目录");
      return {
        'current_inserted': 0,
        'current_skipped': 0,
        'historical_files': 0,
        'historical_inserted': 0,
        'historical_skipped': 0,
        'skipped_processed_files': 0,
      };
    }

    if (!GameLogService.isValidGameDirectory(_gameDirectory!)) {
      showToast(message: "无效的游戏目录");
      return {
        'current_inserted': 0,
        'current_skipped': 0,
        'historical_files': 0,
        'historical_inserted': 0,
        'historical_skipped': 0,
        'skipped_processed_files': 0,
      };
    }

    showToast(message: "开始导入游戏日志...");

    int currentInserted = 0;
    int currentSkipped = 0;
    int historicalFilesProcessed = 0;
    int historicalInserted = 0;
    int historicalSkipped = 0;
    int skippedProcessedFiles = 0;

    try {
      // 第一步：导入当前 Game.log 的全部内容
      showToast(message: "正在读取当前游戏日志...");
      final currentLogContent = await GameLogService.readFullGameLog(_gameDirectory!);

      if (currentLogContent != null && currentLogContent.isNotEmpty) {
        final currentLogs = GameLogParser.parseLogText(currentLogContent);
        if (currentLogs.isNotEmpty) {
          final currentResult = await gameLogRepo.insertLogs(currentLogs);
          currentInserted = currentResult['inserted'] ?? 0;
          currentSkipped = currentResult['skipped'] ?? 0;
          print('Current log: inserted=$currentInserted, skipped=$currentSkipped');
        }
      }

      // 第二步：扫描并导入历史日志
      showToast(message: "正在扫描历史日志...");
      final historicalLogs = await GameLogService.batchReadHistoricalLogs(
        _gameDirectory!,
        onProgress: (current, total, fileName) {
          print('Scanning $current/$total: $fileName');
        },
      );

      if (historicalLogs.isNotEmpty) {
        showToast(message: "找到 ${historicalLogs.length} 个历史日志文件，正在检查处理状态...");

        for (final logData in historicalLogs) {
          final fileName = logData['file_name'] as String;

          // 检查是否已处理过
          final isProcessed = await gameLogRepo.isFileProcessed(fileName);
          if (isProcessed) {
            skippedProcessedFiles++;
            print('Skipping already processed file: $fileName');
            continue;
          }

          // 处理未处理的历史文件
          print('Processing new historical file: $fileName');
          final content = logData['content'] as String;
          final logs = GameLogParser.parseLogText(content);

          if (logs.isNotEmpty) {
            final result = await gameLogRepo.insertLogs(logs);
            historicalInserted += (result['inserted'] ?? 0);
            historicalSkipped += (result['skipped'] ?? 0);
            historicalFilesProcessed++;

            // 立即标记为已处理
            await gameLogRepo.markFileAsProcessed(fileName);
            print('Marked as processed: $fileName');
          }
        }
      }

      // 重新加载日志
      await loadRecentGameLogs(100);

      final totalNewLogs = currentInserted + historicalInserted;
      final message = "导入完成！\n"
          "当前日志: 新增 $currentInserted 条\n"
          "历史日志: 处理 $historicalFilesProcessed 个文件，新增 $historicalInserted 条\n"
          "已跳过 $skippedProcessedFiles 个已处理的历史文件";

      showToast(message: message);

      return {
        'current_inserted': currentInserted,
        'current_skipped': currentSkipped,
        'historical_files': historicalFilesProcessed,
        'historical_inserted': historicalInserted,
        'historical_skipped': historicalSkipped,
        'skipped_processed_files': skippedProcessedFiles,
      };
    } catch (e) {
      print('Error importing all game logs: $e');
      showToast(message: "导入日志时出错: $e");
      return {
        'current_inserted': currentInserted,
        'current_skipped': currentSkipped,
        'historical_files': historicalFilesProcessed,
        'historical_inserted': historicalInserted,
        'historical_skipped': historicalSkipped,
        'skipped_processed_files': skippedProcessedFiles,
      };
    }
  }

  // 获取历史日志文件数量
  Future<int> getHistoricalLogCount() async {
    if (_gameDirectory == null) return 0;
    if (!GameLogService.isValidGameDirectory(_gameDirectory!)) return 0;

    try {
      final files = await GameLogService.scanHistoricalLogs(_gameDirectory!);
      return files.length;
    } catch (e) {
      return 0;
    }
  }

  // 分页查询游戏日志（用于日志查看器）
  Future<List<GameLog>> queryGameLogsWithPagination({
    String? searchKeyword,
    String? logType,
    String? subType,
    String? playerId,
    DateTime? startTime,
    DateTime? endTime,
    String? result,
    int limit = 20,
    int offset = 0,
  }) async {
    // 统一使用 queryLogs 方法，支持搜索关键字和所有filter同时生效
    return await gameLogRepo.queryLogs(
      keyword: searchKeyword,
      logType: logType,
      subType: subType,
      playerId: playerId,
      startTime: startTime,
      endTime: endTime,
      result: result,
      limit: limit,
      offset: offset,
    );
  }

  // 获取日志总数（用于判断是否还有更多日志）
  Future<int> getGameLogCount() async {
    return await gameLogRepo.getLogCount();
  }

  // 上传游戏日志到服务器
  Future<Map<String, dynamic>> uploadGameLogsToServer() async {
    try {
      // 第一步：刷新本地日志
      showToast(message: "正在刷新本地日志...");
      final importResult = await importAllGameLogs();

      // 第二步：获取服务器同步信息
      showToast(message: "正在获取服务器同步信息...");
      final cirnoApi = CirnoApiClient();
      final syncInfo = await cirnoApi.getGameLogSyncInfo();

      // 第三步：确定需要上传的日志
      List<GameLog> logsToUpload;

      if (syncInfo.latestLogTime != null && syncInfo.latestLogTime!.isNotEmpty) {
        // 如果服务器有日志，只上传服务器最新时间之后的日志
        final latestServerTime = DateTime.parse(syncInfo.latestLogTime!);
        showToast(message: "查询 ${latestServerTime.toLocal()} 之后的日志...");
        logsToUpload = await gameLogRepo.getLogsAfter(afterTime: latestServerTime);
      } else {
        // 如果服务器没有日志，上传所有本地日志
        showToast(message: "服务器无日志记录，准备上传所有本地日志...");
        logsToUpload = await gameLogRepo.getAllLogs();
      }

      // 过滤掉不需要上传的日志类型（排除 Flow 类型）
      final totalLogsBeforeFilter = logsToUpload.length;
      logsToUpload = logsToUpload
          .where((log) => _uploadableLogTypes.contains(log.logType))
          .toList();

      final filteredCount = totalLogsBeforeFilter - logsToUpload.length;
      if (filteredCount > 0) {
        showToast(message: "已过滤 $filteredCount 条 Flow 类型日志");
      }

      if (logsToUpload.isEmpty) {
        showToast(message: "过滤后没有需要上传的日志");
        return {
          'success': true,
          'uploaded': 0,
          'duplicated': 0,
          'server_total': syncInfo.totalLogs,
          'filtered': filteredCount,
        };
      }

      // 第四步：转换为上传格式
      final logsToUploadRequests = logsToUpload.map((log) {
        return GameLogRequest(
          logTime: log.timestamp.toIso8601String(),
          gameAccountName: log.account,
          logType: log.logType,
          content: log.content,
        );
      }).toList();

      // 第五步：批量上传
      showToast(message: "正在上传 ${logsToUploadRequests.length} 条日志...");
      final uploadResult = await cirnoApi.addGameLogBatch(logsToUploadRequests);

      final message = "上传完成！\n"
          "新增: ${uploadResult.inserted} 条\n"
          "重复: ${uploadResult.duplicated} 条\n"
          "${filteredCount > 0 ? '已过滤: $filteredCount 条 Flow 日志\n' : ''}"
          "服务器总计: ${syncInfo.totalLogs + uploadResult.inserted} 条";

      showToast(message: message);

      return {
        'success': true,
        'uploaded': uploadResult.inserted,
        'duplicated': uploadResult.duplicated,
        'filtered': filteredCount,
        'server_total': syncInfo.totalLogs + uploadResult.inserted,
        'local_total': await gameLogRepo.getLogCount(),
      };
    } catch (e) {
      print('Error uploading game logs: $e');
      showToast(message: "上传游戏日志时出错: $e");
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  // 从服务器下载游戏日志
  Future<Map<String, dynamic>> downloadGameLogsFromServer() async {
    try {
      final cirnoApi = CirnoApiClient();

      // 第一步：获取本地最新日志时间
      showToast(message: "正在检查本地日志...");
      final localLatestTime = await gameLogRepo.getLatestLogTime();

      // 第二步：获取服务器同步信息
      showToast(message: "正在获取服务器同步信息...");
      final syncInfo = await cirnoApi.getGameLogSyncInfo();

      if (syncInfo.latestLogTime == null || syncInfo.latestLogTime!.isEmpty) {
        showToast(message: "服务器暂无日志数据");
        return {
          'success': true,
          'downloaded': 0,
          'inserted': 0,
          'server_total': 0,
        };
      }

      final serverLatestTime = DateTime.parse(syncInfo.latestLogTime!);

      // 第三步：比较时间，判断是否需要同步
      if (localLatestTime != null && !serverLatestTime.isAfter(localLatestTime)) {
        showToast(message: "本地日志已是最新");
        return {
          'success': true,
          'downloaded': 0,
          'inserted': 0,
          'server_total': syncInfo.totalLogs,
          'local_total': await gameLogRepo.getLogCount(),
        };
      }

      // 第四步：分页查询服务器日志
      showToast(message: "正在从服务器拉取日志...");
      final List<GameLog> downloadedLogs = [];
      int page = 0;
      const int perPage = 2000; // 每页2000条
      bool hasMore = true;

      while (hasMore) {
        final queryResult = await cirnoApi.queryGameLogs(
          startTime: localLatestTime?.toIso8601String(),
          page: page,
          perPage: perPage,
        );

        // 解析服务器响应
        final logs = queryResult['logs'] as List<dynamic>? ?? [];

        if (logs.isEmpty) {
          hasMore = false;
          break;
        }

        // 转换为 GameLog 对象
        for (final logData in logs) {
          try {
            final gameLog = GameLog.fromServerResponse(logData as Map<String, dynamic>);
            downloadedLogs.add(gameLog);
          } catch (e) {
            print('Error parsing log from server: $e');
            // 继续处理其他日志
          }
        }

        // 检查是否还有更多数据
        final total = queryResult['total'] as int? ?? 0;
        final currentCount = (page + 1) * perPage;
        hasMore = currentCount < total;
        page++;

        // 显示进度
        if (hasMore) {
          showToast(message: "已拉取 ${downloadedLogs.length} 条，继续...");
        }
      }

      if (downloadedLogs.isEmpty) {
        showToast(message: "服务器没有新日志");
        return {
          'success': true,
          'downloaded': 0,
          'inserted': 0,
          'server_total': syncInfo.totalLogs,
          'local_total': await gameLogRepo.getLogCount(),
        };
      }

      // 第五步：插入到本地数据库
      showToast(message: "正在保存 ${downloadedLogs.length} 条日志到本地...");
      final insertResult = await gameLogRepo.insertLogs(downloadedLogs);
      final inserted = insertResult['inserted'] ?? 0;
      final skipped = insertResult['skipped'] ?? 0;

      // 重新加载日志
      await loadRecentGameLogs(100);

      final message = "下载完成！\n"
          "从服务器拉取: ${downloadedLogs.length} 条\n"
          "新增: $inserted 条\n"
          "重复: $skipped 条\n"
          "本地总计: ${await gameLogRepo.getLogCount()} 条";

      showToast(message: message);

      return {
        'success': true,
        'downloaded': downloadedLogs.length,
        'inserted': inserted,
        'skipped': skipped,
        'server_total': syncInfo.totalLogs,
        'local_total': await gameLogRepo.getLogCount(),
      };
    } catch (e) {
      print('Error downloading game logs: $e');
      showToast(message: "下载游戏日志时出错: $e");
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  // 智能同步游戏日志（双向同步）
  Future<Map<String, dynamic>> syncGameLogsWithServer() async {
    try {
      final cirnoApi = CirnoApiClient();

      showToast(message: "开始同步日志...");

      // 第一步：获取本地和服务器的同步信息
      final localLatestTime = await gameLogRepo.getLatestLogTime();
      final syncInfo = await cirnoApi.getGameLogSyncInfo();

      int totalDownloaded = 0;
      int totalUploaded = 0;
      int downloadedInserted = 0;
      int uploadedInserted = 0;

      // 第二步：判断是否需要从服务器下载
      bool needDownload = false;
      if (syncInfo.latestLogTime != null && syncInfo.latestLogTime!.isNotEmpty) {
        final serverLatestTime = DateTime.parse(syncInfo.latestLogTime!);
        if (localLatestTime == null || serverLatestTime.isAfter(localLatestTime)) {
          needDownload = true;
        }
      }

      // 第三步：如果需要，先下载服务器的新日志
      if (needDownload) {
        showToast(message: "正在从服务器下载新日志...");
        final downloadResult = await downloadGameLogsFromServer();

        if (downloadResult['success'] == true) {
          totalDownloaded = downloadResult['downloaded'] ?? 0;
          downloadedInserted = downloadResult['inserted'] ?? 0;
        }
      }

      // 第四步：刷新本地日志（导入游戏目录中的最新日志）
      showToast(message: "正在刷新本地日志...");
      await importAllGameLogs();

      // 第五步：重新获取本地最新时间和服务器同步信息
      final updatedLocalLatestTime = await gameLogRepo.getLatestLogTime();
      final updatedSyncInfo = await cirnoApi.getGameLogSyncInfo();

      // 第六步：判断是否需要上传到服务器
      bool needUpload = false;
      if (updatedLocalLatestTime != null) {
        if (updatedSyncInfo.latestLogTime == null || updatedSyncInfo.latestLogTime!.isEmpty) {
          // 服务器没有日志，需要上传
          needUpload = true;
        } else {
          final serverLatestTime = DateTime.parse(updatedSyncInfo.latestLogTime!);
          if (updatedLocalLatestTime.isAfter(serverLatestTime)) {
            // 本地有更新的日志，需要上传
            needUpload = true;
          }
        }
      }

      // 第七步：如果需要，上传本地新日志到服务器
      if (needUpload) {
        showToast(message: "正在上传本地新日志到服务器...");

        // 获取需要上传的日志
        List<GameLog> logsToUpload;
        if (updatedSyncInfo.latestLogTime != null && updatedSyncInfo.latestLogTime!.isNotEmpty) {
          final serverLatestTime = DateTime.parse(updatedSyncInfo.latestLogTime!);
          logsToUpload = await gameLogRepo.getLogsAfter(afterTime: serverLatestTime);
        } else {
          logsToUpload = await gameLogRepo.getAllLogs();
        }

        // 过滤日志类型
        final beforeFilter = logsToUpload.length;
        logsToUpload = logsToUpload
            .where((log) => _uploadableLogTypes.contains(log.logType))
            .toList();
        final filtered = beforeFilter - logsToUpload.length;

        if (logsToUpload.isNotEmpty) {
          // 转换为上传格式
          final logsToUploadRequests = logsToUpload.map((log) {
            return GameLogRequest(
              logTime: log.timestamp.toIso8601String(),
              gameAccountName: log.account,
              logType: log.logType,
              content: log.content,
            );
          }).toList();

          // 批量上传
          final uploadResult = await cirnoApi.addGameLogBatch(logsToUploadRequests);
          totalUploaded = logsToUpload.length;
          uploadedInserted = uploadResult.inserted;
        }
      }

      // 第八步：显示同步结果
      final localTotal = await gameLogRepo.getLogCount();

      String resultMessage = "同步完成！\n";
      if (totalDownloaded > 0) {
        resultMessage += "从服务器下载: $totalDownloaded 条 (新增: $downloadedInserted)\n";
      }
      if (totalUploaded > 0) {
        resultMessage += "上传到服务器: $totalUploaded 条 (新增: $uploadedInserted)\n";
      }
      if (totalDownloaded == 0 && totalUploaded == 0) {
        resultMessage += "日志已是最新状态\n";
      }
      resultMessage += "本地总计: $localTotal 条";

      showToast(message: resultMessage);

      return {
        'success': true,
        'downloaded': totalDownloaded,
        'downloaded_inserted': downloadedInserted,
        'uploaded': totalUploaded,
        'uploaded_inserted': uploadedInserted,
        'local_total': localTotal,
        'server_total': updatedSyncInfo.totalLogs + uploadedInserted,
      };
    } catch (e) {
      print('Error syncing game logs: $e');
      showToast(message: "同步游戏日志时出错: $e");
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  HangarItem? getHangarItemById(int id) {
    for (var item in _hangarItems) {
      if (item.id == id || item.idList.contains(id)) {
        return item;
      }
    }
    return null;
  }

  void readBuybackItems() {
    buybackRepo.readBuybackItems().then((value) {
      final stackedItems = stackBuybackItems(value);
      calculateBuybackPrice(stackedItems).then((buybackValue) {
        _buybackItems = buybackValue;
        notifyListeners();
      });
    });
  }

  Future<void> _updateBuybackItems() async {
    final items = await buybackRepo.refreshBuybackItems();
    final stackedItems = stackBuybackItems(items);
    _buybackItems =  await calculateBuybackPrice(stackedItems);

    await buybackRepo.writeBuybackItems(items);

    notifyListeners();
  }

  Future<bool> reLogin() async {
    if (_currentUser == null) {
      return false;
    }
    final result = await loginFirstStep(email: _currentUser!.email, password: _currentUser!.password);
    if (result.success) {
      final user = await userRepo.getCurrentUser();
      if (user != null) {
        await updateCurrentUser(user);
        return true;
      }
    }
    return false;
  }


  Future<void> updateHangarItems() async {
    try {
      final cirnoAuth = await CirnoAuth.getInstance();
      if (!cirnoAuth.isInitialized) {
        await startup();
        await initShipUpgrade();
        await filterShipUpgrade(null, null);
      }
      await _updateHangarItems();
    } on ParserError catch (e) {
      showAlert(message: "登录失效, 正在重新登陆");
      final result = await reLogin();
      if (result) {
        showToast(message: "重新登录成功");
        _updateHangarItems();
      } else {
        showToast(message: "自动登录失败, 请手动登录");
      }
      return;
    } on DioException catch (e) {
      showAlert(message: "网络错误: ${e.message}");
      return;
    }
  }

  Future<void> updateBuybackItems() async {
    try {
      await _updateBuybackItems();
    } on ParserError catch (e) {
      showAlert(message: "登录失效, 正在重新登陆");
      final result = await reLogin();
      if (result) {
        showToast(message: "重新登录成功");
        _updateBuybackItems();
      } else {
        showToast(message: "自动登录失败, 请手动登录");
      }
      return;
    } on DioException catch (e) {
      showAlert(message: "网络错误: ${e.message}");
      return;
    }
  }


  Future<void> _updateHangarItems() async {
    List<HangarItem> items = [];
    items = await hangarRepo.refreshHangarItems();
    await hangarRepo.writeHangarItems(items);


    final filteredItems = filterHangarItemsByType(this, items);
    final stackedItems = stackHangarItems(filteredItems);
    final calculatedItems = await calculateShipPrice(stackedItems);

    int totalPrice = 0;
    int totalCurrentPrice = 0;
    calculatedItems.forEach((element) {
      totalPrice += element.price * element.number;
      totalCurrentPrice += element.currentPrice * element.number;
    });

    if (_currentUser != null) {
      if (_currentUser!.hangarValue != totalPrice || _currentUser!.currentHangarValue != totalCurrentPrice) {
        _currentUser!.hangarValue = totalPrice;
        _currentUser!.currentHangarValue = totalCurrentPrice;
        await userRepo.addUser(_currentUser!);
      }
    }

    final translatedItems = await translateHangarItem(calculatedItems);
    _hangarItems = translatedItems;
    notifyListeners();
    try {
      translationRepo.postNotTranslated();
    } catch (e) {
      print(e);
    }

  }

  void updateSearchProperty(SearchProperty? newProperty) {
    _searchProperty = newProperty;
    notifyListeners();
  }

  void updateShopSearchProperty(ShopSearchProperty? newProperty) {
    _shopSearchProperty = newProperty;
    notifyListeners();
  }

  void clearShopSearch() {
    _shopSearchProperty = null;
    notifyListeners();
  }



  Future<void> updateCurrentUser(User newUser) async {
    final rsiApiClient = RsiApiClient();
    final prefs = await SharedPreferences.getInstance();
    rsiApiClient.setRSIToken(token: newUser.rsiToken);
    prefs.setString('vip.kirakira.user.handle', newUser.handle);

    _currentUser = newUser;

    rsiApiClient.setRSIToken(token: newUser.rsiToken);
    await rsiApiClient.refreshCsrfToken();
    notifyListeners();
  }

  int _activePageIndex = 0;

  // 0: 机库
  // 1: 回购
  // 2: 商店-舰船
  // 3: 商店-涂装
  // 4: 商店-升级


  int get activePageIndex => _activePageIndex;

  void updateActivePageIndex(int index) {
    if (_activePageIndex != index) {
      _activePageIndex = index;
      notifyListeners();
    }
  }

}
