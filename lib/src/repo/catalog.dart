import 'package:refuge_next/src/network/api_service.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_types.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_property.dart';
import 'dart:convert';
import 'dart:io';
import 'package:refuge_next/src/network/graphql/catalog.dart' show CatalogReq;
import './translation.dart';
import 'shop_catalog_cache.dart';
import '../funcs/shop/catalog_price.dart';
import '../utils/storage_path.dart';

class CatalogRepo {
  static final CatalogRepo _instance = CatalogRepo._internal();
  final TranslationRepo translationRepo = TranslationRepo();

  CatalogRepo._internal() {
    _ready = readCatalogs().then((value) => _catalog = value);
  }

  factory CatalogRepo() => _instance;

  final RsiApiClient rsiApiClient = RsiApiClient();

  late final Future<void> _ready;
  Map<String, List<CatalogProperty>> _catalog = {};

  Future<String> get _localPath async {
    return await StoragePath.getAppDataPath();
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/catalogs.json');
  }

  Future<Map<String, List<CatalogProperty>>> readCatalogs() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      final Map<String, dynamic> json = jsonDecode(contents);
      final cache = ShopCatalogCache();
      final catalogs = json.map((key, value) => MapEntry(
          key,
          (value as List).map((e) {
            final item = CatalogProperty.fromJson(e);
            cache.readItem(e);
            return item;
          }).toList()));
      for (final items in catalogs.values) {
        items.sort((a, b) => CatalogPrice.forItem(a)
            .current
            .compareTo(CatalogPrice.forItem(b).current));
      }
      return catalogs;
    } catch (e) {
      return {};
    }
  }

  Future<File> writeCatalogs(Map<String, List<CatalogProperty>> items) async {
    final file = await _localFile;
    return file.writeAsString(jsonEncode(items.map((key, value) =>
        MapEntry(key, value.map(ShopCatalogCache().writeItem).toList()))));
  }

  List<CatalogProperty> translateCatalog(List<CatalogProperty> catalog) {
    return catalog.map((e) {
      e.title = translationRepo.getTranslationSync(e.title);
      if (e.excerpt != null) {
        e.chineseExcerpt = translationRepo.getTranslationSync(e.excerpt!);
      }
      return e;
    }).toList();
  }

  Future<void> refreshCatalog(CatalogTypes catalogType) async {
    await _ready;
    int page = 1;
    List<CatalogProperty> catalog = [];
    while (true) {
      final response =
          await CatalogReq(page: page, products: [catalogType.value]).execute();
      if (response == null || response.isEmpty) {
        break;
      }
      catalog.addAll(response);
      page++;
    }

    catalog.sort((a, b) => CatalogPrice.forItem(a)
        .current
        .compareTo(CatalogPrice.forItem(b).current));
    catalog = translateCatalog(catalog);

    _catalog[catalogType.value] = catalog;
    await writeCatalogs(_catalog);
  }

  List<CatalogProperty> getCatalog(CatalogTypes catalogType) {
    return _catalog[catalogType.value] ?? [];
  }
}
