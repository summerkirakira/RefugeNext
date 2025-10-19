import 'package:refuge_next/src/datasource/models/hangar/hangar_log.dart';
import 'dart:io';
import 'dart:convert';
import '../network/api_service.dart';
import '../network/parsers/hangar_log_parser.dart';
import '../network/utils.dart' show runAsyncFunctionWithParams;
import '../utils/storage_path.dart';


class HangarLogRepo {

  static final HangarLogRepo _instance = HangarLogRepo._internal();

  HangarLogRepo._internal();

  factory HangarLogRepo() => _instance;

  final parser = HangarLogParser();

  Future<String> get _localPath async {
    return await StoragePath.getAppDataPath();
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/hangar_logs.json');
  }

  Future<List<HangarLog>> readHangarLogs() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      return json.map((e) => HangarLog.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<File> writeHangarLogs(List<HangarLog> items) async {
    final file = await _localFile;
    return file.writeAsString(jsonEncode(items));
  }

  Future<List<HangarLog>> getHangarLogByPage(int page) async {
    final rsiApiClient = RsiApiClient();

    final postData = {
      "page": page,
    };

    final response = await rsiApiClient.basicPost(endpoint: "api/account/pledgeLog", data: postData);

    if (response.data["data"]["page"] > response.data["data"]["pagecount"]) {
      return [];
    }

    return parser.parseLog(response.data["data"]["rendered"]);
  }


  Future<List<HangarLog>> refreshHangarLogs() async {
    List<HangarLog> hangarLogs = [];

    int page = 1;

    bool isEnd = false;
    while (!isEnd) {
      List<int> pages = List.generate(10, (index) => index + page);
      List<List<HangarLog>> results = [];
      results = await runAsyncFunctionWithParams(getHangarLogByPage, pages, 10);

      for (var element in results) {
        if (element.isEmpty) {
          isEnd = true;
        }
        hangarLogs.addAll(element);
      }
      page += 10;
    }

    await writeHangarLogs(hangarLogs);

    return hangarLogs;
  }

}