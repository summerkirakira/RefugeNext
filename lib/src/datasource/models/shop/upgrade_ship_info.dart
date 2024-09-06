import 'package:refuge_next/src/network/cirno/property/property.dart';

class UpgradeShipInfo {
  int? id;
  String? name;
  Medias? medias;
  Manufacturer? manufacturer;
  String? focus;
  String? type;
  String? flyableStatus;
  bool? owned;
  int? msrp;
  String? link;
  List<Skus>? skus;
  String chineseName = "";
  ShipAlias? shipAlias;


  UpgradeShipInfo(
      {this.id,
        this.name,
        this.medias,
        this.manufacturer,
        this.focus,
        this.type,
        this.flyableStatus,
        this.owned,
        this.msrp,
        this.link,
        this.skus});

  UpgradeShipInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    medias =
    json['medias'] != null ? new Medias.fromJson(json['medias']) : null;
    manufacturer = json['manufacturer'] != null
        ? new Manufacturer.fromJson(json['manufacturer'])
        : null;
    focus = json['focus'];
    type = json['type'];
    flyableStatus = json['flyableStatus'];
    owned = json['owned'];
    msrp = json['msrp'];
    link = json['link'];
    if (json['skus'] != null) {
      skus = <Skus>[];
      json['skus'].forEach((v) {
        skus!.add(new Skus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.medias != null) {
      data['medias'] = this.medias!.toJson();
    }
    if (this.manufacturer != null) {
      data['manufacturer'] = this.manufacturer!.toJson();
    }
    data['focus'] = this.focus;
    data['type'] = this.type;
    data['flyableStatus'] = this.flyableStatus;
    data['owned'] = this.owned;
    data['msrp'] = this.msrp;
    data['link'] = this.link;
    if (this.skus != null) {
      data['skus'] = this.skus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Medias {
  String? productThumbMediumAndSmall;
  String? slideShow;

  Medias({this.productThumbMediumAndSmall, this.slideShow});

  Medias.fromJson(Map<String, dynamic> json) {
    productThumbMediumAndSmall = json['productThumbMediumAndSmall'];
    slideShow = json['slideShow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productThumbMediumAndSmall'] = this.productThumbMediumAndSmall;
    data['slideShow'] = this.slideShow;
    return data;
  }
}

class Manufacturer {
  int? id;
  String? name;

  Manufacturer({this.id, this.name});

  Manufacturer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Skus {
  int? id;
  String? title;
  bool? available;
  int? price;
  String? body;
  bool? unlimitedStock;
  int? availableStock;

  Skus(
      {this.id,
        this.title,
        this.available,
        this.price,
        this.body,
        this.unlimitedStock,
        this.availableStock});

  Skus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    available = json['available'];
    price = json['price'];
    body = json['body'];
    unlimitedStock = json['unlimitedStock'];
    availableStock = json['availableStock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['available'] = this.available;
    data['price'] = this.price;
    data['body'] = this.body;
    data['unlimitedStock'] = this.unlimitedStock;
    data['availableStock'] = this.availableStock;
    return data;
  }
}
