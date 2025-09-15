import 'package:refuge_next/src/repo/ship_alias.dart';
import 'package:refuge_next/src/widgets/hangar/ccu_optimizor/utils.dart';

import '../datasource/models/buyback.dart';
import '../datasource/models/searchProperty.dart';
import '../datasource/models/hangar.dart';
import '../datasource/models/shop_search_property.dart';
import '../datasource/models/shop/catalog_property.dart';


bool isSearchedType(HangarItem item, List<String> searchType) {
  if (searchType.isEmpty) {
    return true;
  }

  for (var type in searchType) {
    if (type == 'all') {
      return true;
    }
    if (type == "upgrade" && item.isUpgrade) {
      return true;
    }
    if (type == "ship") {
      for (var subItem in item.items) {
        if (subItem.kind == "Ship") {
          return true;
        }
      }
    }
    if (type == "paint") {
      for (var subItem in item.items) {
        if (subItem.kind == "Paint" || subItem.title.toLowerCase().contains("paint") || subItem.title.toLowerCase().contains("skin")) {
          return true;
        }
      }
    }
    if (type == "subscription") {
      if (item.name.toLowerCase().contains("subscriber")) {
        return true;
      }
    }
  }

  return false;
}

bool isSearchStatus(HangarItem item, List<String> statuses) {
  if (statuses.isEmpty) {
    return true;
  }

  for (var status in statuses) {
    if (status == 'all') {
      return true;
    }
    if (status == 'attributed' && item.status == 'Attributed') {
      return true;
    }
    if (status == 'gifted' && item.status == 'Gifted') {
      return true;
    }
  }

  return false;
}

bool isSearchInsurance(HangarItem item, List<String> statuses) {
  if (statuses.isEmpty) {
    return true;
  }

  for (var status in statuses) {
    if (status == 'all') {
      return true;
    }
    if (status == 'lti' && item.insurance == 'LTI') {
      return true;
    }
    if (status == '10y' && item.insurance == '10Y') {
      return true;
    }
    if (status == 'other' && item.insurance != 'LTI') {
      return true;
    }
  }

  return false;
}


bool isPriceRange(HangarItem item, List<String> rangees) {
  if (rangees.isEmpty) {
    return true;
  }

  for (var range in rangees) {
    if (range == 'all') {
      return true;
    }
    if (range == '0-100' && item.price > 0 && item.currentPrice <= 10000) {
      return true;
    }
    if (range == '100-500' && item.price >= 10000 && item.price <= 50000) {
      return true;
    }
    if (range == '500+' && item.price >= 50000) {
      return true;
    }
  }

  return false;
}


bool isSearchReclaimable(HangarItem item, List<String> reclaimStatuses) {
  for (var status in reclaimStatuses) {
    if (status == 'all') {
      return true;
    }
    if (status == 'giftable' && item.canGit) {
      return true;
    }
    if (status == 'reclaimable' && item.canReclaim) {
      return true;
    }
  }
  return false;
}

bool isContainSearchKey(HangarItem item, String? searchKey) {
  if (searchKey == null) {
    return true;
  }
  final key = searchKey.toLowerCase().trim();
  if (key.isEmpty) {
    return true;
  }
  if (item.name.toLowerCase().contains(key)) {
    return true;
  }
  if (item.chineseName!.toLowerCase().contains(key)) {
    return true;
  }
  if (item.alsoContains.toLowerCase().contains(key)) {
    return true;
  }
  if (item.chineseAlsoContains!.toLowerCase().contains(key)) {
    return true;
  }
  for (var subItem in item.items) {
    if (subItem.title.toLowerCase().contains(key)) {
      return true;
    }
    if (subItem.chineseTitle!.toLowerCase().contains(key)) {
      return true;
    }
  }
  return false;
}


bool isFromShip(HangarItem item, List<String> fromShips) {
  if (fromShips.isEmpty) {
    return true;
  }
  for (var fromShip in fromShips) {
    if (fromShip == 'all') {
      return true;
    }
    if (item.fromShip != null && item.fromShip!.id.toString() == fromShip) {
      return true;
    }
  }
  return false;
}

