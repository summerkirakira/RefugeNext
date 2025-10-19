import '../datasource/models/user.dart';
import 'dart:io';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/cirno/cirno_api.dart';
import '../utils/storage_path.dart';


class TranslationRepo {

  static final TranslationRepo _instance = TranslationRepo._internal();
  TranslationRepo._internal();

  factory TranslationRepo() => _instance;

  Map<String, String> _translation = {};

  List<String> _notTranslated = [];

  int _postedLength = 0;

  bool _translationEnabled = true;

  // 游戏内载具特殊标记翻译映射表
  static const Map<String, String> _inGameVehicleTagTranslations = {
    'PU': 'PU',
    'AI': 'AI',
    'CRIM': '罪犯',
  };

  bool get translationEnabled => _translationEnabled;

  void setTranslationEnabled(bool enabled) {
    _translationEnabled = enabled;
  }

  Future<String> get _localPath async {
    return await StoragePath.getAppDataPath();
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
    if (!_translationEnabled) {
      return key;
    }

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
    if (!_translationEnabled) {
      return key;
    }

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

  /// 翻译游戏内部载具名称
  ///
  /// 将游戏内载具名称格式（如：AEGS_Gladius_PU_AI_CRIM_6621815970438）
  /// 翻译为易读的中文格式（如：短剑[PU][罪犯][AI]）
  ///
  /// 处理流程：
  /// 1. 移除尾部数字（如 _6621815970438）
  /// 2. 移除头部厂商名（第一个_之前的部分）
  /// 3. 识别并提取特殊标记（PU, AI, CRIM等）
  /// 4. 主体名称下划线转空格后进行翻译
  /// 5. 组合为：主体名称[标记1][标记2]...
  String translateInGameVehicleName(String vehicleName) {
    if (!_translationEnabled) {
      return vehicleName;
    }

    if (vehicleName.isEmpty) {
      return vehicleName;
    }

    // 步骤1: 移除尾部数字（格式：_数字）
    String processed = vehicleName.replaceAll(RegExp(r'_\d+$'), '');

    // 步骤2: 移除头部厂商名（第一个_之前的部分）
    final firstUnderscoreIndex = processed.indexOf('_');
    if (firstUnderscoreIndex != -1) {
      processed = processed.substring(firstUnderscoreIndex + 1);
    }

    // 步骤3: 按下划线分割
    final parts = processed.split('_');
    if (parts.isEmpty) {
      return vehicleName;
    }

    // 步骤4: 识别主体名称和特殊标记
    final List<String> vehicleNameParts = [];
    final List<String> tags = [];

    bool foundFirstNonTag = false;
    for (final part in parts) {
      if (part.isEmpty) continue;

      // 检查是否是特殊标记
      if (_inGameVehicleTagTranslations.containsKey(part)) {
        if (!foundFirstNonTag) {
          // 如果还没找到主体名称，先暂存标记
          tags.add(part);
        } else {
          // 找到主体名称后，所有标记都添加到标记列表
          tags.add(part);
        }
      } else {
        // 不是标记，是主体名称的一部分
        if (!foundFirstNonTag) {
          // 第一个非标记部分，之前的标记也是名称的一部分
          vehicleNameParts.addAll(tags);
          tags.clear();
          foundFirstNonTag = true;
        }
        vehicleNameParts.add(part);
      }
    }

    // 步骤5: 处理主体名称
    String mainName;
    if (vehicleNameParts.isEmpty) {
      // 如果没有主体名称部分，整个可能都是标记，返回原名
      mainName = parts.join(' ');
    } else {
      // 将主体名称部分用空格连接
      final nameWithSpaces = vehicleNameParts.join(' ');
      // 调用普通翻译
      mainName = getTranslationSync(nameWithSpaces);
    }

    // 步骤6: 组合结果
    if (tags.isEmpty) {
      return mainName;
    }

    // 将标记翻译并用方括号包裹
    final translatedTags = tags.map((tag) {
      final translation = _inGameVehicleTagTranslations[tag] ?? tag;
      return '[$translation]';
    }).join('');

    return '$mainName $translatedTags';
  }

}