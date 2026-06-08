// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_boost.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AreaBoost _$AreaBoostFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AreaBoost', json, ($checkedConvert) {
      final val = AreaBoost(
        name: $checkedConvert('name', (v) => v as String?),
        globalModifier: $checkedConvert('global_modifier', (v) => v as num?),
      );
      return val;
    }, fieldKeyMap: const {'globalModifier': 'global_modifier'});

Map<String, dynamic> _$AreaBoostToJson(AreaBoost instance) => <String, dynamic>{
  'name': ?instance.name,
  'global_modifier': ?instance.globalModifier,
};
