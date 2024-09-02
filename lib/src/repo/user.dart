import '../datasource/models/user.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserRepo {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/users.json');
  }

  Future<List<User>> readUsers() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      return json.map((e) => User.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<File> writeUsers(List<User> items) async {
    final file = await _localFile;
    return file.writeAsString(jsonEncode(items));
  }

  Future<void> addUser(User user) async {
    removeUser(handle: user.handle);
    List<User> users = await readUsers();
    List<User> newUsers = [];
    for (var u in users) {
      if (u.handle != user.handle) {
        newUsers.add(u);
      }
    }
    newUsers.add(user);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('vip.kirakira.user.handle', user.handle);
    await writeUsers(newUsers);
  }

  Future<void> removeUser({required String handle}) async {
    List<User> users = await readUsers();
    users.removeWhere((element) => element.handle == handle);
    await writeUsers(users);
  }

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
