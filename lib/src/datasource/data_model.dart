import 'dart:io';

import 'package:flutter/material.dart';
import 'package:refuge_next/src/datasource/models/buyback.dart';
import 'package:refuge_next/src/datasource/models/ship_info/ship.dart';
import 'package:refuge_next/src/datasource/models/upgradeInfo.dart';
import 'package:refuge_next/src/widgets/hangar/ccu_optimizor/utils.dart';
import '../repo/hangar_log.dart';
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

import 'package:refuge_next/src/funcs/initial.dart' show startup;
import 'package:refuge_next/src/funcs/cirno_auth.dart' show CirnoAuth;
import 'package:refuge_next/src/datasource/models/cirno/property.dart' show RefugeVersionProperty;
import 'package:refuge_next/src/funcs/theme.dart' show ThemeManager, FlexSchemeHelper;
import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'models/hangar/hangar_log.dart';
import 'models/game_log.dart';


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


  MainDataModel() {
    initUser();
    initialize();
  }

  Future<void> initialize() async {
    await initUser();
    await loadShowRefreshButtonSetting();
    await loadGameDirectory();
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
