import '../datasource/models/user.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TranslationRepo {

  static final TranslationRepo _instance = TranslationRepo._internal();
  TranslationRepo._internal();

  factory TranslationRepo() => _instance;

  Map<String, String> _translation = {};

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/translation.json');
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
    return _translation[key] ?? key;
  }


}