bool isToShip(HangarItem item, List<String> toShips) {
  if (toShips.isEmpty) {
    return true;
  }
  for (var toShip in toShips) {
    if (toShip == 'all') {
      return true;
    }
    if (item.toShip != null && item.toShip!.id.toString() == toShip) {
      return true;
    }
  }
  return false;
}

bool slotSearch(HangarItem item, List<List<UpgradeStep>> slots) {
  if (slots.isEmpty) {
    return true;
  }

  if (!item.isUpgrade) {
    for (var subItem in item.items) {
      if (subItem.kind == "Ship") {
        final ship = ShipAliasRepo().getShipAliasSync(subItem.title);
        if (ship != null) {
          for (var slot in slots) {
            if (slot.isNotEmpty) {
              if (slot.first.fromShip.id == ship.id) {
                return true;
              }
            }
          }
        }
        return false;
      }
    }
  }

  if (item.fromShip == null || item.toShip == null) {
    return false;
  }

  for (var slot in slots) {
    for (var step in slot) {
      if (step.fromShip.id == item.fromShip!.id && step.toShip.id == item.toShip!.id && step.cost == item.price) {
        return true;
      }
    }
  }
  return false;
}


bool isKeepItem(HangarItem item, SearchProperty searchKey) {
  return isSearchedType(item, searchKey.searchType)
      && isSearchStatus(item, searchKey.searchStatus)
      && isSearchInsurance(item, searchKey.searchInsurance)
      && isPriceRange(item, searchKey.priceRange)
      && isSearchReclaimable(item, searchKey.reclaimStatus)
      && isContainSearchKey(item, searchKey.searchText)
      && isFromShip(item, searchKey.fromShip)
      && isToShip(item, searchKey.toShip);
}

List<HangarItem> processSearch(List<HangarItem> items, SearchProperty? searchKey, List<List<UpgradeStep>> slots) {
  if (searchKey == null) {
    return items;
  }
  final filteredItems = items.where((item) {
    return isKeepItem(item, searchKey);
  }).toList();

  final finalItems = filteredItems.where((item) {
    return slotSearch(item, slots);
  }).toList();

  if (!searchKey.orderSelected) {
    return finalItems;
  }
  final sortedItems = sortByPrice(finalItems, searchKey.priceOrder);

  return sortedItems;
}


List<HangarItem> sortByPrice(List<HangarItem> items, bool timeOrder) {
  if (timeOrder) {
    items.sort((a, b) => a.price.compareTo(b.price));
  } else {
    items.sort((a, b) => b.price.compareTo(a.price));
  }
  return items;
}







bool isContainSearchKeyBuyback(BuybackItem item, String? searchKey) {
  if (searchKey == null) {
    return true;
  }
  final key = searchKey.toLowerCase().trim();
  if (key.isEmpty) {
    return true;
  }
  if (item.title.toLowerCase().contains(key)) {
    return true;
  }
  if (item.chinesName!.toLowerCase().contains(key)) {
    return true;
  }
  if (item.alsoContains.toLowerCase().contains(key)) {
    return true;
  }
  return false;
}



bool isSearchedTypeBuyback(BuybackItem item, List<String> searchType) {
  if (searchType.isEmpty) {
    return true;
  }

  for (var type in searchType) {
    if (type == 'all') {
      return true;
    }
    if (type == "upgrade" && item.isUpgrade) {
      return true;
    }
    if (type == "ship") {
      if (item.title.toLowerCase().contains("standalone ship")) {
        return true;
      }
    }
    if (type == "paint") {
      if (item.title.toLowerCase().contains("skie") || item.title.toLowerCase().contains("saint")) {
        return true;
      }
    }
    if (type == "subscription") {
      if (item.title.toLowerCase().contains("subscriber")) {
        return true;
      }
    }
  }

  return false;
}



bool isKeepItemBuyback(BuybackItem item, SearchProperty searchKey) {
  return isSearchedTypeBuyback(item, searchKey.searchType) &&
      isContainSearchKeyBuyback(item, searchKey.searchText);
}



List<BuybackItem> processBuybackSearch(List<BuybackItem> items, SearchProperty? searchKey) {
  if (searchKey == null) {
    return items;
  }

  final filteredItems = items.where((item) {
    return isKeepItemBuyback(item, searchKey);
  }).toList();

  return filteredItems;
}

