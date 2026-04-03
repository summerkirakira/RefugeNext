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

  Future<int> getHangarTotalPages() async {
    final rsiApiClient = RsiApiClient();
    final response = await rsiApiClient.basicGet(endpoint: "account/pledges?page=0");

    return getTotalPages(response.data);

  }
  
  
  Future<List<HangarItem>> refreshHangarItems() async {
    List<HangarItem> hangarItems = [];

    int page = 1;

    int totalPages = await getHangarTotalPages();

    bool isEnd = false;
    while (!isEnd) {
      List<int> pages = List.generate(10, (index) => index + page);
      if (pages.last > totalPages) {
        isEnd = true;
      }
      try {
        List<List<HangarItem>> results = [];
        results = await runAsyncFunctionWithParams(getHangarItemByPage, pages, pages.length);

        for (var element in results) {
          hangarItems.addAll(element);
        }
      } catch (e) {
        // 批次失败时保存已获取的数据并继续抛出
        if (hangarItems.isNotEmpty) {
          await writeHangarItems(hangarItems);
        }
        rethrow;
      }
      page += 10;
    }

    // 按 id 去重
    final Map<int, HangarItem> uniqueMap = {};
    for (var item in hangarItems) {
      uniqueMap[item.id] = item;
    }
    hangarItems = uniqueMap.values.toList();

    await writeHangarItems(hangarItems);

    return hangarItems;
  }

}