// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_item_uex_prices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameItemUexPrices _$GameItemUexPricesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GameItemUexPrices', json, ($checkedConvert) {
      final val = GameItemUexPrices(
        purchase: $checkedConvert(
          'purchase',
          (v) => (v as List<dynamic>?)
              ?.map((e) => UexPrice.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$GameItemUexPricesToJson(GameItemUexPrices instance) =>
    <String, dynamic>{
      'purchase': ?instance.purchase?.map((e) => e.toJson()).toList(),
    };
