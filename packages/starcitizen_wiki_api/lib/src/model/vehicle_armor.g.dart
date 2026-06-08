// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_armor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleArmor _$VehicleArmorFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'VehicleArmor',
  json,
  ($checkedConvert) {
    final val = VehicleArmor(
      uuid: $checkedConvert('uuid', (v) => v as String?),
      health: $checkedConvert('health', (v) => (v as num?)?.toDouble()),
      signalInfrared: $checkedConvert(
        'signal_infrared',
        (v) => (v as num?)?.toDouble(),
      ),
      signalElectromagnetic: $checkedConvert(
        'signal_electromagnetic',
        (v) => (v as num?)?.toDouble(),
      ),
      signalCrossSection: $checkedConvert(
        'signal_cross_section',
        (v) => (v as num?)?.toDouble(),
      ),
      damagePhysical: $checkedConvert(
        'damage_physical',
        (v) => (v as num?)?.toDouble(),
      ),
      damageEnergy: $checkedConvert(
        'damage_energy',
        (v) => (v as num?)?.toDouble(),
      ),
      damageDistortion: $checkedConvert(
        'damage_distortion',
        (v) => (v as num?)?.toDouble(),
      ),
      damageThermal: $checkedConvert(
        'damage_thermal',
        (v) => (v as num?)?.toDouble(),
      ),
      damageBiochemical: $checkedConvert(
        'damage_biochemical',
        (v) => (v as num?)?.toDouble(),
      ),
      damageStun: $checkedConvert(
        'damage_stun',
        (v) => (v as num?)?.toDouble(),
      ),
      signalMultiplier: $checkedConvert(
        'signal_multiplier',
        (v) => v == null
            ? null
            : VehicleArmorSignalMultiplier.fromJson(v as Map<String, dynamic>),
      ),
      damageMultiplier: $checkedConvert(
        'damage_multiplier',
        (v) => v == null
            ? null
            : VehicleArmorDamageMultiplier.fromJson(v as Map<String, dynamic>),
      ),
      resistanceMultiplier: $checkedConvert(
        'resistance_multiplier',
        (v) => v == null
            ? null
            : VehicleArmorResistanceMultiplier.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      deflection: $checkedConvert(
        'deflection',
        (v) => v == null
            ? null
            : VehicleArmorDeflection.fromJson(v as Map<String, dynamic>),
      ),
      penetrationResistance: $checkedConvert(
        'penetration_resistance',
        (v) => v == null
            ? null
            : VehicleArmorPenetrationResistance.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'signalInfrared': 'signal_infrared',
    'signalElectromagnetic': 'signal_electromagnetic',
    'signalCrossSection': 'signal_cross_section',
    'damagePhysical': 'damage_physical',
    'damageEnergy': 'damage_energy',
    'damageDistortion': 'damage_distortion',
    'damageThermal': 'damage_thermal',
    'damageBiochemical': 'damage_biochemical',
    'damageStun': 'damage_stun',
    'signalMultiplier': 'signal_multiplier',
    'damageMultiplier': 'damage_multiplier',
    'resistanceMultiplier': 'resistance_multiplier',
    'penetrationResistance': 'penetration_resistance',
  },
);

Map<String, dynamic> _$VehicleArmorToJson(VehicleArmor instance) =>
    <String, dynamic>{
      'uuid': ?instance.uuid,
      'health': ?instance.health,
      'signal_infrared': ?instance.signalInfrared,
      'signal_electromagnetic': ?instance.signalElectromagnetic,
      'signal_cross_section': ?instance.signalCrossSection,
      'damage_physical': ?instance.damagePhysical,
      'damage_energy': ?instance.damageEnergy,
      'damage_distortion': ?instance.damageDistortion,
      'damage_thermal': ?instance.damageThermal,
      'damage_biochemical': ?instance.damageBiochemical,
      'damage_stun': ?instance.damageStun,
      'signal_multiplier': ?instance.signalMultiplier?.toJson(),
      'damage_multiplier': ?instance.damageMultiplier?.toJson(),
      'resistance_multiplier': ?instance.resistanceMultiplier?.toJson(),
      'deflection': ?instance.deflection?.toJson(),
      'penetration_resistance': ?instance.penetrationResistance?.toJson(),
    };
