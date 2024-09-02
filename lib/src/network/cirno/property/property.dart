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
