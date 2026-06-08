// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commodity_show_all_of_uex_prices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommodityShowAllOfUexPrices _$CommodityShowAllOfUexPricesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CommodityShowAllOfUexPrices', json, ($checkedConvert) {
  final val = CommodityShowAllOfUexPrices(
    purchase: $checkedConvert(
      'purchase',
      (v) => (v as List<dynamic>?)
          ?.map((e) => UexPrice.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$CommodityShowAllOfUexPricesToJson(
  CommodityShowAllOfUexPrices instance,
) => <String, dynamic>{
  'purchase': ?instance.purchase?.map((e) => e.toJson()).toList(),
};
