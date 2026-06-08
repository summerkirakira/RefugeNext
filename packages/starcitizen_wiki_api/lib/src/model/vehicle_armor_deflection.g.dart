// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_armor_deflection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleArmorDeflection _$VehicleArmorDeflectionFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('VehicleArmorDeflection', json, ($checkedConvert) {
  final val = VehicleArmorDeflection(
    physical: $checkedConvert('physical', (v) => (v as num?)?.toDouble()),
    energy: $checkedConvert('energy', (v) => (v as num?)?.toDouble()),
    distortion: $checkedConvert('distortion', (v) => (v as num?)?.toDouble()),
    thermal: $checkedConvert('thermal', (v) => (v as num?)?.toDouble()),
    biochemical: $checkedConvert('biochemical', (v) => (v as num?)?.toDouble()),
    stun: $checkedConvert('stun', (v) => (v as num?)?.toDouble()),
  );
  return val;
});

Map<String, dynamic> _$VehicleArmorDeflectionToJson(
  VehicleArmorDeflection instance,
) => <String, dynamic>{
  'physical': ?instance.physical,
  'energy': ?instance.energy,
  'distortion': ?instance.distortion,
  'thermal': ?instance.thermal,
  'biochemical': ?instance.biochemical,
  'stun': ?instance.stun,
};
