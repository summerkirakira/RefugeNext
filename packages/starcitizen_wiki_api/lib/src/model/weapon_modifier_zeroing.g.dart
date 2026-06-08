// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_modifier_zeroing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeaponModifierZeroing _$WeaponModifierZeroingFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'WeaponModifierZeroing',
  json,
  ($checkedConvert) {
    final val = WeaponModifierZeroing(
      defaultRange: $checkedConvert(
        'default_range',
        (v) => (v as num?)?.toDouble(),
      ),
      maxRange: $checkedConvert('max_range', (v) => (v as num?)?.toDouble()),
      rangeIncrement: $checkedConvert(
        'range_increment',
        (v) => (v as num?)?.toDouble(),
      ),
      autoZeroingTime: $checkedConvert(
        'auto_zeroing_time',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'defaultRange': 'default_range',
    'maxRange': 'max_range',
    'rangeIncrement': 'range_increment',
    'autoZeroingTime': 'auto_zeroing_time',
  },
);

Map<String, dynamic> _$WeaponModifierZeroingToJson(
  WeaponModifierZeroing instance,
) => <String, dynamic>{
  'default_range': ?instance.defaultRange,
  'max_range': ?instance.maxRange,
  'range_increment': ?instance.rangeIncrement,
  'auto_zeroing_time': ?instance.autoZeroingTime,
};
