enum CatalogTypes {
  standAloneShip,
  pants,
  gear,
  packs,
  addOns,
  uec,
  giftCard,
  package,
  ticket,
  ltiPackage,
  combo,
}

extension CatalogTypesExtension on CatalogTypes {
  String get value {
    switch (this) {
      case CatalogTypes.standAloneShip:
        return "72";
      case CatalogTypes.pants:
        return "268";
      case CatalogTypes.gear:
        return "289";
      case CatalogTypes.packs:
        return "270";
      case CatalogTypes.addOns:
        return "3";
      case CatalogTypes.uec:
        return "41";
      case CatalogTypes.giftCard:
        return "60";
      case CatalogTypes.package:
        return "45";
      case CatalogTypes.ticket:
        return "67";
      case CatalogTypes.ltiPackage:
        return "9";
      case CatalogTypes.combo:
        return "46";
    }
  }
}