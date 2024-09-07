import 'package:flutter/material.dart';
import 'package:refuge_next/src/datasource/models/buyback.dart';
import 'package:refuge_next/src/datasource/models/upgradeInfo.dart';
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
import 'package:dio/dio.dart';
import '../network/parsers/hangar_parser.dart';
import '../funcs/toast.dart';
import '../funcs/login.dart';
import '../datasource/models/shop/upgrade_ship_info.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_property.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_types.dart';


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

  List<HangarItem> get hangarItems => processSearch(_hangarItems, searchProperty);

  List<HangarItem> get rawHangarItems => _hangarItems;

  List<BuybackItem> _buybackItems = [];

  List<BuybackItem> get buybackItems => _buybackItems;


  List<UpgradeShipInfo> upgradeFromShip = [];
  List<UpgradeShipInfo> upgradeToShip = [];

  UpgradeShipInfo? _fromShip = null;
  Skus? _toSku = null;


  UpgradeShipInfo? get fromShip => _fromShip;
  Skus? get toSku => _toSku;


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

  final hangarRepo = HangarRepo();
  final userRepo = UserRepo();
  final buybackRepo = BuybackRepo();
  final shipUpgradeRepo = ShipUpgradeRepo();
  final catalogRepo = CatalogRepo();

  MainDataModel() {
    initUser();
    readHangarItems();
    readBuybackItems();
    initShipUpgrade();
    readCatalogs();
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

  Future<void> filterShipUpgrade(int? fromId, int? toId) async {
    final response = await shipUpgradeRepo.filterShipUpgrade(fromId, toId);
    upgradeFromShip = response[0];
    upgradeToShip = response[1];
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
      return;
    }
    final user = await userRepo.getUser(handle: handle);
    if (user == null) {
      return;
    }
    _currentUser = user;
    notifyListeners();
  }


  void clearSearch() {
    _searchProperty = null;
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


  void readHangarItems() {
    hangarRepo.readHangarItems().then((value) {
      final filteredItems = filterHangarItemsByType(this, value);
      final stackedItems = stackHangarItems(filteredItems);
      calculateShipPrice(stackedItems).then((shipValue) {
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
      _buybackItems = stackedItems;

    });
  }

  Future<void> _updateBuybackItems() async {
    final items = await buybackRepo.refreshBuybackItems();
    final stackedItems = stackBuybackItems(items);
    _buybackItems = stackedItems;

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
    final filteredItems = filterHangarItemsByType(this, items);
    final stackedItems = stackHangarItems(filteredItems);
    final calculatedItems = await calculateShipPrice(stackedItems);
    final translatedItems = await translateHangarItem(calculatedItems);
    _hangarItems = translatedItems;

    await hangarRepo.writeHangarItems(items);

    notifyListeners();
  }

  void updateSearchProperty(SearchProperty? newProperty) {
    _searchProperty = newProperty;
    notifyListeners();
  }



  Future<void> updateCurrentUser(User newUser) async {

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('vip.kirakira.user.handle', newUser.handle);

    _currentUser = newUser;
    final rsiApiClient = RsiApiClient();
    rsiApiClient.setRSIToken(token: newUser.rsiToken);
    notifyListeners();
  }

}
