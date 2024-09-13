import 'dart:convert';

class TranslationProperty {
  final int id;
  final int productId;
  final String type;
  final String englishTitle;
  final String title;
  final String? excerpt;
  final int fromShip;
  final int toShip;

  TranslationProperty({
    required this.id,
    required this.productId,
    required this.type,
    required this.englishTitle,
    required this.title,
    this.excerpt,
    required this.fromShip,
    required this.toShip,
  });


  factory TranslationProperty.fromJson(Map<String, dynamic> json) {
    return TranslationProperty(
      id: json['id'],
      productId: json['product_id'],
      type: json['type'],
      englishTitle: json['english_title'],
      title: json['title'],
      excerpt: json['excerpt'],
      fromShip: json['from_ship'],
      toShip: json['to_ship'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'type': type,
      'english_title': englishTitle,
      'title': title,
      'excerpt': excerpt,
      'from_ship': fromShip,
      'to_ship': toShip,
    };
  }
}

class ShipAlias {
  final int id;
  final String name;
  String? chineseName;
  final List<String> alias;
  final List<Sku> skus;
  final int? upgradeId;

  ShipAlias({
    required this.id,
    required this.name,
    this.chineseName,
    required this.alias,
    required this.skus,
    this.upgradeId,
  });

  int getHighestSku() {
    if (skus.isEmpty) return 0;
    int highestPrice = skus[0].price;
    for (var sku in skus) {
      if (sku.price > highestPrice) {
        highestPrice = sku.price;
      }
    }
    return highestPrice;
  }

  // JSON 序列化方法
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'chineseName': chineseName,
    'alias': alias,
    'skus': skus.map((sku) => sku.toJson()).toList(),
    'upgradeId': upgradeId ?? '',
  };

  // JSON 反序列化方法
  factory ShipAlias.fromJson(Map<String, dynamic> json) {
    return ShipAlias(
      id: json['id'],
      name: json['name'],
      chineseName: json['chineseName'],
      alias: List<String>.from(json['alias']),
      skus: (json['skus'] as List).map((skuJson) => Sku.fromJson(skuJson)).toList(),
      upgradeId: json['upgrade_id'],
    );
  }

  // 用于打印对象的方法
  @override
  String toString() {
    return jsonEncode(this.toJson());
  }
}

class Sku {
  final String title;
  final int price;

  Sku({
    required this.title,
    required this.price,
  });

  // JSON 序列化方法
  Map<String, dynamic> toJson() => {
    'title': title,
    'price': price,
  };

  // JSON 反序列化方法
  factory Sku.fromJson(Map<String, dynamic> json) {
    return Sku(
      title: json['title'],
      price: json['price'],
    );
  }

  // 用于打印对象的方法
  @override
  String toString() {
    return jsonEncode(this.toJson());
  }
}