bool isShopSearchedType(CatalogProperty item, List<String> searchType) {
  if (searchType.isEmpty) {
    return true;
  }

  for (var type in searchType) {
    if (type == 'all') {
      return true;
    }
    if (type == "ship") {
      if (item.type == "Ship" || item.name.toLowerCase().contains("ship")) {
        return true;
      }
    }
    if (type == "paint") {
      if (item.type == "Paint" || item.name.toLowerCase().contains("paint") || item.name.toLowerCase().contains("skin")) {
        return true;
      }
    }
    if (type == "upgrade") {
      if (item.type == "Upgrade" || item.name.toLowerCase().contains("upgrade")) {
        return true;
      }
    }
    if (type == "subscription") {
      if (item.name.toLowerCase().contains("subscriber")) {
        return true;
      }
    }
  }

  return false;
}

bool isShopPriceRange(CatalogProperty item, List<String> priceRange) {
  if (priceRange.isEmpty) {
    return true;
  }

  final price = item.price.amount;

  for (var range in priceRange) {
    if (range == 'all') {
      return true;
    }
    if (range == "0-100" && price >= 0 && price <= 10000) {
      return true;
    }
    if (range == "100-500" && price > 10000 && price <= 50000) {
      return true;
    }
    if (range == "500+" && price > 50000) {
      return true;
    }
  }

  return false;
}

bool isShopStockStatus(CatalogProperty item, List<String> stockStatus) {
  if (stockStatus.isEmpty) {
    return true;
  }

  for (var status in stockStatus) {
    if (status == 'all') {
      return true;
    }
    if (status == "available" && item.stock.unlimited) {
      return true;
    }
    if (status == "unavailable" && !item.stock.unlimited) {
      return true;
    }
  }

  return false;
}

bool isShopItemFlags(CatalogProperty item, List<String> itemFlags) {
  if (itemFlags.isEmpty) {
    return true;
  }

  for (var flag in itemFlags) {
    if (flag == 'all') {
      return true;
    }
    if (flag == "warbond" && item.isWarbond) {
      return true;
    }
    if (flag == "package" && item.isPackage) {
      return true;
    }
    if (flag == "vip" && item.isVip) {
      return true;
    }
  }

  return false;
}

bool isShopSearchText(CatalogProperty item, String? searchText) {
  if (searchText == null || searchText.trim().isEmpty) {
    return true;
  }

  final key = searchText.toLowerCase().trim();
  if (item.name.toLowerCase().contains(key)) {
    return true;
  }
  if (item.title.toLowerCase().contains(key)) {
    return true;
  }
  if (item.subtitle.toLowerCase().contains(key)) {
    return true;
  }
  if (item.excerpt != null && item.excerpt!.toLowerCase().contains(key)) {
    return true;
  }
  if (item.chineseExcerpt != null && item.chineseExcerpt!.toLowerCase().contains(key)) {
    return true;
  }

  return false;
}

bool isKeepShopItem(CatalogProperty item, ShopSearchProperty searchKey) {
  return isShopSearchedType(item, searchKey.searchType)
      && isShopPriceRange(item, searchKey.priceRange)
      && isShopStockStatus(item, searchKey.stockStatus)
      && isShopItemFlags(item, searchKey.itemFlags)
      && isShopSearchText(item, searchKey.searchText);
}

List<CatalogProperty> processShopSearch(List<CatalogProperty> items, ShopSearchProperty? searchKey) {
  if (searchKey == null) {
    return items;
  }

  final filteredItems = items.where((item) {
    return isKeepShopItem(item, searchKey);
  }).toList();

  if (!searchKey.orderSelected) {
    return filteredItems;
  }

  final sortedItems = sortShopByPrice(filteredItems, searchKey.priceOrder);
  return sortedItems;
}

List<CatalogProperty> sortShopByPrice(List<CatalogProperty> items, bool priceOrder) {
  if (priceOrder) {
    items.sort((a, b) => a.price.amount.compareTo(b.price.amount));
  } else {
    items.sort((a, b) => b.price.amount.compareTo(a.price.amount));
  }
  return items;
}