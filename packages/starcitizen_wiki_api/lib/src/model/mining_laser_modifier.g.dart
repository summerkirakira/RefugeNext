// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mining_laser_modifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MiningLaserModifier _$MiningLaserModifierFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MiningLaserModifier', json, ($checkedConvert) {
      final val = MiningLaserModifier(
        name: $checkedConvert('name', (v) => v as String?),
        displayName: $checkedConvert('display_name', (v) => v as String?),
        value: $checkedConvert('value', (v) => (v as num?)?.toDouble()),
      );
      return val;
    }, fieldKeyMap: const {'displayName': 'display_name'});

Map<String, dynamic> _$MiningLaserModifierToJson(
  MiningLaserModifier instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'display_name': ?instance.displayName,
  'value': ?instance.value,
};
