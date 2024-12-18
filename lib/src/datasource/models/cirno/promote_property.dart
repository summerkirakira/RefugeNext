class PromotionCode {
  final String chineseTitle;
  final String promo;
  final String currency;
  final String code;

  const PromotionCode({
    required this.chineseTitle,
    required this.promo,
    required this.currency,
    required this.code,
  });

  // 从 JSON 创建实例
  factory PromotionCode.fromJson(Map<String, dynamic> json) {
    return PromotionCode(
      chineseTitle: json['chinese_title'] as String,
      promo: json['promo'] as String,
      currency: json['currency'] as String,
      code: json['code'] as String,
    );
  }

  // 转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'chinese_title': chineseTitle,
      'promo': promo,
      'currency': currency,
      'code': code,
    };
  }

  // 复制对象并修改部分属性
  PromotionCode copyWith({
    String? chineseTitle,
    String? promo,
    String? currency,
    String? code,
  }) {
    return PromotionCode(
      chineseTitle: chineseTitle ?? this.chineseTitle,
      promo: promo ?? this.promo,
      currency: currency ?? this.currency,
      code: code ?? this.code,
    );
  }

  // 重写相等运算符
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PromotionCode &&
        other.chineseTitle == chineseTitle &&
        other.promo == promo &&
        other.currency == currency &&
        other.code == code;
  }

  // 重写哈希值
  @override
  int get hashCode => Object.hash(chineseTitle, promo, currency, code);

  // 重写 toString 方法
  @override
  String toString() {
    return 'PromotionCode(chineseTitle: $chineseTitle, promo: $promo, currency: $currency, code: $code)';
  }
}
