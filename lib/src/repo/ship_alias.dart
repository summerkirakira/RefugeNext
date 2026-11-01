import 'package:flutter/foundation.dart';
import 'package:synchronized/synchronized.dart';
import 'dart:io';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../network/cirno/property/property.dart';
import '../utils/storage_path.dart';

class ShipAliasRepo extends ChangeNotifier {
  static final ShipAliasRepo _instance = ShipAliasRepo._internal();
  ShipAliasRepo._internal() : _directoryPath = StoragePath.getAppDataPath;

  @visibleForTesting
  ShipAliasRepo.forTesting({required Future<String> Function() directoryPath})
      : _directoryPath = directoryPath;

  final Future<String> Function() _directoryPath;
  final Lock _storageLock = Lock();
  Future<List<ShipAlias>>? _pendingRead;

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

  Future<String> get _localPath => _directoryPath();

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/ship_aliases.json');
  }

  void _publish(List<ShipAlias> items) {
    if (jsonEncode(_shipAliases) == jsonEncode(items)) return;
    _shipAliases = List.unmodifiable(items);
    _rebuildUuidIndex();
    notifyListeners();
  }

  Future<List<ShipAlias>> readShipAliases() =>
      _pendingRead ??= _storageLock.synchronized(() async {
        try {
          final file = await _localFile;
          final List<dynamic> json = jsonDecode(await file.readAsString());
          _publish(json.map((e) => ShipAlias.fromJson(e)).toList());
        } catch (_) {
          // 损坏或缺失时保留当前缓存，后续读取可重试。
        }
        return _shipAliases;
      }).whenComplete(() => _pendingRead = null);

  Future<File> writeShipAliases(List<ShipAlias> items, int version) {
    final next =
        items.map((item) => ShipAlias.fromJson(item.toJson())).toList();
    return _storageLock.synchronized(() async {
      final file = await _localFile;
      final temporary = File('${file.path}.tmp');
      await temporary.writeAsString(jsonEncode(next), flush: true);
      await temporary.rename(file.path);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('vip.kirakira.ship_aliases.version', version);
      _publish(next);
      return file;
    });
  }

  Future<int> getShipAliasesVersion() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('vip.kirakira.ship_aliases.version') ?? 0;
  }

  Future<List<ShipAlias>> getShipAliases() async {
    if (_shipAliases.isNotEmpty) {
      return _shipAliases;
    }
    return readShipAliases();
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
