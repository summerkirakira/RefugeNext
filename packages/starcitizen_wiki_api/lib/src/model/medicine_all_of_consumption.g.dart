// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_all_of_consumption.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicineAllOfConsumption _$MedicineAllOfConsumptionFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'MedicineAllOfConsumption',
  json,
  ($checkedConvert) {
    final val = MedicineAllOfConsumption(
      volume: $checkedConvert('volume', (v) => (v as num?)?.toDouble()),
      oneShotConsume: $checkedConvert('one_shot_consume', (v) => v as bool?),
    );
    return val;
  },
  fieldKeyMap: const {'oneShotConsume': 'one_shot_consume'},
);

Map<String, dynamic> _$MedicineAllOfConsumptionToJson(
  MedicineAllOfConsumption instance,
) => <String, dynamic>{
  'volume': ?instance.volume,
  'one_shot_consume': ?instance.oneShotConsume,
};
