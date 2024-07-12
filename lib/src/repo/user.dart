import '../datasource/models/user.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class UserRepo {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/hangar_items.json');
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
    users.add(user);
    await writeUsers(users);
  }

  Future<void> removeUser({required String handle}) async {
    List<User> users = await readUsers();
    users.removeWhere((element) => element.handle == handle);
    await writeUsers(users);
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
