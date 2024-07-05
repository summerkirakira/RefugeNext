import 'package:flutter/material.dart';

class MainDataModel extends ChangeNotifier {
  String _data = "Initial Data";
  int _selectedPage = 0;

  String get data => _data;

  int get selectedPage => _selectedPage;

  void updateData(String newData) {
    _data = newData;
    notifyListeners();
  }

  void updateSelectedPage(int newPage) {
    _selectedPage = newPage;
    notifyListeners();
  }


}
