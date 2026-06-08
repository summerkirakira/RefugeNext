// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_armor_damage_multiplier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleArmorDamageMultiplier _$VehicleArmorDamageMultiplierFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'VehicleArmorDamageMultiplier',
  json,
  ($checkedConvert) {
    final val = VehicleArmorDamageMultiplier(
      physical: $checkedConvert('physical', (v) => (v as num?)?.toDouble()),
      physicalChange: $checkedConvert(
        'physical_change',
        (v) => (v as num?)?.toDouble(),
      ),
      energy: $checkedConvert('energy', (v) => (v as num?)?.toDouble()),
      energyChange: $checkedConvert(
        'energy_change',
        (v) => (v as num?)?.toDouble(),
      ),
      distortion: $checkedConvert('distortion', (v) => (v as num?)?.toDouble()),
      distortionChange: $checkedConvert(
        'distortion_change',
        (v) => (v as num?)?.toDouble(),
      ),
      thermal: $checkedConvert('thermal', (v) => (v as num?)?.toDouble()),
      thermalChange: $checkedConvert(
        'thermal_change',
        (v) => (v as num?)?.toDouble(),
      ),
      biochemical: $checkedConvert(
        'biochemical',
        (v) => (v as num?)?.toDouble(),
      ),
      biochemicalChange: $checkedConvert(
        'biochemical_change',
        (v) => (v as num?)?.toDouble(),
      ),
      stun: $checkedConvert('stun', (v) => (v as num?)?.toDouble()),
      stunChange: $checkedConvert(
        'stun_change',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'physicalChange': 'physical_change',
    'energyChange': 'energy_change',
    'distortionChange': 'distortion_change',
    'thermalChange': 'thermal_change',
    'biochemicalChange': 'biochemical_change',
    'stunChange': 'stun_change',
  },
);

Map<String, dynamic> _$VehicleArmorDamageMultiplierToJson(
  VehicleArmorDamageMultiplier instance,
) => <String, dynamic>{
  'physical': ?instance.physical,
  'physical_change': ?instance.physicalChange,
  'energy': ?instance.energy,
  'energy_change': ?instance.energyChange,
  'distortion': ?instance.distortion,
  'distortion_change': ?instance.distortionChange,
  'thermal': ?instance.thermal,
  'thermal_change': ?instance.thermalChange,
  'biochemical': ?instance.biochemical,
  'biochemical_change': ?instance.biochemicalChange,
  'stun': ?instance.stun,
  'stun_change': ?instance.stunChange,
};
