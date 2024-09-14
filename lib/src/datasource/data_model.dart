import 'package:flutter/material.dart';
import 'package:refuge_next/src/datasource/models/buyback.dart';
import 'package:refuge_next/src/datasource/models/upgradeInfo.dart';
import 'package:refuge_next/src/widgets/hangar/ccu_optimizor/utils.dart';
import './models/hangar.dart';
import './models/user.dart';
import '../repo/hangar.dart';
import '../repo/user.dart';
import '../repo/catalog.dart';
import '../funcs/hangar_utils.dart';
import '../funcs/buyback_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../network/api_service.dart';
import '../funcs/search.dart' show processSearch;
import './models/searchProperty.dart';
import '../repo/buyback.dart';
import '../repo/ship_upgrade.dart';
import '../repo/translation.dart';
import '../repo/ship_alias.dart';
import 'package:dio/dio.dart';
import '../network/parsers/hangar_parser.dart';
import '../funcs/toast.dart';
import '../funcs/login.dart';
import '../datasource/models/shop/upgrade_ship_info.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_property.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_types.dart';

import 'package:refuge_next/src/funcs/initial.dart' show startup;
import 'package:refuge_next/src/funcs/cirno_auth.dart' show CirnoAuth;
import 'package:refuge_next/src/datasource/models/cirno/property.dart' show RefugeVersionProperty;
import 'package:refuge_next/src/funcs/theme.dart' show ThemeManager, FlexSchemeHelper;
import 'package:flex_color_scheme/flex_color_scheme.dart';


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

  List<HangarItem> _hangarItems = [];

  List<List<UpgradeStep>> _upgradeSteps = [];

  List<HangarItem> get hangarItems => processSearch(_hangarItems, searchProperty, _upgradeSteps);

  List<HangarItem> get rawHangarItems => _hangarItems;

  List<BuybackItem> _buybackItems = [];

  List<BuybackItem> get buybackItems => _buybackItems;

  List<UpgradeShipInfo> upgradeFromShip = [];

  List<UpgradeShipInfo> upgradeToShip = [];

  UpgradeShipInfo? _fromShip = null;
  Skus? _toSku = null;


  UpgradeShipInfo? get fromShip => _fromShip;
  Skus? get toSku => _toSku;

  int _upgradeWbNumber = 0;
  int _cartItemNumber = 0;


  int get upgradeWbNumber => _upgradeWbNumber;
  int get cartItemNumber => _cartItemNumber;


  Map<String, List<CatalogProperty>> _catalog = {};

  List<CatalogProperty> getCataLog(CatalogTypes catalogType) {
    if (_catalog[catalogType.value] == null) {
      // refreshCatalog(catalogType).then((value) => readCatalogs());
      return [];
    }
    return _catalog[catalogType.value]!;
  }


  User? _currentUser;

  User? get currentUser => _currentUser;
  bool userInitFinished = false;

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
    await translationRepo.readTranslation();
    await shipAliasRepo.getShipAliases();
    readHangarItems();
    readBuybackItems();
    readCatalogs();
    try {
      await initShipUpgrade();
      await filterShipUpgrade(null, null);
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
      ship.name = translationRepo.getTranslationSync(ship.name!);
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
    calculatedItems.forEach((element) {
      totalPrice += element.price * element.number;
    });

    if (_currentUser != null) {
      if (_currentUser!.hangarValue != totalPrice) {
        _currentUser!.hangarValue = totalPrice;
        await userRepo.addUser(_currentUser!);
      }
    }

    final translatedItems = await translateHangarItem(calculatedItems);
    _hangarItems = translatedItems;
    notifyListeners();
  }

  void updateSearchProperty(SearchProperty? newProperty) {
    _searchProperty = newProperty;
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

}
