import 'package:flutter/material.dart';
import './models/hangar.dart';
import './models/user.dart';
import '../repo/hangar.dart';
import '../repo/user.dart';
import '../funcs/hangar_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../network/api_service.dart';
import '../funcs/search.dart' show processSearch;
import './models/searchProperty.dart';


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

  User? _currentUser;

  User? get currentUser => _currentUser;

  final hangarRepo = HangarRepo();
  final userRepo = UserRepo();

  MainDataModel() {
    initUser();
    readHangarItems();
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

  Future<void> updateHangarItems() async {
    final items = await hangarRepo.refreshHangarItems();
    final filteredItems = filterHangarItemsByType(this, items);
    final stackedItems = stackHangarItems(filteredItems);
    final calculatedItems = await calculateShipPrice(stackedItems);
    final translatedItems = await translateHangarItem(calculatedItems);
    _hangarItems = translatedItems;
    notifyListeners();
  }

  void updateSearchProperty(SearchProperty? newProperty) {
    _searchProperty = newProperty;
    notifyListeners();
  }



  void updateCurrentUser(User newUser) {
    _currentUser = newUser;
    final rsiApiClient = RsiApiClient();
    rsiApiClient.setRSIToken(token: newUser.rsiToken);
    notifyListeners();
  }

}
