// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_consumption.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodConsumption _$FoodConsumptionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FoodConsumption', json, ($checkedConvert) {
      final val = FoodConsumption(
        volume: $checkedConvert('volume', (v) => (v as num?)?.toDouble()),
        oneShotConsume: $checkedConvert('one_shot_consume', (v) => v as bool?),
      );
      return val;
    }, fieldKeyMap: const {'oneShotConsume': 'one_shot_consume'});

Map<String, dynamic> _$FoodConsumptionToJson(FoodConsumption instance) =>
    <String, dynamic>{
      'volume': ?instance.volume,
      'one_shot_consume': ?instance.oneShotConsume,
    };
