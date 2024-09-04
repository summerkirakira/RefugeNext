import '../datasource/models/searchProperty.dart';
import '../datasource/models/hangar.dart';


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

List<HangarItem> processSearch(List<HangarItem> items, SearchProperty? searchKey) {
  if (searchKey == null) {
    return items;
  }
  return items.where((item) {
    return isKeepItem(item, searchKey);
  }).toList();
}