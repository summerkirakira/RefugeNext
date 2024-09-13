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
    final finalKey = key.replaceAll("\n", "").trim();
    return _translation[finalKey] ?? finalKey;
  }

  String getTranslationSync(String key) {
    final finalKey = key.replaceAll("\n", "").trim();
    final keyList = finalKey.split(" - ");
    List<String> translationList = [];
    for (var key in keyList) {
      translationList.add(_translation[key] ?? key);
      if (_translation[key] == null && _translation.isNotEmpty) {
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