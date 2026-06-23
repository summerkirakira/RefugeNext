import '../datasource/models/user.dart';
import 'dart:io';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../network/cirno/property/property.dart';
import '../utils/storage_path.dart';


class ShipAliasRepo {
  static final ShipAliasRepo _instance = ShipAliasRepo._internal();
  ShipAliasRepo._internal();

  factory ShipAliasRepo() => _instance;

  List<ShipAlias> _shipAliases = [];

  /// uuid → ShipAlias 索引,随 [_shipAliases] 赋值时重建,供 O(1) 查找。
  final Map<String, ShipAlias> _byUuid = {};

  void _rebuildUuidIndex() {
    _byUuid.clear();
    for (final a in _shipAliases) {
      final u = a.uuid;
      if (u != null && u.isNotEmpty) _byUuid[u] = a;
    }
  }

  Future<String> get _localPath async {
    return await StoragePath.getAppDataPath();
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/ship_aliases.json');
  }

  Future<List<ShipAlias>> readShipAliases() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      return json.map((e) => ShipAlias.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<File> writeShipAliases(List<ShipAlias> items, int version) async {
    final file = await _localFile;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('vip.kirakira.ship_aliases.version', version);
    _shipAliases = items;
    _rebuildUuidIndex();

    return file.writeAsString(jsonEncode(items));
  }

  Future<int> getShipAliasesVersion() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('vip.kirakira.ship_aliases.version') ?? 0;
  }

  Future<List<ShipAlias>> getShipAliases() async {
    if (_shipAliases.isNotEmpty) {
      return _shipAliases;
    }
    _shipAliases = await readShipAliases();
    _rebuildUuidIndex();
    return _shipAliases;
  }

  Future<ShipAlias?> getShipAlias(String key) async {
    if (_shipAliases.isEmpty) {
      return null;
    }
    for (var shipAlias in _shipAliases) {
      if (shipAlias.name == key) {
        return shipAlias;
      }
      if (shipAlias.alias.contains(key)) {
        return shipAlias;
      }
    }

    return null;
  }

  Future<ShipAlias?> getShipAliasByUpgradeId(int id) async {
    if (_shipAliases.isEmpty) {
      return null;
    }
    for (var shipAlias in _shipAliases) {
      if (shipAlias.upgradeId == id) {
        return shipAlias;
      }
    }

    return null;
  }

  ShipAlias? getShipAliasByUpgradeIdSync(int id) {
    if (_shipAliases.isEmpty) {
      return null;
    }
    for (var shipAlias in _shipAliases) {
      if (shipAlias.upgradeId == id) {
        return shipAlias;
      }
    }

    return null;
  }

  ShipAlias? getShipAliasByUuidSync(String uuid) => _byUuid[uuid];

  ShipAlias? getShipAliasSync(String key) {
    if (_shipAliases.isEmpty) {
      return null;
    }
    for (var shipAlias in _shipAliases) {
      if (shipAlias.name == key) {
        return shipAlias;
      }
      if (shipAlias.alias.contains(key)) {
        return shipAlias;
      }
    }

    return null;
  }

  List<ShipAlias> getShipAliasesSync() {
    return _shipAliases;
  }

}