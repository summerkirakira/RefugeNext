import '../datasource/models/user.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';


class HangarRepo {

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

  void addUser(User user) async {
    List<User> users = await readUsers();
    users.add(user);
    await writeUsers(users);
  }

  void removeUser({required String handle}) async {
    List<User> users = await readUsers();
    users.removeWhere((element) => element.handle == handle);
    await writeUsers(users);
  }

  Future<User?> getUser({required String handle}) async {
    List<User> users = await readUsers();
    return users.firstWhere((element) => element.handle == handle);
  }

}