import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';


/// tests for ShipMatrixApi
void main() {
  final instance = StarcitizenWikiApi().getShipMatrixApi();

  group(ShipMatrixApi, () {
    // Ship Matrix Vehicle Detail
    //
    // Retrieve a Ship Matrix vehicle by slug. Use the \"include\" query parameter to load additional relationships: components, loaner, skus.
    //
    //Future<GetShipMatrixVehicle200Response> getShipMatrixVehicle(String slug, { String include }) async
    test('test getShipMatrixVehicle', () async {
      // TODO
    });

    // Ship Matrix Vehicle Filters
    //
    // Return all available filter values for Ship Matrix vehicles. Supports cross-filtering: pass filter parameters to get filtered facet counts.
    //
    //Future<ListShipMatrixFilters200Response> listShipMatrixFilters() async
    test('test listShipMatrixFilters', () async {
      // TODO
    });

    // Ship Matrix Vehicles Overview
    //
    // Returns paginated Ship Matrix vehicles with optional filters. SKU variants and loaner vehicles are included by default.
    //
    //Future<ListShipMatrixVehicles200Response> listShipMatrixVehicles({ int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String filterLeftSquareBracketManufacturerRightSquareBracket, String filterLeftSquareBracketSizeRightSquareBracket, String filterLeftSquareBracketTypeRightSquareBracket, String filterLeftSquareBracketFocusRightSquareBracket, String filterLeftSquareBracketProductionStatusRightSquareBracket, String filterLeftSquareBracketNameRightSquareBracket, String sort }) async
    test('test listShipMatrixVehicles', () async {
      // TODO
    });

    // Ship Matrix Vehicle Search (Deprecated)
    //
    // Deprecated. Use GET /api/shipmatrix/vehicles?filter[name]={value} for name search. This endpoint will be removed in a future version.
    //
    //Future<SearchShipMatrixVehiclesDeprecated200Response> searchShipMatrixVehiclesDeprecated(Object body, { int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String filterLeftSquareBracketManufacturerRightSquareBracket, String filterLeftSquareBracketSizeRightSquareBracket, String filterLeftSquareBracketTypeRightSquareBracket, String filterLeftSquareBracketFocusRightSquareBracket, String filterLeftSquareBracketProductionStatusRightSquareBracket }) async
    test('test searchShipMatrixVehiclesDeprecated', () async {
      // TODO
    });

  });
}
