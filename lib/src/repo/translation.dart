import '../datasource/models/user.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/cirno/cirno_api.dart';


class TranslationRepo {

  static final TranslationRepo _instance = TranslationRepo._internal();
  TranslationRepo._internal();

  factory TranslationRepo() => _instance;

  Map<String, String> _translation = {};

  List<String> _notTranslated = [];

  int _postedLength = 0;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/translation.json');
  }

  String getFormattedShipName(String shipName) {
    var newShipName = shipName
        .replaceAll("Banu", "")
        .replaceAll("Drake", "")
        .replaceAll("Crusader", "")
        .replaceAll("Argo", "")
        .replaceAll("Esperia", "")
        .replaceAll("Upgrade", "")
        .replaceAll("CNOU", "")
        .replaceAll("AEGIS", "")
        .replaceAll("Mercury Star Runner", "Mercury")
        .replaceAll("ORIGIN 600i Exploration Module", "600i Explorer")
        .replaceAll("ORIGIN 600i Touring Module", "600i Touring")
        .replaceAll("RSI", "")
        .replaceAll("Anvil", "")
        .replaceAll("Retaliator Base", "Retaliator")
        .replaceAll("Mole Carbon Edition", "Mole")
        .replaceAll("Genesis Starliner", "Genesis")
        .replaceAll("Hercules Starship", "")
        .replaceAll("Warbond Subscribers Edition", "Warbond Edition")
        .replaceAll("Subscribers Edition", "Standard Edition")
        .trim();
    return newShipName;
  }


  List<String> getFullUpgradeName(String upgradeTitle) {
    List<String> nameList = [];
    for (String shipName in upgradeTitle
        .replaceAll("Upgrade - ", "")
        .replaceAll(" Upgrade", "")
        .split(" to ")) {
      nameList.add(getFormattedShipName(shipName));
    }
    return nameList;
  }



  Future<Map<String, String>> readTranslation() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      final Map<String, dynamic> json = jsonDecode(contents);
      _translation = json.map((key, value) => MapEntry(key, value.toString()));
      return _translation;
    } catch (e) {
      return {};
    }
  }

  Future<File> writeTranslation(Map<String, String> translation, int version) async {
    final file = await _localFile;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('vip.kirakira.translation.version', version);
    _translation = translation;
    return file.writeAsString(jsonEncode(translation));
  }

  Future<int> getTranslationVersion() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('vip.kirakira.translation.version') ?? 0;
  }

  Future<Map<String, String>> getTranslations() async {
    if (_translation.isNotEmpty) {
      return _translation;
    }
    _translation = await readTranslation();
    return _translation;
  }

  Future<String> getTranslation(String key) async {
    final finalKey = key.replaceAll("\n", "").replaceAll("*", "").replaceAll("‘", "'").replaceAll("’", "'").replaceAll("“", "\"").replaceAll("”", "\"").trim();

    if (_translation[key] == null && _translation.isNotEmpty && !key.contains(" - ") && !key.contains("...") && !key.contains(" to ")) {
      if (!_notTranslated.contains(key) && key.isNotEmpty) {
        _notTranslated.add(key);
        print("Missing translation for $key");
      }
    }

    return _translation[finalKey] ?? finalKey;
  }

  String translateUpgradeName(String upgradeName) {
    String shipName = upgradeName.replaceAll("Standard Edition", "").replaceAll("Warbond Edition", "").trim();
    shipName = _translation[shipName] ?? shipName;
    if (upgradeName.contains("Standard Edition")) {
      return "$shipName 标准版";
    } else if (upgradeName.contains("Warbond Edition")) {
      return "$shipName 战争债券版";
    } else {
      return shipName;
    }
  }

  String getTranslationSync(String key) {

    final finalKey = key.replaceAll("\n", "").replaceAll("*", "").replaceAll("‘", "'").replaceAll("’", "'").replaceAll("“", "\"").replaceAll("”", "\"").trim();
    final keyList = finalKey.split(" - ");
    List<String> translationList = [];
    for (var key in keyList) {
      if (key.contains("Edition") && key.contains(" to ")) {
        final subTranslationList = [];
        final upgradeList = getFullUpgradeName(key);
        for (var upgrade in upgradeList) {
          subTranslationList.add(translateUpgradeName(upgrade));
        }
        translationList.add(subTranslationList.join(" 到 "));
        continue;
      }

      translationList.add(_translation[key] ?? key);
      if (_translation[key] == null && _translation.isNotEmpty && !key.contains(" - ") && !key.contains("...") && !key.contains(" to ")) {
        if (!_notTranslated.contains(key) && key.isNotEmpty) {
          _notTranslated.add(key);
          print("Missing translation for $key");
        }
      }
    }
    return translationList.join(" - ");
  }

  Future<void> postNotTranslated() async {
    if (_notTranslated.isEmpty || _notTranslated.length == _postedLength) {
      return;
    }
    await CirnoApiClient().uploadNotTranslatedTexts(_notTranslated);
  }

}