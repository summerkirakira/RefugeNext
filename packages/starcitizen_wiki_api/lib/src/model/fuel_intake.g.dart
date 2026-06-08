// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fuel_intake.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FuelIntake _$FuelIntakeFromJson(Map<String, dynamic> json) => $checkedCreate(
  'FuelIntake',
  json,
  ($checkedConvert) {
    final val = FuelIntake(
      fuelPushRate: $checkedConvert(
        'fuel_push_rate',
        (v) => (v as num?)?.toDouble(),
      ),
      minimumRate: $checkedConvert(
        'minimum_rate',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'fuelPushRate': 'fuel_push_rate',
    'minimumRate': 'minimum_rate',
  },
);

Map<String, dynamic> _$FuelIntakeToJson(FuelIntake instance) =>
    <String, dynamic>{
      'fuel_push_rate': ?instance.fuelPushRate,
      'minimum_rate': ?instance.minimumRate,
    };
