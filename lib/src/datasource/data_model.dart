import 'package:flutter/material.dart';
import './models/hangar.dart';
import './models/user.dart';
import '../repo/hangar.dart';
import '../repo/user.dart';
import '../funcs/hangar_utils.dart';


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

  List<HangarItem> _hangarItems = [];

  List<HangarItem> get hangarItems => _hangarItems;

  User? _currentUser;

  String _searchKey = '';

  String get searchKey => _searchKey;

  User? get currentUser => _currentUser;

  final hangarRepo = HangarRepo();



  void updateData(String newData) {
    _data = newData;
    notifyListeners();
  }

  void updateSelectedPage(int newPage) {
    _selectedPage = newPage;
    readHangarItems();
  }

  void updateSelectedHangarItemType(List<HangarItemType> newTypes) {
    _selectedHangarItemType = newTypes;
    // notifyListeners();
  }


  void readHangarItems() {
    hangarRepo.readHangarItems().then((value) {
      final filteredItems = filterHangarItemsByType(this, value);
      _hangarItems = stackHangarItems(filteredItems);
      notifyListeners();
    });
  }

  void updateHangarItems() {

  }

  void updateSearchKey(String newKey) {
    _searchKey = newKey;
  }

  void updateCurrentUser(User newUser) {
    _currentUser = newUser;
    notifyListeners();
  }



}
