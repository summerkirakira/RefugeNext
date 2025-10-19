import '../datasource/models/hangar.dart';
import 'dart:io';
import 'dart:convert';
import '../network/api_service.dart';
import '../network/parsers/hangar_parser.dart';
import '../network/utils.dart' show runAsyncFunctionWithParams;
import '../utils/storage_path.dart';


class HangarRepo {

  static final HangarRepo _instance = HangarRepo._internal();

  HangarRepo._internal();

  factory HangarRepo() => _instance;

  Future<String> get _localPath async {
    return await StoragePath.getAppDataPath();
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/hangar_items.json');
  }

  Future<List<HangarItem>> readHangarItems() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      return json.map((e) => HangarItem.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<File> writeHangarItems(List<HangarItem> items) async {
    final file = await _localFile;
    return file.writeAsString(jsonEncode(items));
  }

  Future<List<HangarItem>> getHangarItemByPage(int page) async {
    final rsiApiClient = RsiApiClient();
    final response = await rsiApiClient.basicGet(endpoint: "account/pledges?page=$page");

    return getHangarItems(content: response.data, page: page);
  }
  
  
  Future<List<HangarItem>> refreshHangarItems() async {
    List<HangarItem> hangarItems = [];
    
    int page = 1;

    bool isEnd = false;
    while (!isEnd) {
      List<int> pages = List.generate(10, (index) => index + page);
      List<List<HangarItem>> results = [];
      results = await runAsyncFunctionWithParams(getHangarItemByPage, pages, 10);

      for (var element in results) {
        if (element.isEmpty) {
          isEnd = true;
        }
        hangarItems.addAll(element);
      }
      page += 10;
    }

    await writeHangarItems(hangarItems);

    return hangarItems;
  }

}