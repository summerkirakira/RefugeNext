import '../datasource/models/buyback.dart';
import 'dart:io';
import 'dart:convert';
import '../network/api_service.dart';
import '../network/parsers/buyback_parser.dart';
import '../network/utils.dart' show runAsyncFunctionWithParams;
import './translation.dart';
import '../utils/storage_path.dart';


class BuybackRepo {

  static final BuybackRepo _instance = BuybackRepo._internal();
  final TranslationRepo translationRepo = TranslationRepo();

  BuybackRepo._internal();

  factory BuybackRepo() => _instance;

  Future<String> get _localPath async {
    return await StoragePath.getAppDataPath();
  }
  
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/buyback_items.json');
  }
  
  Future<List<BuybackItem>> readBuybackItems() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      return json.map((e) => BuybackItem.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }
  
  Future<File> writeBuybackItems(List<BuybackItem> items) async {
    final file = await _localFile;
    return file.writeAsString(jsonEncode(items));
  }
  
  Future<List<BuybackItem>> getBuybackItemByPage(int page) async {
    final rsiApiClient = RsiApiClient();
    final response = await rsiApiClient.basicGet(
        endpoint: "account/buy-back-pledges?page=${page}&pagesize=100");
    return parseBuybackItem(response.data);
  }


  List<BuybackItem> translateBuybackItems(List<BuybackItem> items) {
    return items.map((e) {
      e.chinesName = translationRepo.getTranslationSync(e.title);
      return e;
    }).toList();
  }


  Future<List<BuybackItem>> refreshBuybackItems() async {
    List<BuybackItem> buybackItems = [];

    int page = 1;

    bool isEnd = false;
    while (!isEnd) {
      List<int> pages = List.generate(10, (index) => index + page);
      List<List<BuybackItem>> items = await runAsyncFunctionWithParams(
          getBuybackItemByPage, pages, 10);
      for (var item in items) {
        if (item.isEmpty) {
          isEnd = true;
          break;
        }
        buybackItems.addAll(item);
      }
      page += 10;
    }
    buybackItems = translateBuybackItems(buybackItems);
    await writeBuybackItems(buybackItems);
    return buybackItems;
  }
}