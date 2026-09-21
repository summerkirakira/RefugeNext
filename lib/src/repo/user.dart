import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:synchronized/synchronized.dart';

import '../datasource/models/user.dart';
import '../utils/storage_path.dart';

class UserRepo {
  static final Lock _lock = Lock();
  Future<String> get _localPath async {
    return await StoragePath.getAppDataPath();
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/users.json');
  }

  Future<List<User>> readUsers() async {
    return await _lock.synchronized(() async {
      try {
        final file = await _localFile;
        final contents = await file.readAsString();
        final List<dynamic> json = jsonDecode(contents);
        return json.map((e) => User.fromJson(e)).toList();
      } catch (e) {
        return [];
      }
    });
  }

  Future<File> writeUsers(List<User> items) async {
    return await _lock.synchronized(() async {
      final file = await _localFile;
      return file.writeAsString(jsonEncode(items));
    });
  }

  Future<void> addUser(User user,
      {bool replaceCredentials = false, bool selectUser = false}) async {
    await _lock.synchronized(() async {
      final users = await _readUnlocked();
      final existing = users.where((u) => u.handle == user.handle).firstOrNull;
      final updated = !replaceCredentials && existing != null
          ? user.copyWith(
              rsiToken: existing.rsiToken, rsiDevice: existing.rsiDevice)
          : user;
      users.removeWhere((u) => u.handle == user.handle);
      users.add(updated);
      final file = await _localFile;
      await file.writeAsString(jsonEncode(users));
      if (selectUser) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('vip.kirakira.user.handle', user.handle);
      }
    });
  }

  Future<List<User>> _readUnlocked() async {
    try {
      final data = jsonDecode(await (await _localFile).readAsString()) as List;
      return data.map((e) => User.fromJson(e)).toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> updateSession(
          {required String handle,
          required String token,
          required String device}) =>
      _lock.synchronized(() async {
        final users = await _readUnlocked();
        final index = users.indexWhere((user) => user.handle == handle);
        if (index < 0) return;
        users[index] =
            users[index].copyWith(rsiToken: token, rsiDevice: device);
        await (await _localFile).writeAsString(jsonEncode(users));
      });

  Future<void> removeUser({required String handle}) =>
      _lock.synchronized(() async {
        final users = await _readUnlocked();
        users.removeWhere((user) => user.handle == handle);
        await (await _localFile).writeAsString(jsonEncode(users));
      });

  Future<User?> getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? handle = prefs.getString('vip.kirakira.user.handle');
    if (handle == null) {
      return null;
    }
    return getUser(handle: handle);
  }

  Future<User?> getUser({required String handle}) async {
    List<User> users = await readUsers();

    for (var user in users) {
      if (user.handle == handle) {
        return user;
      }
    }
    return null;
  }
}
