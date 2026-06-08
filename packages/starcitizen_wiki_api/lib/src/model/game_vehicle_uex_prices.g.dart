// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_uex_prices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleUexPrices _$GameVehicleUexPricesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GameVehicleUexPrices', json, ($checkedConvert) {
  final val = GameVehicleUexPrices(
    purchase: $checkedConvert(
      'purchase',
      (v) => (v as List<dynamic>?)
          ?.map((e) => UexPrice.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    rental: $checkedConvert(
      'rental',
      (v) => (v as List<dynamic>?)
          ?.map((e) => UexPrice.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$GameVehicleUexPricesToJson(
  GameVehicleUexPrices instance,
) => <String, dynamic>{
  'purchase': ?instance.purchase?.map((e) => e.toJson()).toList(),
  'rental': ?instance.rental?.map((e) => e.toJson()).toList(),
};
