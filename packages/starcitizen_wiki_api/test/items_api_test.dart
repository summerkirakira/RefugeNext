import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';


/// tests for ItemsApi
void main() {
  final instance = StarcitizenWikiApi().getItemsApi();

  group(ItemsApi, () {
    // In-Game Armor Detail
    //
    // Retrieve a specific armor item by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to armor. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.
    //
    //Future<GetWeapon200Response> getArmor(String identifier, { String locale, String include, String version }) async
    test('test getArmor', () async {
      // TODO
    });

    // In-Game Clothing Detail
    //
    // Retrieve a specific clothing item by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to clothing. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.
    //
    //Future<GetWeapon200Response> getClothingItem(String identifier, { String locale, String include, String version }) async
    test('test getClothingItem', () async {
      // TODO
    });

    // In-Game Food Detail
    //
    // Retrieve a specific food or drink item by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to food. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.
    //
    //Future<GetWeapon200Response> getFood(String identifier, { String locale, String include, String version }) async
    test('test getFood', () async {
      // TODO
    });

    // In-Game Item Detail
    //
    // Retrieve a specific item by UUID, slug, name, or class name (case-insensitive). Results are scoped to the requested or default game version. Always includes manufacturer, game version, description data, entity tags, commodities, and variant group data. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items. Items with a matching vehicle record automatically redirect to GET /api/vehicles/{uuid}.
    //
    //Future<GetWeapon200Response> getItem(String identifier, { String locale, String include, String version }) async
    test('test getItem', () async {
      // TODO
    });

    // In-Game Vehicle Item Detail
    //
    // Retrieve a specific vehicle component by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to vehicle items. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.
    //
    //Future<GetWeapon200Response> getVehicleItem(String identifier, { String locale, String include, String version }) async
    test('test getVehicleItem', () async {
      // TODO
    });

    // In-Game Vehicle Weapon Detail
    //
    // Retrieve a specific vehicle weapon by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to vehicle weapons. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.
    //
    //Future<GetWeapon200Response> getVehicleWeapon(String identifier, { String locale, String include, String version }) async
    test('test getVehicleWeapon', () async {
      // TODO
    });

    // In-Game Weapon Detail
    //
    // Retrieve a specific FPS weapon by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to weapons. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.
    //
    //Future<GetWeapon200Response> getWeapon(String identifier, { String locale, String include, String version }) async
    test('test getWeapon', () async {
      // TODO
    });

    // In-Game Weapon Attachment Detail
    //
    // Retrieve a specific weapon attachment by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to weapon attachments. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.
    //
    //Future<GetWeapon200Response> getWeaponAttachment(String identifier, { String locale, String include, String version }) async
    test('test getWeaponAttachment', () async {
      // TODO
    });

    // In-Game Armor Overview
    //
    // Alias for /api/items scoped to armor (FPS.Armor.* classification). Results are scoped to the requested or default game version. Returns armor items with manufacturer, game version, and description data.
    //
    //Future<ListWeapons200Response> listArmor({ int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String include, String version, String sort, String filterLeftSquareBracketManufacturerRightSquareBracket, String filterLeftSquareBracketNameRightSquareBracket, String filterLeftSquareBracketClassificationRightSquareBracket, String filterLeftSquareBracketQueryRightSquareBracket, bool filterLeftSquareBracketIncludeIrrelevantRightSquareBracket }) async
    test('test listArmor', () async {
      // TODO
    });

    // In-Game Clothes Overview
    //
    // Alias for /api/items scoped to clothing (FPS.Clothing.* classification). Results are scoped to the requested or default game version. Returns clothing items with manufacturer, game version, and description data.
    //
    //Future<ListWeapons200Response> listClothes({ int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String include, String version, String sort, String filterLeftSquareBracketManufacturerRightSquareBracket, String filterLeftSquareBracketNameRightSquareBracket, String filterLeftSquareBracketClassificationRightSquareBracket, String filterLeftSquareBracketQueryRightSquareBracket, bool filterLeftSquareBracketIncludeIrrelevantRightSquareBracket }) async
    test('test listClothes', () async {
      // TODO
    });

    // In-Game Food Overview
    //
    // Alias for /api/items scoped to food and drink (Food, Bottle, Drink types). Results are scoped to the requested or default game version. Returns consumable items with manufacturer, game version, and description data.
    //
    //Future<ListWeapons200Response> listFood({ int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String include, String version, String sort, String filterLeftSquareBracketManufacturerRightSquareBracket, String filterLeftSquareBracketNameRightSquareBracket, String filterLeftSquareBracketQueryRightSquareBracket, bool filterLeftSquareBracketIncludeIrrelevantRightSquareBracket }) async
    test('test listFood', () async {
      // TODO
    });

    // In-Game Item Filters
    //
    // Returns available filter facet values for in-game items, grouped by field with occurrence counts. Applying other filters narrows the facet results. Use these values as filter[*] parameters on GET /api/items. Scoped to the default item category unless filter[category] is specified.
    //
    //Future<ListItemFilters200Response> listItemFilters({ String version, bool filterLeftSquareBracketVariantsRightSquareBracket, String filterLeftSquareBracketCategoryRightSquareBracket, String filterLeftSquareBracketTypeRightSquareBracket, String filterLeftSquareBracketSubTypeRightSquareBracket, String filterLeftSquareBracketManufacturerRightSquareBracket, String filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket, String filterLeftSquareBracketClassNameRightSquareBracket, String filterLeftSquareBracketNameRightSquareBracket, String filterLeftSquareBracketQueryRightSquareBracket, String filterLeftSquareBracketClassificationRightSquareBracket, num filterLeftSquareBracketSizeRightSquareBracket, num filterLeftSquareBracketGradeRightSquareBracket, String filterLeftSquareBracketClassRightSquareBracket, String filterLeftSquareBracketRarityRightSquareBracket, String filterLeftSquareBracketEventSourceRightSquareBracket, bool filterLeftSquareBracketIncludeIrrelevantRightSquareBracket }) async
    test('test listItemFilters', () async {
      // TODO
    });

    // In-Game Item Overview
    //
    // Returns paginated in-game items for the requested category and game version. Always includes manufacturer, game version, and description data. Crafting blueprints are loaded automatically. Supports filtering by type, classification, manufacturer, size, grade, and more. Available includes: shops, variants, related_items, blueprints, vehicles, shops.items. Supports 150+ JSON field sorts. (see GET /api/items/filters for valid filter values)
    //
    //Future<ListWeapons200Response> listItems({ int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String include, String version, String sort, bool filterLeftSquareBracketVariantsRightSquareBracket, String filterLeftSquareBracketCategoryRightSquareBracket, String filterLeftSquareBracketTypeRightSquareBracket, String filterLeftSquareBracketSubTypeRightSquareBracket, String filterLeftSquareBracketManufacturerRightSquareBracket, String filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket, String filterLeftSquareBracketClassNameRightSquareBracket, String filterLeftSquareBracketNameRightSquareBracket, String filterLeftSquareBracketQueryRightSquareBracket, String filterLeftSquareBracketClassificationRightSquareBracket, num filterLeftSquareBracketSizeRightSquareBracket, num filterLeftSquareBracketGradeRightSquareBracket, String filterLeftSquareBracketClassRightSquareBracket, String filterLeftSquareBracketRarityRightSquareBracket, String filterLeftSquareBracketEventSourceRightSquareBracket, bool filterLeftSquareBracketIncludeIrrelevantRightSquareBracket, String filterLeftSquareBracketTagsRightSquareBracket, String filterLeftSquareBracketPortTagsRightSquareBracket, String filterLeftSquareBracketVehicleRightSquareBracket }) async
    test('test listItems', () async {
      // TODO
    });

    // In-Game Vehicle Items Overview
    //
    // Alias for /api/items scoped to vehicle components (coolers, shields, power plants, quantum drives, thrusters, etc.). Results are scoped to the requested or default game version. Returns component items with manufacturer, game version, and description data.
    //
    //Future<ListWeapons200Response> listVehicleItems({ int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String include, String version, String sort, String filterLeftSquareBracketManufacturerRightSquareBracket, String filterLeftSquareBracketNameRightSquareBracket, String filterLeftSquareBracketTypeRightSquareBracket, String filterLeftSquareBracketSubTypeRightSquareBracket, String filterLeftSquareBracketQueryRightSquareBracket, bool filterLeftSquareBracketIncludeIrrelevantRightSquareBracket }) async
    test('test listVehicleItems', () async {
      // TODO
    });

    // In-Game Vehicle Weapons Overview
    //
    // Alias for /api/items scoped to vehicle weapons (WeaponGun type). Results are scoped to the requested or default game version. Returns ship weapon items with manufacturer, game version, and description data.
    //
    //Future<ListWeapons200Response> listVehicleWeapons({ int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String include, String version, String sort, String filterLeftSquareBracketManufacturerRightSquareBracket, String filterLeftSquareBracketNameRightSquareBracket, String filterLeftSquareBracketQueryRightSquareBracket, num filterLeftSquareBracketSizeRightSquareBracket, bool filterLeftSquareBracketIncludeIrrelevantRightSquareBracket }) async
    test('test listVehicleWeapons', () async {
      // TODO
    });

    // In-Game Weapon Attachments Overview
    //
    // Alias for /api/items scoped to weapon attachments (WeaponAttachment type, excluding magazines and missiles). Results are scoped to the requested or default game version. Returns attachment items with manufacturer, game version, and description data.
    //
    //Future<ListWeapons200Response> listWeaponAttachments({ int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String include, String version, String sort, String filterLeftSquareBracketManufacturerRightSquareBracket, String filterLeftSquareBracketNameRightSquareBracket, String filterLeftSquareBracketQueryRightSquareBracket, num filterLeftSquareBracketSizeRightSquareBracket, bool filterLeftSquareBracketIncludeIrrelevantRightSquareBracket }) async
    test('test listWeaponAttachments', () async {
      // TODO
    });

    // In-Game Weapons Overview
    //
    // Alias for /api/items scoped to FPS weapons (WeaponPersonal type). Results are scoped to the requested or default game version. Returns weapon items with manufacturer, game version, and description data.
    //
    //Future<ListWeapons200Response> listWeapons({ int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String include, String version, String sort, String filterLeftSquareBracketManufacturerRightSquareBracket, String filterLeftSquareBracketClassNameRightSquareBracket, String filterLeftSquareBracketNameRightSquareBracket, String filterLeftSquareBracketQueryRightSquareBracket, num filterLeftSquareBracketSizeRightSquareBracket, num filterLeftSquareBracketGradeRightSquareBracket, bool filterLeftSquareBracketIncludeIrrelevantRightSquareBracket }) async
    test('test listWeapons', () async {
      // TODO
    });

    // In-Game Item Search (Deprecated)
    //
    // Deprecated. Use GET /api/items?filter[name]={value} for name search. Note: OR search across name/uuid/type is no longer supported. This endpoint will be removed in a future version.
    //
    //Future<ListWeapons200Response> searchItemsDeprecated(Object body, { int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String locale, String include, String sort, bool filterLeftSquareBracketVariantsRightSquareBracket, String filterLeftSquareBracketCategoryRightSquareBracket, String filterLeftSquareBracketTypeRightSquareBracket, String filterLeftSquareBracketSubTypeRightSquareBracket, String filterLeftSquareBracketManufacturerRightSquareBracket, String filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket, String filterLeftSquareBracketClassNameRightSquareBracket, String filterLeftSquareBracketNameRightSquareBracket, String filterLeftSquareBracketClassificationRightSquareBracket, num filterLeftSquareBracketSizeRightSquareBracket, num filterLeftSquareBracketGradeRightSquareBracket, String filterLeftSquareBracketClassRightSquareBracket, bool filterLeftSquareBracketIncludeIrrelevantRightSquareBracket }) async
    test('test searchItemsDeprecated', () async {
      // TODO
    });

  });
}
