import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';


/// tests for ManufacturersApi
void main() {
  final instance = StarcitizenWikiApi().getManufacturersApi();

  group(ManufacturersApi, () {
    // In-Game Manufacturer Detail
    //
    // Retrieve a manufacturer by name, UUID, or code together with its products.
    //
    //Future<GetManufacturer200Response> getManufacturer(String manufacturer) async
    test('test getManufacturer', () async {
      // TODO
    });

    // In-Game Manufacturers Overview
    //
    // Returns paginated manufacturers grouped by name with optional pagination.
    //
    //Future<ListManufacturers200Response> listManufacturers({ int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String filterLeftSquareBracketNameRightSquareBracket }) async
    test('test listManufacturers', () async {
      // TODO
    });

    // In-Game Manufacturer Search (Deprecated)
    //
    // Deprecated. Use GET /api/manufacturers?filter[name]={value} for name search. This endpoint will be removed in a future version.
    //
    //Future<ListManufacturers200Response> searchManufacturersDeprecated(Object body, { int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket }) async
    test('test searchManufacturersDeprecated', () async {
      // TODO
    });

  });
}
