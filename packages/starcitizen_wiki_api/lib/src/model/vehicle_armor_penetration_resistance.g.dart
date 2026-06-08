// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_armor_penetration_resistance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleArmorPenetrationResistance _$VehicleArmorPenetrationResistanceFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('VehicleArmorPenetrationResistance', json, (
  $checkedConvert,
) {
  final val = VehicleArmorPenetrationResistance(
    base_: $checkedConvert('base', (v) => (v as num?)?.toDouble()),
    physical: $checkedConvert('physical', (v) => (v as num?)?.toDouble()),
    energy: $checkedConvert('energy', (v) => (v as num?)?.toDouble()),
    distortion: $checkedConvert('distortion', (v) => (v as num?)?.toDouble()),
    thermal: $checkedConvert('thermal', (v) => (v as num?)?.toDouble()),
    biochemical: $checkedConvert('biochemical', (v) => (v as num?)?.toDouble()),
    stun: $checkedConvert('stun', (v) => (v as num?)?.toDouble()),
  );
  return val;
}, fieldKeyMap: const {'base_': 'base'});

Map<String, dynamic> _$VehicleArmorPenetrationResistanceToJson(
  VehicleArmorPenetrationResistance instance,
) => <String, dynamic>{
  'base': ?instance.base_,
  'physical': ?instance.physical,
  'energy': ?instance.energy,
  'distortion': ?instance.distortion,
  'thermal': ?instance.thermal,
  'biochemical': ?instance.biochemical,
  'stun': ?instance.stun,
};
